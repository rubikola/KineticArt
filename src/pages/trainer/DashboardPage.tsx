import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { motion } from 'framer-motion';
import { useAuth } from '../../context/AuthContext';
import { supabase } from '../../lib/supabase';
import { Card } from '../../components/ui/Card';
import { Button } from '../../components/ui/Button';
import { SkeletonCard } from '../../components/ui/Skeleton';
import { Users, Dumbbell, Calendar, MessageCircle, ArrowRight, TrendingUp, UserPlus } from 'lucide-react';

const stagger = { animate: { transition: { staggerChildren: 0.06 } } };
const fadeUp = { initial: { opacity: 0, y: 12 }, animate: { opacity: 1, y: 0 } };

export default function TrainerDashboard() {
  const { profile, user } = useAuth();
  const navigate = useNavigate();
  const [stats, setStats] = useState({ clients: 0, routines: 0, exercises: 0, conversations: 0 });
  const [recentClients, setRecentClients] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function load() {
      const [c, r, e, conv] = await Promise.all([
        supabase.from('profiles').select('id', { count: 'exact', head: true }).eq('trainer_id', user!.id).eq('role', 'cliente'),
        supabase.from('routines').select('id', { count: 'exact', head: true }).eq('trainer_id', user!.id),
        supabase.from('exercises').select('id', { count: 'exact', head: true }).eq('created_by', user!.id),
        supabase.from('conversations').select('id', { count: 'exact', head: true }).eq('trainer_id', user!.id),
      ]);
      setStats({ clients: c.count || 0, routines: r.count || 0, exercises: e.count || 0, conversations: conv.count || 0 });

      const { data } = await supabase.from('profiles').select('*').eq('trainer_id', user!.id).eq('role', 'cliente').order('created_at', { ascending: false }).limit(4);
      setRecentClients(data || []);
      setLoading(false);
    }
    load();
  }, []);

  const statCards = [
    { icon: Users, label: 'Clientes', value: stats.clients, to: '/trainer/clients', color: 'mint' },
    { icon: Dumbbell, label: 'Ejercicios', value: stats.exercises, to: '/trainer/exercises', color: 'flame' },
    { icon: Calendar, label: 'Rutinas', value: stats.routines, to: '/trainer/routines', color: 'mint' },
    { icon: MessageCircle, label: 'Chats', value: stats.conversations, to: '/chat', color: 'flame' },
  ];

  return (
    <motion.div className="space-y-8" {...stagger}>
      {/* Header */}
      <motion.div {...fadeUp} transition={{ duration: 0.3 }}>
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-2xl font-bold text-white">Hola, {profile?.full_name || 'Entrenador'}</h1>
            <p className="text-white/40 mt-1">Panel de control</p>
          </div>
          <div className="flex items-center gap-2">
            <span className="px-3 py-1 rounded-full text-xs font-medium bg-flame/10 text-flame border border-flame/20">Entrenador</span>
          </div>
        </div>
      </motion.div>

      {/* Stats */}
      <motion.div className="grid grid-cols-2 lg:grid-cols-4 gap-3" {...stagger}>
        {loading ? (
          Array.from({ length: 4 }).map((_, i) => <SkeletonCard key={i} />)
        ) : statCards.map(({ icon: Icon, label, value, to, color }) => (
          <motion.div key={label} {...fadeUp} transition={{ duration: 0.3 }}>
            <Card hover onClick={() => navigate(to)} className="group">
              <div className="flex items-center justify-between mb-3">
                <div className={`flex h-9 w-9 items-center justify-center rounded-xl ${color === 'mint' ? 'bg-mint/10' : 'bg-flame/10'}`}>
                  <Icon className={`h-4 w-4 ${color === 'mint' ? 'text-mint' : 'text-flame'}`} />
                </div>
                <ArrowRight className="h-4 w-4 text-white/20 group-hover:text-mint transition-colors" />
              </div>
              <p className="text-2xl font-bold text-white">{value}</p>
              <p className="text-xs text-white/40 mt-0.5">{label}</p>
            </Card>
          </motion.div>
        ))}
      </motion.div>

      {/* Quick actions */}
      <motion.div {...fadeUp} transition={{ duration: 0.3 }}>
        <h2 className="text-sm font-semibold text-white/60 uppercase tracking-wider mb-3">Acciones rapidas</h2>
        <div className="flex flex-wrap gap-2">
          <Button size="sm" onClick={() => navigate('/trainer/clients')}><UserPlus className="h-4 w-4 mr-1.5" />Anadir cliente</Button>
          <Button variant="secondary" size="sm" onClick={() => navigate('/trainer/exercises')}><Dumbbell className="h-4 w-4 mr-1.5" />Nuevo ejercicio</Button>
          <Button variant="secondary" size="sm" onClick={() => navigate('/trainer/routines')}><Calendar className="h-4 w-4 mr-1.5" />Crear rutina</Button>
        </div>
      </motion.div>

      {/* Recent clients */}
      <motion.div {...fadeUp} transition={{ duration: 0.3 }}>
        <div className="flex items-center justify-between mb-3">
          <h2 className="text-sm font-semibold text-white/60 uppercase tracking-wider">Clientes recientes</h2>
          <button onClick={() => navigate('/trainer/clients')} className="text-xs text-mint hover:text-mint-light transition-colors">Ver todos</button>
        </div>
        {loading ? (
          <SkeletonCard />
        ) : recentClients.length === 0 ? (
          <Card>
            <div className="text-center py-6">
              <Users className="h-8 w-8 text-white/20 mx-auto mb-2" />
              <p className="text-sm text-white/40">Sin clientes aun</p>
            </div>
          </Card>
        ) : (
          <div className="space-y-2">
            {recentClients.map((client) => (
              <Card key={client.id} padding hover className="flex items-center gap-3 py-3 px-4">
                <div className="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-mint/10 text-mint text-sm font-semibold">
                  {client.full_name?.charAt(0)?.toUpperCase() || '?'}
                </div>
                <div className="flex-1 min-w-0">
                  <p className="text-sm font-medium text-white truncate">{client.full_name}</p>
                  <p className="text-xs text-white/30 truncate">{client.email}</p>
                </div>
                {client.dni_verified ? (
                  <span className="text-xs text-mint">Verificado</span>
                ) : client.dni_front_url ? (
                  <span className="text-xs text-flame">Pendiente</span>
                ) : null}
              </Card>
            ))}
          </div>
        )}
      </motion.div>
    </motion.div>
  );
}
