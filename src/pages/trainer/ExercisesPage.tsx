import { useState, useEffect, type FormEvent } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../context/AuthContext';
import { useToast } from '../../context/ToastContext';
import { Button } from '../../components/ui/Button';
import { Card } from '../../components/ui/Card';
import { SkeletonCard } from '../../components/ui/Skeleton';
import type { Exercise } from '../../types/database';
import { Plus, Pencil, Trash2, Search, X, Dumbbell, Play } from 'lucide-react';

const MUSCLE_GROUPS = ['Pecho', 'Espalda', 'Hombros', 'Biceps', 'Triceps', 'Piernas', 'Gluteos', 'Abdominales', 'Antebrazos', 'Pantorrillas', 'Core', 'Cardio'];

interface ExerciseFormData { name: string; description: string; primary_muscle: string; youtube_video_id: string; }
const emptyForm: ExerciseFormData = { name: '', description: '', primary_muscle: 'Pecho', youtube_video_id: '' };

export default function ExercisesPage() {
  const { user } = useAuth();
  const { toast } = useToast();
  const [exercises, setExercises] = useState<Exercise[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState('');
  const [filterMuscle, setFilterMuscle] = useState('');
  const [showForm, setShowForm] = useState(false);
  const [editingId, setEditingId] = useState<string | null>(null);
  const [form, setForm] = useState<ExerciseFormData>(emptyForm);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState('');

  useEffect(() => { fetchExercises(); }, []);

  async function fetchExercises() {
    setLoading(true);
    const { data: userEx } = await supabase.from('exercises').select('*').eq('created_by', user!.id).order('name');
    const { data: libEx } = await supabase.from('training_exercises').select('*').order('name');
    const all = [...(userEx || []), ...(libEx?.map(e => ({ ...e, created_by: 'library' })) || [])];
    setExercises(all);
    setLoading(false);
  }

  function openCreate() { setEditingId(null); setForm(emptyForm); setShowForm(true); setError(''); }
  function openEdit(ex: Exercise) { setEditingId(ex.id); setForm({ name: ex.name, description: ex.description, primary_muscle: ex.primary_muscle, youtube_video_id: ex.youtube_video_id }); setShowForm(true); setError(''); }

  async function handleSubmit(e: FormEvent) {
    e.preventDefault(); setError(''); setSaving(true);
    try {
      if (editingId) {
        const { error: err } = await supabase.from('exercises').update({ ...form, updated_at: new Date().toISOString() }).eq('id', editingId);
        if (err) throw err;
      } else {
        const { error: err } = await supabase.from('exercises').insert({ ...form, created_by: user!.id });
        if (err) throw err;
      }
      await fetchExercises(); setShowForm(false); setForm(emptyForm); setEditingId(null);
      toast(editingId ? 'Ejercicio actualizado' : 'Ejercicio creado', 'success');
    } catch (err) { setError(err instanceof Error ? err.message : 'Error al guardar'); }
    finally { setSaving(false); }
  }

  async function handleDelete(id: string, createdBy: string) {
    if (createdBy === 'library') {
      toast('No puedes eliminar ejercicios de la biblioteca', 'error');
      return;
    }
    const { error } = await supabase.from('exercises').delete().eq('id', id);
    if (!error) { setExercises((prev) => prev.filter((e) => e.id !== id)); toast('Ejercicio eliminado', 'success'); }
  }

  const filtered = exercises.filter((e) => {
    const matchSearch = e.name.toLowerCase().includes(search.toLowerCase()) || e.description.toLowerCase().includes(search.toLowerCase());
    const matchMuscle = !filterMuscle || e.primary_muscle === filterMuscle;
    return matchSearch && matchMuscle;
  });

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-white">Ejercicios</h1>
          <p className="text-white/40 mt-1">{exercises.length} en tu biblioteca</p>
        </div>
        <Button onClick={openCreate} size="sm"><Plus className="h-4 w-4 mr-1" />Nuevo</Button>
      </div>

      <div className="flex flex-col sm:flex-row gap-3">
        <div className="relative flex-1">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-white/30" />
          <input type="text" placeholder="Buscar ejercicio..." value={search} onChange={(e) => setSearch(e.target.value)} className="input-dark pl-10" />
        </div>
        <select value={filterMuscle} onChange={(e) => setFilterMuscle(e.target.value)} className="select-dark w-auto">
          <option value="">Todos</option>
          {MUSCLE_GROUPS.map((m) => <option key={m} value={m}>{m}</option>)}
        </select>
      </div>

      {/* Form modal */}
      <AnimatePresence>
        {showForm && (
          <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
            className="fixed inset-0 z-50 flex items-start justify-center bg-black/70 p-4 overflow-y-auto">
            <motion.div initial={{ scale: 0.95, opacity: 0, y: 20 }} animate={{ scale: 1, opacity: 1, y: 0 }} exit={{ scale: 0.95, opacity: 0 }}
              className="glass-strong rounded-2xl w-full max-w-lg my-8">
            <div className="flex items-center justify-between p-5 border-b border-dark-border/30">
              <h2 className="text-lg font-semibold text-white">{editingId ? 'Editar ejercicio' : 'Nuevo ejercicio'}</h2>
              <button onClick={() => setShowForm(false)} className="text-white/40 hover:text-white/70"><X className="h-5 w-5" /></button>
            </div>
            <form onSubmit={handleSubmit} className="p-5 space-y-4">
              <div className="space-y-1.5">
                <label className="block text-sm font-medium text-white/70">Nombre</label>
                <input type="text" value={form.name} onChange={(e) => setForm({ ...form, name: e.target.value })} placeholder="Press de banca" required className="input-dark" />
              </div>
              <div className="space-y-1.5">
                <label className="block text-sm font-medium text-white/70">Descripcion</label>
                <textarea value={form.description} onChange={(e) => setForm({ ...form, description: e.target.value })} placeholder="Como se realiza..." rows={3}
                  className="input-dark resize-none" />
              </div>
              <div className="space-y-1.5">
                <label className="block text-sm font-medium text-white/70">Musculo principal</label>
                <select value={form.primary_muscle} onChange={(e) => setForm({ ...form, primary_muscle: e.target.value })} className="select-dark">
                  {MUSCLE_GROUPS.map((m) => <option key={m} value={m}>{m}</option>)}
                </select>
              </div>
              <div className="space-y-1.5">
                <label className="block text-sm font-medium text-white/70">ID YouTube (opcional)</label>
                <input type="text" value={form.youtube_video_id} onChange={(e) => setForm({ ...form, youtube_video_id: e.target.value })} placeholder="dQw4w9WgXcQ" className="input-dark" />
              </div>
              {form.youtube_video_id && (
                <div className="rounded-xl overflow-hidden aspect-video bg-dark-elevated">
                  <iframe src={`https://www.youtube.com/embed/${form.youtube_video_id}`} title="Preview" className="w-full h-full" allowFullScreen />
                </div>
              )}
              {error && <div className="bg-flame/10 border border-flame/20 text-flame text-sm rounded-xl px-4 py-3">{error}</div>}
              <div className="flex gap-3 pt-2">
                <Button type="submit" loading={saving} className="flex-1">{editingId ? 'Guardar' : 'Crear'}</Button>
                <Button type="button" variant="secondary" onClick={() => setShowForm(false)}>Cancelar</Button>
              </div>
            </form>
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>

      {/* List */}
      {loading ? (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">{Array.from({ length: 6 }).map((_, i) => <SkeletonCard key={i} />)}</div>
      ) : filtered.length === 0 ? (
        <div className="text-center py-12">
          <Dumbbell className="h-12 w-12 text-white/15 mx-auto mb-3" />
          <p className="text-white/40">{search || filterMuscle ? 'Sin resultados' : 'Sin ejercicios'}</p>
          {!search && !filterMuscle && <Button variant="ghost" onClick={openCreate} className="mt-3"><Plus className="h-4 w-4 mr-1" />Crear ejercicio</Button>}
        </div>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
          {filtered.map((ex) => (
            <motion.div key={ex.id} layout initial={{ opacity: 0 }} animate={{ opacity: 1 }}>
              <Card hover className="group relative">
                {ex.youtube_video_id && (
                  <div className="mb-3 rounded-lg overflow-hidden aspect-video bg-dark-elevated">
                    <iframe src={`https://www.youtube.com/embed/${ex.youtube_video_id}`} title={ex.name} className="w-full h-full" allowFullScreen />
                  </div>
                )}
                <div className="flex items-start justify-between gap-2">
                  <div className="flex-1 min-w-0">
                    <h3 className="font-semibold text-white truncate">{ex.name}</h3>
                    <span className="inline-block mt-1 text-xs font-medium px-2 py-0.5 rounded-full bg-mint/10 text-mint">{ex.primary_muscle}</span>
                    {ex.description && <p className="text-sm text-white/40 mt-2 line-clamp-2">{ex.description}</p>}
                  </div>
                  <div className="flex gap-1 opacity-0 group-hover:opacity-100 transition-opacity">
                    {ex.created_by !== 'library' && (
                      <>
                        <button onClick={() => openEdit(ex)} className="p-1.5 rounded-lg hover:bg-white/5 text-white/40 hover:text-mint"><Pencil className="h-4 w-4" /></button>
                        <button onClick={() => handleDelete(ex.id, ex.created_by)} className="p-1.5 rounded-lg hover:bg-flame/10 text-white/40 hover:text-flame"><Trash2 className="h-4 w-4" /></button>
                      </>
                    )}
                  </div>
                </div>
              </Card>
            </motion.div>
          ))}
        </div>
      )}
    </div>
  );
}
