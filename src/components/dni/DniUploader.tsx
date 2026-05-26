import { useState, useRef, type ChangeEvent } from 'react';
import { supabase } from '../../lib/supabase';
import { Upload, X, ImageIcon } from 'lucide-react';

interface DniUploaderProps {
  userId: string;
  label: string;
  side: 'front' | 'back';
  currentUrl: string;
  onUploaded: (url: string) => void;
}

export function DniUploader({ userId, label, side, currentUrl, onUploaded }: DniUploaderProps) {
  const [uploading, setUploading] = useState(false);
  const [preview, setPreview] = useState(currentUrl);
  const [error, setError] = useState('');
  const fileRef = useRef<HTMLInputElement>(null);

  async function handleFile(e: ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0];
    if (!file) return;

    if (!file.type.startsWith('image/')) {
      setError('Solo se permiten imagenes');
      return;
    }
    if (file.size > 5 * 1024 * 1024) {
      setError('La imagen no puede superar 5MB');
      return;
    }

    setError('');
    setUploading(true);

    const localPreview = URL.createObjectURL(file);
    setPreview(localPreview);

    const ext = file.name.split('.').pop();
    const path = `${userId}/dni_${side}.${ext}`;

    const { error: uploadError } = await supabase.storage
      .from('dni-uploads')
      .upload(path, file, { upsert: true });

    if (uploadError) {
      setError('Error al subir la imagen');
      setPreview(currentUrl);
      setUploading(false);
      return;
    }

    const { data: { publicUrl } } = supabase.storage.from('dni-uploads').getPublicUrl(path);
    onUploaded(publicUrl);
    setUploading(false);
  }

  function handleRemove() {
    setPreview('');
    onUploaded('');
    if (fileRef.current) fileRef.current.value = '';
  }

  return (
    <div className="space-y-2">
      <label className="block text-sm font-medium text-slate-700">{label}</label>
      {preview ? (
        <div className="relative rounded-lg overflow-hidden border border-slate-200 bg-slate-50">
          <img src={preview} alt={`DNI ${side}`} className="w-full h-40 object-cover" />
          {!uploading && (
            <button
              onClick={handleRemove}
              className="absolute top-2 right-2 p-1 rounded-full bg-black/50 text-white hover:bg-black/70 transition-colors"
            >
              <X className="h-4 w-4" />
            </button>
          )}
          {uploading && (
            <div className="absolute inset-0 flex items-center justify-center bg-black/30">
              <div className="animate-spin h-6 w-6 border-2 border-white border-t-transparent rounded-full" />
            </div>
          )}
        </div>
      ) : (
        <button
          type="button"
          onClick={() => fileRef.current?.click()}
          disabled={uploading}
          className="w-full h-40 rounded-lg border-2 border-dashed border-slate-300 flex flex-col items-center justify-center gap-2 text-slate-400 hover:border-slate-400 hover:text-slate-500 transition-colors disabled:opacity-50"
        >
          {uploading ? (
            <div className="animate-spin h-6 w-6 border-2 border-slate-400 border-t-slate-600 rounded-full" />
          ) : (
            <>
              <ImageIcon className="h-8 w-8" />
              <span className="text-sm font-medium">Subir foto del DNI</span>
              <span className="text-xs">cara {side === 'front' ? 'frontal' : 'trasera'}</span>
            </>
          )}
        </button>
      )}
      <input
        ref={fileRef}
        type="file"
        accept="image/*"
        onChange={handleFile}
        className="hidden"
      />
      {error && <p className="text-sm text-red-600">{error}</p>}
    </div>
  );
}
