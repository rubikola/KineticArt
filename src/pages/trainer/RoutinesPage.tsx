import { useState, useEffect, type FormEvent } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../context/AuthContext';
import { useToast } from '../../context/ToastContext';
import { Button } from '../../components/ui/Button';
import { Card } from '../../components/ui/Card';
import { SkeletonCard } from '../../components/ui/Skeleton';
import { cn, formatRest, formatDate } from '../../lib/utils';
import type { Profile, Exercise, Routine, RoutineExercise } from '../../types/database';
import { Plus, Trash2, Calendar, GripVertical, X, Pencil, Dumbbell, ChevronDown, ChevronUp, Clock, Layers } from 'lucide-react';

interface RoutineExItem { exercise_id: string; sets: number; reps: number; rest_seconds: number; order_index: number; exercise?: Exercise; }
interface RoutineFormData { name: string; client_id: string; notes: string; exercises: RoutineExItem[]; }
const emptyForm: RoutineFormData = { name: '', client_id: '', notes: '', exercises: [] };

export default function RoutinesPage() {
  const { user } = useAuth();
  const { toast } = useToast();
  const [routines, setRoutines] = useState<(Routine & { client?: Profile; routine_exercises?: (RoutineExercise & { exercise?: Exercise })[] })[]>([]);
  const [clients, setClients] = useState<Profile[]>([]);
  const [allExercises, setAllExercises] = useState<Exercise[]>([]);
  const [loading, setLoading] = useState(true);
  const [showForm, setShowForm] = useState(false);
  const [editingId, setEditingId] = useState<string | null>(null);
  const [form, setForm] = useState<RoutineFormData>(emptyForm);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState('');
  const [expandedRoutine, setExpandedRoutine] = useState<string | null>(null);
  const [addExSearch, setAddExSearch] = useState('');
  const [showExDropdown, setShowExDropdown] = useState(false);

  useEffect(() => { Promise.all([fetchRoutines(), fetchClients(), fetchExercises()]); }, []);

  async function fetchRoutines() {
    setLoading(true);
    const { data } = await supabase.from('routines').select('*, client:profiles!routines_client_id_fkey(*), routine_exercises(*, exercise:exercises(*))')
      .eq('trainer_id', user!.id).order('created_at', { ascending: false });
    setRoutines(data || []); setLoading(false);
  }
  async function fetchClients() {
    const { data } = await supabase.from('profiles').select('*').eq('trainer_id', user!.id).eq('role', 'cliente').order('full_name');
    setClients(data || []);
  }
  async function fetchExercises() {
    const { data } = await supabase.from('exercises').select('*').eq('created_by', user!.id).order('name');
    setAllExercises(data || []);
  }

  function openCreate() { setEditingId(null); setForm({ ...emptyForm, client_id: clients[0]?.id || '' }); setShowForm(true); setError(''); }
  function openEdit(routine: any) {
    setEditingId(routine.id);
    setForm({
      name: routine.name, client_id: routine.client_id, notes: routine.notes,
      exercises: (routine.routine_exercises || []).map((re: any) => ({ exercise_id: re.exercise_id, sets: re.sets, reps: re.reps, rest_seconds: re.rest_seconds, order_index: re.order_index, exercise: re.exercise })),
    });
    setShowForm(true); setError('');
  }

  function addExercise(exercise: Exercise) {
    setForm((prev) => ({ ...prev, exercises: [...prev.exercises, { exercise_id: exercise.id, sets: 3, reps: 10, rest_seconds: 60, order_index: prev.exercises.length, exercise }] }));
    setShowExDropdown(false); setAddExSearch('');
  }
  function removeExercise(index: number) { setForm((prev) => ({ ...prev, exercises: prev.exercises.filter((_, i) => i !== index).map((ex, i) => ({ ...ex, order_index: i })) })); }
  function updateExercise(index: number, field: keyof RoutineExItem, value: number | string) { setForm((prev) => ({ ...prev, exercises: prev.exercises.map((ex, i) => i === index ? { ...ex, [field]: value } : ex) })); }

  async function handleSubmit(e: FormEvent) {
    e.preventDefault(); setError('');
    if (!form.name.trim()) { setError('Nombre obligatorio'); return; }
    if (!form.client_id) { setError('Selecciona un cliente'); return; }
    if (form.exercises.length === 0) { setError('Anade al menos un ejercicio'); return; }
    setSaving(true);
    try {
      if (editingId) {
        await supabase.from('routines').update({ name: form.name, client_id: form.client_id, notes: form.notes, updated_at: new Date().toISOString() }).eq('id', editingId);
        await supabase.from('routine_exercises').delete().eq('routine_id', editingId);
        await supabase.from('routine_exercises').insert(form.exercises.map((ex, i) => ({ routine_id: editingId, exercise_id: ex.exercise_id, sets: ex.sets, reps: ex.reps, rest_seconds: ex.rest_seconds, order_index: i })));
      } else {
        const { data } = await supabase.from('routines').insert({ name: form.name, client_id: form.client_id, trainer_id: user!.id, notes: form.notes }).select('id').maybeSingle();
        if (!data) throw new Error('Error creando rutina');
        await supabase.from('routine_exercises').insert(form.exercises.map((ex, i) => ({ routine_id: data.id, exercise_id: ex.exercise_id, sets: ex.sets, reps: ex.reps, rest_seconds: ex.rest_seconds, order_index: i })));
      }
      await fetchRoutines(); setShowForm(false); setForm(emptyForm); setEditingId(null);
      toast(editingId ? 'Rutina actualizada' : 'Rutina creada', 'success');
    } catch (err) { setError(err instanceof Error ? err.message : 'Error al guardar'); }
    finally { setSaving(false); }
  }

  async function toggleActive(routine: Routine) {
    const { error } = await supabase.from('routines').update({ is_active: !routine.is_active, updated_at: new Date().toISOString() }).eq('id', routine.id);
    if (!error) { setRoutines((prev) => prev.map((r) => r.id === routine.id ? { ...r, is_active: !r.is_active } : r)); toast(routine.is_active ? 'Rutina desactivada' : 'Rutina activada', 'success'); }
  }
  async function deleteRoutine(id: string) {
    const { error } = await supabase.from('routines').delete().eq('id', id);
    if (!error) { setRoutines((prev) => prev.filter((r) => r.id !== id)); toast('Rutina eliminada', 'success'); }
  }

  const filteredExercises = allExercises.filter((e) => e.name.toLowerCase().includes(addExSearch.toLowerCase()) && !form.exercises.some((fe) => fe.exercise_id === e.id));

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div><h1 className="text-2xl font-bold text-white">Rutinas</h1><p className="text-white/40 mt-1">Crea y asigna rutinas</p></div>
        <Button onClick={openCreate} size="sm"><Plus className="h-4 w-4 mr-1" />Nueva</Button>
      </div>

      {/* Form modal */}
      <AnimatePresence>
        {showForm && (
          <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
            className="fixed inset-0 z-50 flex items-start justify-center bg-black/70 p-4 overflow-y-auto">
            <motion.div initial={{ scale: 0.95, opacity: 0, y: 20 }} animate={{ scale: 1, opacity: 1, y: 0 }} exit={{ scale: 0.95, opacity: 0 }}
              className="glass-strong rounded-2xl w-full max-w-2xl my-8">
              <div className="flex items-center justify-between p-5 border-b border-dark-border/30">
                <h2 className="text-lg font-semibold text-white">{editingId ? 'Editar rutina' : 'Nueva rutina'}</h2>
                <button onClick={() => setShowForm(false)} className="text-white/40 hover:text-white/70"><X className="h-5 w-5" /></button>
              </div>
              <form onSubmit={handleSubmit} className="p-5 space-y-5">
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div className="space-y-1.5">
                    <label className="block text-sm font-medium text-white/70">Nombre</label>
                    <input type="text" value={form.name} onChange={(e) => setForm({ ...form, name: e.target.value })} placeholder="Dia de piernas" required className="input-dark" />
                  </div>
                  <div className="space-y-1.5">
                    <label className="block text-sm font-medium text-white/70">Cliente</label>
                    <select value={form.client_id} onChange={(e) => setForm({ ...form, client_id: e.target.value })} className="select-dark" required>
                      <option value="">Seleccionar</option>
                      {clients.map((c) => <option key={c.id} value={c.id}>{c.full_name}</option>)}
                    </select>
                  </div>
                </div>
                <div className="space-y-1.5">
                  <label className="block text-sm font-medium text-white/70">Notas</label>
                  <textarea value={form.notes} onChange={(e) => setForm({ ...form, notes: e.target.value })} rows={2} placeholder="Instrucciones..." className="input-dark resize-none" />
                </div>

                <div className="space-y-3">
                  <h3 className="text-sm font-semibold text-white/60">Ejercicios ({form.exercises.length})</h3>
                  {form.exercises.map((ex, idx) => (
                    <div key={idx} className="bg-dark-elevated rounded-xl p-3 space-y-2 border border-dark-border/50">
                      <div className="flex items-center justify-between">
                        <div className="flex items-center gap-2">
                          <GripVertical className="h-4 w-4 text-white/20" />
                          <span className="text-sm font-medium text-white">{ex.exercise?.name}</span>
                          <span className="text-xs text-white/30">{ex.exercise?.primary_muscle}</span>
                        </div>
                        <button type="button" onClick={() => removeExercise(idx)} className="text-white/30 hover:text-flame"><Trash2 className="h-4 w-4" /></button>
                      </div>
                      <div className="grid grid-cols-3 gap-2">
                        <div><label className="text-xs text-white/40">Series</label><input type="number" min={1} value={ex.sets} onChange={(e) => updateExercise(idx, 'sets', parseInt(e.target.value) || 0)} className="input-dark py-1.5 text-xs" /></div>
                        <div><label className="text-xs text-white/40">Reps</label><input type="number" min={1} value={ex.reps} onChange={(e) => updateExercise(idx, 'reps', parseInt(e.target.value) || 0)} className="input-dark py-1.5 text-xs" /></div>
                        <div><label className="text-xs text-white/40">Descanso (s)</label><input type="number" min={0} value={ex.rest_seconds} onChange={(e) => updateExercise(idx, 'rest_seconds', parseInt(e.target.value) || 0)} className="input-dark py-1.5 text-xs" /></div>
                      </div>
                    </div>
                  ))}
                  <div className="relative">
                    <Button type="button" variant="secondary" size="sm" onClick={() => setShowExDropdown(!showExDropdown)}><Plus className="h-4 w-4 mr-1" />Anadir ejercicio</Button>
                    {showExDropdown && (
                      <div className="absolute z-10 mt-2 w-full glass-strong rounded-xl max-h-60 overflow-y-auto">
                        <div className="p-2 border-b border-dark-border/30">
                          <input type="text" placeholder="Buscar..." value={addExSearch} onChange={(e) => setAddExSearch(e.target.value)} className="input-dark py-1.5 text-sm" autoFocus />
                        </div>
                        {filteredExercises.length === 0 ? <p className="text-sm text-white/30 p-3 text-center">Sin resultados</p> :
                          filteredExercises.map((exercise) => (
                            <button key={exercise.id} type="button" onClick={() => addExercise(exercise)} className="w-full flex items-center gap-2 px-3 py-2 text-sm hover:bg-white/5 text-left">
                              <Dumbbell className="h-4 w-4 text-mint/60" /><span className="text-white">{exercise.name}</span><span className="text-xs text-white/30 ml-auto">{exercise.primary_muscle}</span>
                            </button>
                          ))
                        }
                      </div>
                    )}
                  </div>
                </div>

                {error && <div className="bg-flame/10 border border-flame/20 text-flame text-sm rounded-xl px-4 py-3">{error}</div>}
                <div className="flex gap-3 pt-2">
                  <Button type="submit" loading={saving} className="flex-1">{editingId ? 'Guardar' : 'Crear rutina'}</Button>
                  <Button type="button" variant="secondary" onClick={() => setShowForm(false)}>Cancelar</Button>
                </div>
              </form>
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>

      {/* List */}
      {loading ? <div className="space-y-3">{Array.from({ length: 3 }).map((_, i) => <SkeletonCard key={i} />)}</div>
        : routines.length === 0 ? (
          <div className="text-center py-12"><Calendar className="h-12 w-12 text-white/15 mx-auto mb-3" /><p className="text-white/40">Sin rutinas</p><Button variant="ghost" onClick={openCreate} className="mt-3"><Plus className="h-4 w-4 mr-1" />Crear</Button></div>
        ) : (
          <div className="space-y-3">
            {routines.map((routine) => {
              const isExpanded = expandedRoutine === routine.id;
              const exercises = (routine.routine_exercises || []).sort((a, b) => a.order_index - b.order_index);
              return (
                <Card key={routine.id} padding={false}>
                  <div className="p-4">
                    <div className="flex items-center justify-between">
                      <div className="flex items-center gap-3 flex-1 min-w-0">
                        <div className={cn('flex h-10 w-10 shrink-0 items-center justify-center rounded-xl', routine.is_active ? 'bg-mint/10' : 'bg-dark-elevated')}>
                          <Calendar className={cn('h-5 w-5', routine.is_active ? 'text-mint' : 'text-white/30')} />
                        </div>
                        <div className="flex-1 min-w-0">
                          <div className="flex items-center gap-2">
                            <h3 className="text-sm font-semibold text-white truncate">{routine.name}</h3>
                            <span className={cn('text-xs px-2 py-0.5 rounded-full font-medium', routine.is_active ? 'bg-mint/10 text-mint' : 'bg-white/5 text-white/30')}>
                              {routine.is_active ? 'Activa' : 'Inactiva'}
                            </span>
                          </div>
                          <p className="text-xs text-white/30">{routine.client?.full_name} - {formatDate(routine.assigned_date)}</p>
                        </div>
                      </div>
                      <div className="flex items-center gap-1">
                        <button onClick={() => openEdit(routine)} className="p-1.5 rounded-lg hover:bg-white/5 text-white/30 hover:text-mint"><Pencil className="h-4 w-4" /></button>
                        <button onClick={() => toggleActive(routine)} className={cn('p-1.5 rounded-lg hover:bg-white/5 text-xs', routine.is_active ? 'text-flame' : 'text-mint')}>
                          {routine.is_active ? 'Off' : 'On'}
                        </button>
                        <button onClick={() => deleteRoutine(routine.id)} className="p-1.5 rounded-lg hover:bg-flame/10 text-white/30 hover:text-flame"><Trash2 className="h-4 w-4" /></button>
                        <button onClick={() => setExpandedRoutine(isExpanded ? null : routine.id)} className="p-1.5 rounded-lg hover:bg-white/5 text-white/30">
                          {isExpanded ? <ChevronUp className="h-4 w-4" /> : <ChevronDown className="h-4 w-4" />}
                        </button>
                      </div>
                    </div>
                    {isExpanded && exercises.length > 0 && (
                      <div className="mt-3 pt-3 border-t border-dark-border/30 space-y-2">
                        {exercises.map((re) => (
                          <div key={re.id} className="flex items-center justify-between py-1.5 px-2 rounded-lg bg-dark-elevated/50">
                            <div className="flex items-center gap-2">
                              <Dumbbell className="h-4 w-4 text-mint/50" />
                              <span className="text-sm text-white">{re.exercise?.name}</span>
                              <span className="text-xs text-white/25">{re.exercise?.primary_muscle}</span>
                            </div>
                            <div className="flex items-center gap-3 text-xs text-white/50">
                              <span>{re.sets}x{re.reps}</span>
                              <span>{formatRest(re.rest_seconds)}</span>
                            </div>
                          </div>
                        ))}
                        {routine.notes && <p className="text-xs text-white/30 pt-1 italic">Nota: {routine.notes}</p>}
                      </div>
                    )}
                  </div>
                </Card>
              );
            })}
          </div>
        )
      }
    </div>
  );
}
