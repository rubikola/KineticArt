import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { motion } from 'framer-motion';
import { useAuth } from '../../context/AuthContext';
import { supabase } from '../../lib/supabase';
import { Card } from '../../components/ui/Card';
import { Button } from '../../components/ui/Button';
import { SkeletonCard } from '../../components/ui/Skeleton';
import { Calendar, MessageCircle, Dumbbell, ArrowRight, Shield } from 'lucide-react';
import { cn, relativeTime } from '../../lib/utils';

const stagger = { animate: { transition: { staggerChildren: 0.06 } } };
const fadeUp = { initial: { opacity: 0, y: 12 }, animate: { opacity: 1, y: 0 } };

export default function ClientDashboard() {
  const { profile, user } = useAuth();
  const navigate = useNavigate();
  const [stats, setStats] = useState({ activeRoutines: 0, conversations: 0 });
  const [trainer, setTrainer] = useState<any>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function load() {
      const [r, c] = await Promise.all([
        supabase.from('routines').select('id', { count: 'exact', head: true }).eq('client_id', user!.id).eq('is_active', true),
        supabase.from('conversations').select('id', { count: 'exact', head: true }).eq('client_id', user!.id),
      ]);
      setStats({ activeRoutines: r.count || 0, conversations: c.count || 0 });
      if (profile?.trainer_id) {
        const { data } = await supabase.from('profiles').select('*').eq('id', profile.trainer_id).maybeSingle();
        setTrainer(data);
      }
      setLoading(false);
    }
    load();
  }, []);

  return (
    <motion.div className="space-y-8" {...stagger}>
      <motion.div {...fadeUp} transition={{ duration: 0.3 }}>
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-2xl font-bold text-white">Hola, {profile?.full_name || 'Cliente'}</h1>
            <p className="text-white/40 mt-1">Tu panel de entrenamiento</p>
          </div>
          <div className="flex items-center gap-2">
            <span className={cn('px-3 py-1 rounded-full text-xs font-medium border',
              profile?.dni_verified ? 'bg-mint/10 text-mint border-mint/20' : 'bg-flame/10 text-flame border-flame/20'
            )}>
              <Shield className="h-3 w-3 inline mr-1" />{profile?.dni_verified ? 'Verificado' : 'Pendiente'}
            </span>
          </div>
        </div>
      </motion.div>

      <motion.div className="grid grid-cols-2 gap-3" {...stagger}>
        {loading ? <>{[0, 1].map((i) => <SkeletonCard key={i} />)}</> : (
          <>
            <motion.div {...fadeUp} transition={{ duration: 0.3 }}>
              <Card hover onClick={() => navigate('/client/routines')}>
                <div className="flex items-center justify-between mb-3">
                  <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-mint/10"><Calendar className="h-4 w-4 text-mint" /></div>
                  <ArrowRight className="h-4 w-4 text-white/20" />
                </div>
                <p className="text-2xl font-bold text-white">{stats.activeRoutines}</p>
                <p className="text-xs text-white/40 mt-0.5">Rutinas activas</p>
              </Card>
            </motion.div>
            <motion.div {...fadeUp} transition={{ duration: 0.3 }}>
              <Card hover onClick={() => navigate('/chat')}>
                <div className="flex items-center justify-between mb-3">
                  <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-flame/10"><MessageCircle className="h-4 w-4 text-flame" /></div>
                  <ArrowRight className="h-4 w-4 text-white/20" />
                </div>
                <p className="text-2xl font-bold text-white">{stats.conversations}</p>
                <p className="text-xs text-white/40 mt-0.5">Conversaciones</p>
              </Card>
            </motion.div>
          </>
        )}
      </motion.div>

      {trainer && (
        <motion.div {...fadeUp} transition={{ duration: 0.3 }}>
          <h2 className="text-sm font-semibold text-white/60 uppercase tracking-wider mb-3">Tu entrenador</h2>
          <Card hover onClick={() => navigate('/chat')}>
            <div className="flex items-center gap-3">
              <div className="flex h-12 w-12 items-center justify-center rounded-full bg-flame/10 text-flame text-lg font-semibold">
                {trainer.full_name?.charAt(0)?.toUpperCase() || '?'}
              </div>
              <div className="flex-1">
                <p className="font-semibold text-white">{trainer.full_name}</p>
                <p className="text-xs text-white/30">{trainer.email}</p>
              </div>
              <MessageCircle className="h-5 w-5 text-white/20" />
            </div>
          </Card>
        </motion.div>
      )}

      <motion.div {...fadeUp} transition={{ duration: 0.3 }}>
        <Button onClick={() => navigate('/client/routines')} className="w-full" size="lg">
          <Dumbbell className="h-5 w-5 mr-2" />Ver mis rutinas
        </Button>
      </motion.div>
    </motion.div>
  );
}
