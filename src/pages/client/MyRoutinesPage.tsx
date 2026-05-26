import { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../context/AuthContext';
import { Card } from '../../components/ui/Card';
import { SkeletonCard } from '../../components/ui/Skeleton';
import { cn, formatRest, formatDate } from '../../lib/utils';
import type { Routine, RoutineExercise, Profile } from '../../types/database';
import { Calendar, Dumbbell, ChevronDown, ChevronUp, Play, Clock, Layers } from 'lucide-react';

export default function MyRoutinesPage() {
  const { user } = useAuth();
  const [routines, setRoutines] = useState<(Routine & { trainer?: Profile; routine_exercises?: (RoutineExercise & { exercise?: any })[] })[]>([]);
  const [loading, setLoading] = useState(true);
  const [expandedRoutine, setExpandedRoutine] = useState<string | null>(null);
  const [filterActive, setFilterActive] = useState(true);

  useEffect(() => { fetchRoutines(); }, []);

  async function fetchRoutines() {
    setLoading(true);
    const { data } = await supabase.from('routines').select('*, trainer:profiles!routines_trainer_id_fkey(*), routine_exercises(*, exercise:exercises(*))')
      .eq('client_id', user!.id).order('assigned_date', { ascending: false });
    setRoutines(data || []); setLoading(false);
  }

  const filtered = filterActive ? routines.filter((r) => r.is_active) : routines;
  const activeCount = routines.filter((r) => r.is_active).length;

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-white">Mis Rutinas</h1>
        <p className="text-white/40 mt-1">{activeCount} activas</p>
      </div>

      <div className="flex gap-2">
        <button onClick={() => setFilterActive(true)}
          className={cn('px-4 py-2 rounded-xl text-sm font-medium transition-all duration-200',
            filterActive ? 'bg-mint/10 text-mint border border-mint/30' : 'glass text-white/40 hover:text-white/60'
          )}>Activas ({activeCount})</button>
        <button onClick={() => setFilterActive(false)}
          className={cn('px-4 py-2 rounded-xl text-sm font-medium transition-all duration-200',
            !filterActive ? 'bg-mint/10 text-mint border border-mint/30' : 'glass text-white/40 hover:text-white/60'
          )}>Todas ({routines.length})</button>
      </div>

      {loading ? <div className="space-y-3">{Array.from({ length: 3 }).map((_, i) => <SkeletonCard key={i} />)}</div>
        : filtered.length === 0 ? (
          <div className="text-center py-12"><Calendar className="h-12 w-12 text-white/15 mx-auto mb-3" /><p className="text-white/40">{filterActive ? 'Sin rutinas activas' : 'Sin rutinas'}</p></div>
        ) : (
          <div className="space-y-4">
            {filtered.map((routine) => {
              const isExpanded = expandedRoutine === routine.id;
              const exercises = (routine.routine_exercises || []).sort((a, b) => a.order_index - b.order_index);
              const totalSets = exercises.reduce((sum, re) => sum + re.sets, 0);
              return (
                <Card key={routine.id} padding={false}>
                  <button onClick={() => setExpandedRoutine(isExpanded ? null : routine.id)}
                    className="w-full p-4 text-left flex items-center justify-between hover:bg-white/[0.02] transition-colors">
                    <div className="flex items-center gap-3 flex-1 min-w-0">
                      <div className={cn('flex h-11 w-11 shrink-0 items-center justify-center rounded-xl', routine.is_active ? 'bg-mint/10' : 'bg-dark-elevated')}>
                        <Calendar className={cn('h-5 w-5', routine.is_active ? 'text-mint' : 'text-white/30')} />
                      </div>
                      <div className="flex-1 min-w-0">
                        <h3 className="text-sm font-semibold text-white truncate">{routine.name}</h3>
                        <p className="text-xs text-white/30 mt-0.5">{routine.trainer?.full_name} - {formatDate(routine.assigned_date)}</p>
                      </div>
                    </div>
                    <div className="flex items-center gap-3">
                      <div className="hidden sm:flex items-center gap-3 text-xs text-white/30">
                        <span className="flex items-center gap-1"><Layers className="h-3.5 w-3.5" />{exercises.length}</span>
                        <span className="flex items-center gap-1"><Dumbbell className="h-3.5 w-3.5" />{totalSets}</span>
                      </div>
                      {isExpanded ? <ChevronUp className="h-5 w-5 text-white/30" /> : <ChevronDown className="h-5 w-5 text-white/30" />}
                    </div>
                  </button>

                  <AnimatePresence>
                    {isExpanded && (
                      <motion.div initial={{ height: 0, opacity: 0 }} animate={{ height: 'auto', opacity: 1 }} exit={{ height: 0, opacity: 0 }} transition={{ duration: 0.2 }}>
                        <div className="border-t border-dark-border/30">
                          <div className="px-4 py-2.5 bg-dark-elevated/50">
                            <h4 className="text-xs font-semibold text-white/40 uppercase tracking-wider">Ejercicios</h4>
                          </div>
                          <div className="divide-y divide-dark-border/20">
                            {exercises.map((re, idx) => (
                              <div key={re.id} className="px-4 py-3">
                                <div className="flex items-start justify-between gap-3">
                                  <div className="flex items-start gap-3 flex-1">
                                    <div className="flex h-7 w-7 shrink-0 items-center justify-center rounded-full bg-mint/10 text-mint text-xs font-semibold mt-0.5">{idx + 1}</div>
                                    <div className="flex-1">
                                      <div className="flex items-center gap-2">
                                        <span className="text-sm font-medium text-white">{re.exercise?.name}</span>
                                        <span className="text-xs text-white/25">{re.exercise?.primary_muscle}</span>
                                      </div>
                                      <div className="flex items-center gap-4 mt-1 text-xs text-white/50">
                                        <span className="flex items-center gap-1 font-medium"><Layers className="h-3 w-3 text-white/25" />{re.sets}x{re.reps}</span>
                                        <span className="flex items-center gap-1"><Clock className="h-3 w-3 text-white/25" />{formatRest(re.rest_seconds)}</span>
                                      </div>
                                      {re.notes && <p className="text-xs text-white/30 mt-1 italic">{re.notes}</p>}
                                    </div>
                                  </div>
                                  {re.exercise?.youtube_video_id && (
                                    <a href={`https://www.youtube.com/watch?v=${re.exercise.youtube_video_id}`} target="_blank" rel="noopener noreferrer"
                                      className="flex items-center gap-1 shrink-0 px-2 py-1 rounded-lg bg-flame/10 text-flame text-xs font-medium hover:bg-flame/20 transition-colors">
                                      <Play className="h-3 w-3" />Video
                                    </a>
                                  )}
                                </div>
                              </div>
                            ))}
                          </div>
                          {routine.notes && (
                            <div className="px-4 py-3 border-t border-dark-border/20 bg-dark-elevated/50">
                              <p className="text-xs text-white/30"><span className="font-medium">Nota:</span> {routine.notes}</p>
                            </div>
                          )}
                        </div>
                      </motion.div>
                    )}
                  </AnimatePresence>
                </Card>
              );
            })}
          </div>
        )
      }
    </div>
  );
}
