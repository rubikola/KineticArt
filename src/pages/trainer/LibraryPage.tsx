import { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../context/AuthContext';
import { useToast } from '../../context/ToastContext';
import { Button } from '../../components/ui/Button';
import { Card } from '../../components/ui/Card';
import { SkeletonCard } from '../../components/ui/Skeleton';
import { cn, formatRest } from '../../lib/utils';
import type { Profile } from '../../types/database';
import { Layers, Clock, Award, X, ChevronDown, ChevronUp, Dumbbell, Play } from 'lucide-react';

interface TrainingProgram {
  id: string;
  name: string;
  description: string;
  difficulty_level: 'beginner' | 'intermediate' | 'advanced';
  program_type: string;
  duration_minutes: number | null;
  frequency_per_week: string | null;
  detailed_guide: string | null;
}

interface ProgramExercise {
  id: string;
  program_id: string;
  exercise_id: string;
  order_index: number;
  sets: number;
  reps_min: number;
  reps_max: number;
  rest_seconds: number | null;
  technical_notes: string | null;
  exercise?: {
    id: string;
    name: string;
    primary_muscle: string;
    youtube_video_id: string | null;
    thumbnail_url: string | null;
    description: string | null;
  };
}

const DIFFICULTY_COLORS = {
  beginner: { bg: 'bg-emerald-500/10', text: 'text-emerald-400', label: 'Principiante' },
  intermediate: { bg: 'bg-amber-500/10', text: 'text-amber-400', label: 'Intermedio' },
  advanced: { bg: 'bg-red-500/10', text: 'text-red-400', label: 'Avanzado' },
};

export default function LibraryPage() {
  const { user } = useAuth();
  const { toast } = useToast();
  const [programs, setPrograms] = useState<TrainingProgram[]>([]);
  const [clients, setClients] = useState<Profile[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedProgram, setSelectedProgram] = useState<TrainingProgram | null>(null);
  const [programExercises, setProgramExercises] = useState<ProgramExercise[]>([]);
  const [showPreview, setShowPreview] = useState(false);
  const [showAssign, setShowAssign] = useState(false);
  const [selectedClientId, setSelectedClientId] = useState('');
  const [routineName, setRoutineName] = useState('');
  const [assigning, setAssigning] = useState(false);
  const [filterDifficulty, setFilterDifficulty] = useState('');
  const [expandedEx, setExpandedEx] = useState<string | null>(null);

  useEffect(() => {
    Promise.all([fetchPrograms(), fetchClients()]);
  }, []);

  async function fetchPrograms() {
    setLoading(true);
    const { data } = await supabase.from('training_programs').select('*').order('name');
    setPrograms(data || []);
    setLoading(false);
  }

  async function fetchClients() {
    const { data } = await supabase.from('profiles').select('*').eq('trainer_id', user!.id).eq('role', 'cliente').order('full_name');
    setClients(data || []);
  }

  async function loadProgramExercises(programId: string) {
    const { data } = await supabase
      .from('program_exercises')
      .select('*, exercise:training_exercises(*)')
      .eq('program_id', programId)
      .order('order_index');
    setProgramExercises(data || []);
  }

  function openPreview(program: TrainingProgram) {
    setSelectedProgram(program);
    loadProgramExercises(program.id);
    setShowPreview(true);
  }

  function openAssign(program: TrainingProgram) {
    setSelectedProgram(program);
    setRoutineName(program.name);
    setSelectedClientId(clients[0]?.id || '');
    setShowAssign(true);
  }

  async function handleAssign() {
    if (!selectedClientId || !selectedProgram) return;
    setAssigning(true);
    try {
      const { data: routine } = await supabase
        .from('routines')
        .insert({
          name: routineName || selectedProgram.name,
          client_id: selectedClientId,
          trainer_id: user!.id,
          notes: selectedProgram.detailed_guide || '',
        })
        .select('id')
        .maybeSingle();

      if (!routine) throw new Error('Error creating routine');

      const exercises = await supabase
        .from('program_exercises')
        .select('*')
        .eq('program_id', selectedProgram.id)
        .order('order_index');

      if (exercises.data) {
        const routineExercises = exercises.data.map((ex: any, idx: number) => ({
          routine_id: routine.id,
          exercise_id: ex.exercise_id,
          sets: ex.sets,
          reps: ex.reps_min,
          rest_seconds: ex.rest_seconds || 60,
          order_index: idx,
          notes: ex.technical_notes || '',
        }));

        await supabase.from('routine_exercises').insert(routineExercises);
      }

      toast('Rutina asignada', 'success');
      setShowAssign(false);
      setSelectedProgram(null);
      setRoutineName('');
      setSelectedClientId('');
    } catch (err) {
      toast(err instanceof Error ? err.message : 'Error al asignar', 'error');
    } finally {
      setAssigning(false);
    }
  }

  const filtered = filterDifficulty
    ? programs.filter((p) => p.difficulty_level === filterDifficulty)
    : programs;

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-white">Biblioteca</h1>
        <p className="text-white/40 mt-1">Programas de entrenamiento listos para usar</p>
      </div>

      <div className="flex gap-2 overflow-x-auto pb-2">
        <button
          onClick={() => setFilterDifficulty('')}
          className={cn('px-4 py-2 rounded-xl text-sm font-medium whitespace-nowrap transition-all',
            !filterDifficulty
              ? 'bg-mint/10 text-mint border border-mint/30'
              : 'glass text-white/40 hover:text-white/60'
          )}
        >
          Todos
        </button>
        {Object.entries(DIFFICULTY_COLORS).map(([level, color]) => (
          <button
            key={level}
            onClick={() => setFilterDifficulty(level)}
            className={cn('px-4 py-2 rounded-xl text-sm font-medium whitespace-nowrap transition-all',
              filterDifficulty === level
                ? `${color.bg} ${color.text} border border-current`
                : 'glass text-white/40 hover:text-white/60'
            )}
          >
            {color.label}
          </button>
        ))}
      </div>

      {loading ? (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          {Array.from({ length: 6 }).map((_, i) => <SkeletonCard key={i} />)}
        </div>
      ) : filtered.length === 0 ? (
        <div className="text-center py-12">
          <Layers className="h-12 w-12 text-white/15 mx-auto mb-3" />
          <p className="text-white/40">Sin programas disponibles</p>
        </div>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          {filtered.map((program) => {
            const difficulty = DIFFICULTY_COLORS[program.difficulty_level];
            const exerciseCount = programs.length > 0 ? programExercises.length : 0;
            return (
              <motion.div key={program.id} layout initial={{ opacity: 0 }} animate={{ opacity: 1 }}>
                <Card hover className="flex flex-col h-full">
                  <div className="flex-1">
                    <div className="flex items-start justify-between gap-2 mb-3">
                      <div className="flex-1 min-w-0">
                        <h3 className="font-semibold text-white truncate">{program.name}</h3>
                        <span className={cn('inline-block mt-1 text-xs font-medium px-2 py-0.5 rounded-full', difficulty.bg, difficulty.text)}>
                          {difficulty.label}
                        </span>
                      </div>
                    </div>
                    <p className="text-sm text-white/40 line-clamp-2 mb-4">{program.description}</p>
                    <div className="flex flex-col gap-2 text-xs text-white/50">
                      {program.duration_minutes && (
                        <div className="flex items-center gap-2">
                          <Clock className="h-3.5 w-3.5 text-mint/60" />
                          {program.duration_minutes} minutos
                        </div>
                      )}
                      {program.frequency_per_week && (
                        <div className="flex items-center gap-2">
                          <Award className="h-3.5 w-3.5 text-mint/60" />
                          {program.frequency_per_week}
                        </div>
                      )}
                    </div>
                  </div>
                  <div className="flex gap-2 pt-4 mt-4 border-t border-dark-border/30">
                    <Button
                      variant="secondary"
                      size="sm"
                      className="flex-1"
                      onClick={() => openPreview(program)}
                    >
                      Ver
                    </Button>
                    <Button
                      size="sm"
                      className="flex-1"
                      onClick={() => openAssign(program)}
                    >
                      Asignar
                    </Button>
                  </div>
                </Card>
              </motion.div>
            );
          })}
        </div>
      )}

      {/* Preview modal */}
      <AnimatePresence>
        {showPreview && selectedProgram && (
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            className="fixed inset-0 z-50 flex items-start justify-center bg-black/70 p-4 overflow-y-auto"
          >
            <motion.div
              initial={{ scale: 0.95, opacity: 0, y: 20 }}
              animate={{ scale: 1, opacity: 1, y: 0 }}
              exit={{ scale: 0.95, opacity: 0 }}
              className="glass-strong rounded-2xl w-full max-w-2xl my-8"
            >
              <div className="flex items-center justify-between p-5 border-b border-dark-border/30">
                <h2 className="text-lg font-semibold text-white">{selectedProgram.name}</h2>
                <button
                  onClick={() => setShowPreview(false)}
                  className="text-white/40 hover:text-white/70"
                >
                  <X className="h-5 w-5" />
                </button>
              </div>
              <div className="p-5 space-y-4">
                <div>
                  <h3 className="text-sm font-medium text-white/60 mb-2">Descripción</h3>
                  <p className="text-sm text-white/40">{selectedProgram.description}</p>
                </div>
                {selectedProgram.detailed_guide && (
                  <div>
                    <h3 className="text-sm font-medium text-white/60 mb-2">Guía</h3>
                    <p className="text-sm text-white/40 whitespace-pre-wrap">{selectedProgram.detailed_guide}</p>
                  </div>
                )}
                <div>
                  <h3 className="text-sm font-medium text-white/60 mb-3">Ejercicios ({programExercises.length})</h3>
                  <div className="space-y-2">
                    {programExercises.map((pe, idx) => (
                      <div key={pe.id}>
                        <button
                          onClick={() => setExpandedEx(expandedEx === pe.id ? null : pe.id)}
                          className="w-full flex items-center justify-between p-3 bg-dark-elevated/50 hover:bg-dark-elevated rounded-lg transition-colors text-left"
                        >
                          <div className="flex items-center gap-3 flex-1 min-w-0">
                            <div className="flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-mint/10 text-mint text-xs font-medium">
                              {idx + 1}
                            </div>
                            <div className="flex-1 min-w-0">
                              <p className="text-sm font-medium text-white truncate">{pe.exercise?.name}</p>
                              <p className="text-xs text-white/30">{pe.exercise?.primary_muscle}</p>
                            </div>
                          </div>
                          {expandedEx === pe.id ? (
                            <ChevronUp className="h-4 w-4 text-white/30 shrink-0" />
                          ) : (
                            <ChevronDown className="h-4 w-4 text-white/30 shrink-0" />
                          )}
                        </button>
                        {expandedEx === pe.id && (
                          <motion.div
                            initial={{ height: 0, opacity: 0 }}
                            animate={{ height: 'auto', opacity: 1 }}
                            exit={{ height: 0, opacity: 0 }}
                            className="mt-1 ml-3 border-l border-dark-border/30 pl-3 py-2 space-y-2"
                          >
                            {pe.exercise?.thumbnail_url && (
                              <img
                                src={pe.exercise.thumbnail_url}
                                alt={pe.exercise.name}
                                className="w-full aspect-video object-cover rounded-lg"
                              />
                            )}
                            <div className="flex items-center gap-4 text-xs text-white/50">
                              <span className="font-medium">{pe.sets}x{pe.reps_min}-{pe.reps_max}</span>
                              {pe.rest_seconds && <span className="flex items-center gap-1"><Clock className="h-3 w-3" />{formatRest(pe.rest_seconds)}</span>}
                            </div>
                            {pe.technical_notes && (
                              <p className="text-xs text-white/40 italic">{pe.technical_notes}</p>
                            )}
                            {pe.exercise?.youtube_video_id && (
                              <a
                                href={`https://www.youtube.com/watch?v=${pe.exercise.youtube_video_id}`}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="inline-flex items-center gap-1 text-xs px-2 py-1 rounded-lg bg-flame/10 text-flame hover:bg-flame/20 transition-colors"
                              >
                                <Play className="h-3 w-3" />
                                Video
                              </a>
                            )}
                          </motion.div>
                        )}
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>

      {/* Assign modal */}
      <AnimatePresence>
        {showAssign && selectedProgram && (
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            className="fixed inset-0 z-50 flex items-start justify-center bg-black/70 p-4 overflow-y-auto"
          >
            <motion.div
              initial={{ scale: 0.95, opacity: 0, y: 20 }}
              animate={{ scale: 1, opacity: 1, y: 0 }}
              exit={{ scale: 0.95, opacity: 0 }}
              className="glass-strong rounded-2xl w-full max-w-lg my-8"
            >
              <div className="flex items-center justify-between p-5 border-b border-dark-border/30">
                <h2 className="text-lg font-semibold text-white">Asignar {selectedProgram.name}</h2>
                <button
                  onClick={() => setShowAssign(false)}
                  className="text-white/40 hover:text-white/70"
                >
                  <X className="h-5 w-5" />
                </button>
              </div>
              <div className="p-5 space-y-4">
                <div className="space-y-1.5">
                  <label className="block text-sm font-medium text-white/70">Nombre de la rutina</label>
                  <input
                    type="text"
                    value={routineName}
                    onChange={(e) => setRoutineName(e.target.value)}
                    placeholder="Nombre personalizado..."
                    className="input-dark"
                  />
                </div>
                <div className="space-y-1.5">
                  <label className="block text-sm font-medium text-white/70">Cliente</label>
                  <select
                    value={selectedClientId}
                    onChange={(e) => setSelectedClientId(e.target.value)}
                    className="select-dark"
                  >
                    <option value="">Seleccionar cliente</option>
                    {clients.map((c) => (
                      <option key={c.id} value={c.id}>
                        {c.full_name}
                      </option>
                    ))}
                  </select>
                </div>
                <div className="flex gap-3 pt-2">
                  <Button
                    loading={assigning}
                    onClick={handleAssign}
                    disabled={!selectedClientId}
                    className="flex-1"
                  >
                    Asignar
                  </Button>
                  <Button
                    variant="secondary"
                    onClick={() => setShowAssign(false)}
                  >
                    Cancelar
                  </Button>
                </div>
              </div>
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
