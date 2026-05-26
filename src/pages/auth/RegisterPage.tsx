import { useState, useRef, type ChangeEvent, type FormEvent } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { motion, AnimatePresence } from 'framer-motion';
import { useAuth } from '../../context/AuthContext';
import { supabase } from '../../lib/supabase';
import { Input } from '../../components/ui/Input';
import { Button } from '../../components/ui/Button';
import { Dumbbell, Eye, EyeOff, User, Shield, Upload, ImageIcon, X } from 'lucide-react';
import type { Role } from '../../types/database';

function DniUpload({ side, preview, onFile, uploading, onRemove }: {
  side: 'front' | 'back'; preview: string; onFile: (file: File) => void; uploading: boolean; onRemove: () => void;
}) {
  const fileRef = useRef<HTMLInputElement>(null);
  return (
    <div className="space-y-1.5">
      <label className="block text-sm font-medium text-white/70">
        DNI - Cara {side === 'front' ? 'frontal' : 'trasera'}
      </label>
      {preview ? (
        <div className="relative rounded-xl overflow-hidden border border-dark-border bg-dark-elevated">
          <img src={preview} alt={`DNI ${side}`} className="w-full h-32 object-cover" />
          {!uploading && (
            <button onClick={onRemove} type="button" className="absolute top-2 right-2 p-1 rounded-full bg-black/60 text-white hover:bg-black/80 transition-colors" aria-label="Eliminar">
              <X className="h-4 w-4" />
            </button>
          )}
        </div>
      ) : (
        <button
          type="button"
          onClick={() => fileRef.current?.click()}
          disabled={uploading}
          className="w-full h-32 rounded-xl border-2 border-dashed border-dark-border flex flex-col items-center justify-center gap-1.5 text-white/30 hover:border-mint/30 hover:text-mint/60 transition-all duration-200 disabled:opacity-50"
        >
          <ImageIcon className="h-7 w-7" />
          <span className="text-sm font-medium">Subir foto</span>
        </button>
      )}
      <input ref={fileRef} type="file" accept="image/*" capture="environment" onChange={(e) => { const f = e.target.files?.[0]; if (f) onFile(f); }} className="hidden" />
    </div>
  );
}

export default function RegisterPage() {
  const { signUp } = useAuth();
  const navigate = useNavigate();
  const [fullName, setFullName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [role, setRole] = useState<Role>('cliente');
  const [showPassword, setShowPassword] = useState(false);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [dniFrontPreview, setDniFrontPreview] = useState('');
  const [dniBackPreview, setDniBackPreview] = useState('');
  const [dniFrontFile, setDniFrontFile] = useState<File | null>(null);
  const [dniBackFile, setDniBackFile] = useState<File | null>(null);
  const [trainerCode, setTrainerCode] = useState('');
  const [showCodeModal, setShowCodeModal] = useState(false);
  const [codeError, setCodeError] = useState('');

  function handleDniFile(side: 'front' | 'back', file: File) {
    if (!file.type.startsWith('image/')) { setError('Solo se permiten imagenes'); return; }
    if (file.size > 5 * 1024 * 1024) { setError('La imagen no puede superar 5MB'); return; }
    setError('');
    const preview = URL.createObjectURL(file);
    if (side === 'front') { setDniFrontPreview(preview); setDniFrontFile(file); }
    else { setDniBackPreview(preview); setDniBackFile(file); }
  }

  function validate(): string | null {
    if (!fullName.trim()) return 'El nombre es obligatorio';
    if (password.length < 6) return 'La contrasena debe tener al menos 6 caracteres';
    if (password !== confirmPassword) return 'Las contrasenas no coinciden';
    if (role === 'cliente' && (!dniFrontFile || !dniBackFile)) return 'Debes subir ambas caras del DNI';
    return null;
  }

  async function uploadDni(userId: string, file: File, side: 'front' | 'back') {
    const ext = file.name.split('.').pop() || 'jpg';
    const path = `${userId}/dni_${side}.${ext}`;
    const { error: uploadError } = await supabase.storage.from('dni-uploads').upload(path, file, { upsert: true });
    if (uploadError) throw uploadError;
    const { data: { publicUrl } } = supabase.storage.from('dni-uploads').getPublicUrl(path);
    return publicUrl;
  }

  async function handleSubmit(e: FormEvent) {
    e.preventDefault();
    setError('');
    const validationError = validate();
    if (validationError) { setError(validationError); return; }
    setLoading(true);
    try {
      await signUp(email, password, fullName, role);
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) throw new Error('No se pudo obtener el usuario');
      if (role === 'cliente' && dniFrontFile && dniBackFile) {
        const frontUrl = await uploadDni(user.id, dniFrontFile, 'front');
        const backUrl = await uploadDni(user.id, dniBackFile, 'back');
        const { error: profileError } = await supabase.from('profiles').update({ dni_front_url: frontUrl, dni_back_url: backUrl }).eq('id', user.id);
        if (profileError) throw profileError;
      }
      navigate('/');
    } catch (err) {
      const msg = err instanceof Error ? err.message : 'Error al registrarse';
      setError(msg.includes('already registered') ? 'Este email ya esta registrado' : msg);
    } finally { setLoading(false); }
  }

  return (
    <div className="min-h-screen bg-dark flex items-center justify-center px-4 py-8">
      <div className="w-full max-w-md">
        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ duration: 0.4, ease: 'easeOut' }}>
          <div className="flex items-center justify-center gap-3 mb-10">
            <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-mint/10 glow-mint">
              <Dumbbell className="h-6 w-6 text-mint" />
            </div>
            <h1 className="text-3xl font-bold text-white tracking-tight">KineticArt</h1>
          </div>

          <div className="glass-strong rounded-2xl p-8">
            <h2 className="text-xl font-semibold text-white mb-1">Crear cuenta</h2>
            <p className="text-sm text-white/40 mb-6">Registrate para empezar a entrenar</p>

            {/* Role selector */}
            <div className="grid grid-cols-2 gap-3 mb-6">
              <button type="button" onClick={() => setRole('cliente')}
                className={`relative flex flex-col items-center gap-2 p-4 rounded-xl border-2 transition-all duration-200 ${
                  role === 'cliente' ? 'border-mint/40 bg-mint/5' : 'border-dark-border hover:border-white/20'
                }`}>
                <User className={`h-6 w-6 ${role === 'cliente' ? 'text-mint' : 'text-white/30'}`} />
                <span className={`text-sm font-medium ${role === 'cliente' ? 'text-mint' : 'text-white/40'}`}>Cliente</span>
                {role === 'cliente' && <div className="absolute top-2 right-2 h-2 w-2 rounded-full bg-mint" />}
              </button>
              <button type="button" onClick={() => { if (role === 'entrenador') return; setShowCodeModal(true); setCodeError(''); setTrainerCode(''); }}
                className={`relative flex flex-col items-center gap-2 p-4 rounded-xl border-2 transition-all duration-200 ${
                  role === 'entrenador' ? 'border-flame/40 bg-flame/5' : 'border-dark-border hover:border-white/20'
                }`}>
                <Shield className={`h-6 w-6 ${role === 'entrenador' ? 'text-flame' : 'text-white/30'}`} />
                <span className={`text-sm font-medium ${role === 'entrenador' ? 'text-flame' : 'text-white/40'}`}>Entrenador</span>
                <span className="text-[10px] text-white/25">Codigo requerido</span>
                {role === 'entrenador' && <div className="absolute top-2 right-2 h-2 w-2 rounded-full bg-flame" />}
              </button>
            </div>

            {/* Trainer code modal */}
            <AnimatePresence>
              {showCodeModal && (
                <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
                  className="fixed inset-0 z-50 flex items-center justify-center bg-black/70 p-4">
                  <motion.div initial={{ scale: 0.95, opacity: 0 }} animate={{ scale: 1, opacity: 1 }} exit={{ scale: 0.95, opacity: 0 }}
                    className="glass-strong rounded-2xl w-full max-w-sm p-6">
                    <div className="flex items-center gap-3 mb-4">
                      <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-flame/10">
                        <Shield className="h-5 w-5 text-flame" />
                      </div>
                      <div>
                        <h3 className="font-semibold text-white">Acceso entrenador</h3>
                        <p className="text-xs text-white/40">Introduce el codigo de acceso</p>
                      </div>
                    </div>
                    <input type="password" value={trainerCode}
                      onChange={(e) => { setTrainerCode(e.target.value); setCodeError(''); }}
                      onKeyDown={(e) => { if (e.key === 'Enter') { e.preventDefault(); if (trainerCode === '9794') { setRole('entrenador'); setShowCodeModal(false); } else setCodeError('Codigo incorrecto'); }}}
                      placeholder="Codigo" autoFocus
                      className="input-dark text-center text-lg tracking-[0.3em]" maxLength={10} />
                    {codeError && <p className="text-sm text-flame mt-2 text-center">{codeError}</p>}
                    <div className="flex gap-3 mt-4">
                      <button onClick={() => { if (trainerCode === '9794') { setRole('entrenador'); setShowCodeModal(false); } else setCodeError('Codigo incorrecto'); }}
                        className="flex-1 btn-primary py-2.5 text-sm">Confirmar</button>
                      <button onClick={() => { setShowCodeModal(false); setTrainerCode(''); }}
                        className="flex-1 btn-secondary py-2.5 text-sm">Cancelar</button>
                    </div>
                  </motion.div>
                </motion.div>
              )}
            </AnimatePresence>

            <form onSubmit={handleSubmit} className="space-y-4">
              <Input label="Nombre completo" type="text" value={fullName} onChange={(e) => setFullName(e.target.value)} placeholder="Tu nombre" required autoComplete="name" />
              <Input label="Email" type="email" value={email} onChange={(e) => setEmail(e.target.value)} placeholder="tu@email.com" required autoComplete="email" />
              <div className="relative">
                <Input label="Contrasena" type={showPassword ? 'text' : 'password'} value={password} onChange={(e) => setPassword(e.target.value)} placeholder="Minimo 6 caracteres" required minLength={6} autoComplete="new-password" className="pr-10" />
                <button type="button" onClick={() => setShowPassword(!showPassword)} className="absolute right-3 top-[34px] text-white/30 hover:text-white/60 transition-colors" tabIndex={-1} aria-label={showPassword ? 'Ocultar' : 'Mostrar'}>
                  {showPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
                </button>
              </div>
              <Input label="Confirmar contrasena" type="password" value={confirmPassword} onChange={(e) => setConfirmPassword(e.target.value)} placeholder="Repite tu contrasena" required autoComplete="new-password" />

              {role === 'cliente' && (
                <motion.div initial={{ height: 0, opacity: 0 }} animate={{ height: 'auto', opacity: 1 }} exit={{ height: 0, opacity: 0 }} className="space-y-3 pt-2 overflow-hidden">
                  <div className="flex items-center gap-2 text-sm text-white/50">
                    <Upload className="h-4 w-4" />
                    <span className="font-medium">Sube tu DNI (obligatorio)</span>
                  </div>
                  <div className="grid grid-cols-2 gap-3">
                    <DniUpload side="front" preview={dniFrontPreview} onFile={(f) => handleDniFile('front', f)} uploading={false} onRemove={() => { setDniFrontPreview(''); setDniFrontFile(null); }} />
                    <DniUpload side="back" preview={dniBackPreview} onFile={(f) => handleDniFile('back', f)} uploading={false} onRemove={() => { setDniBackPreview(''); setDniBackFile(null); }} />
                  </div>
                </motion.div>
              )}

              {error && (
                <motion.div initial={{ opacity: 0, y: -4 }} animate={{ opacity: 1, y: 0 }}
                  className="bg-flame/10 border border-flame/20 text-flame text-sm rounded-xl px-4 py-3">{error}</motion.div>
              )}

              <Button type="submit" loading={loading} className="w-full" size="lg">Crear cuenta</Button>
            </form>

            <div className="mt-6 text-center">
              <p className="text-sm text-white/40">
                Ya tienes cuenta?{' '}
                <Link to="/login" className="text-mint font-medium hover:text-mint-light transition-colors">Inicia sesion</Link>
              </p>
            </div>
          </div>
        </motion.div>
      </div>
    </div>
  );
}
