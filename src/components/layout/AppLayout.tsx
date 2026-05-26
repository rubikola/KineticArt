import { NavLink, Outlet, useNavigate, useLocation } from 'react-router-dom';
import { motion, AnimatePresence } from 'framer-motion';
import { useAuth } from '../../context/AuthContext';
import { Dumbbell, Users, Calendar, LogOut, LayoutDashboard, User, MessageCircle, Plus } from 'lucide-react';

export function AppLayout() {
  const { profile, signOut } = useAuth();
  const navigate = useNavigate();
  const location = useLocation();
  const isTrainer = profile?.role === 'entrenador';

  const navItems = isTrainer
    ? [
        { to: '/trainer', icon: LayoutDashboard, label: 'Home', end: true },
        { to: '/trainer/clients', icon: Users, label: 'Clientes', end: false },
        { to: '/trainer/exercises', icon: Dumbbell, label: 'Ejercicios', end: false },
        { to: '/trainer/routines', icon: Calendar, label: 'Rutinas', end: false },
        { to: '/chat', icon: MessageCircle, label: 'Chat', end: false },
      ]
    : [
        { to: '/client', icon: LayoutDashboard, label: 'Home', end: true },
        { to: '/client/routines', icon: Calendar, label: 'Rutinas', end: false },
        { to: '/chat', icon: MessageCircle, label: 'Chat', end: false },
      ];

  async function handleSignOut() {
    await signOut();
    navigate('/login');
  }

  const fabTarget = isTrainer ? '/trainer/exercises' : '/chat';

  return (
    <div className="min-h-screen bg-dark flex">
      {/* Desktop sidebar */}
      <aside className="hidden md:flex md:w-64 md:flex-col glass-strong border-r border-dark-border/30">
        <div className="flex items-center gap-3 px-6 py-6 border-b border-dark-border/30">
          <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-mint/10">
            <Dumbbell className="h-5 w-5 text-mint" />
          </div>
          <span className="text-lg font-bold tracking-tight text-white">KineticArt</span>
        </div>
        <nav className="flex-1 px-3 py-4 space-y-1">
          {navItems.map(({ to, icon: Icon, label, end }) => (
            <NavLink
              key={to}
              to={to}
              end={end}
              className={({ isActive }) =>
                `flex items-center gap-3 px-3 py-2.5 rounded-xl text-sm font-medium transition-all duration-200 ${
                  isActive
                    ? 'bg-mint/10 text-mint border border-mint/20'
                    : 'text-white/50 hover:bg-white/5 hover:text-white/80'
                }`
              }
            >
              <Icon className="h-5 w-5" />
              {label}
            </NavLink>
          ))}
        </nav>
        <div className="px-3 py-4 border-t border-dark-border/30">
          <div className="flex items-center gap-3 px-3 py-2 text-sm">
            <div className="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-mint/10 text-mint text-sm font-semibold">
              {profile?.full_name?.charAt(0)?.toUpperCase() || '?'}
            </div>
            <div className="flex-1 min-w-0">
              <p className="truncate font-medium text-white">{profile?.full_name || 'Usuario'}</p>
              <p className="truncate text-xs text-white/40 capitalize">{profile?.role}</p>
            </div>
          </div>
          <button
            onClick={handleSignOut}
            className="flex items-center gap-3 px-3 py-2.5 mt-1 rounded-xl text-sm font-medium text-white/40 hover:bg-white/5 hover:text-white/70 w-full transition-all duration-200"
          >
            <LogOut className="h-5 w-5" />
            Cerrar sesion
          </button>
        </div>
      </aside>

      {/* Main content */}
      <main className="flex-1 overflow-auto">
        <AnimatePresence mode="wait">
          <motion.div
            key={location.pathname}
            initial={{ opacity: 0, y: 8 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -8 }}
            transition={{ duration: 0.15, ease: 'easeOut' }}
            className="max-w-5xl mx-auto px-4 sm:px-6 py-6 pb-28 md:pb-6"
          >
            <Outlet />
          </motion.div>
        </AnimatePresence>
      </main>

      {/* FAB */}
      <button
        onClick={() => navigate(fabTarget)}
        className="md:hidden fixed right-5 bottom-20 z-40 flex h-14 w-14 items-center justify-center rounded-full bg-gradient-mint text-dark shadow-glow transition-transform duration-200 hover:scale-110 active:scale-95"
        aria-label="Accion rapida"
      >
        <Plus className="h-6 w-6" />
      </button>

      {/* Mobile bottom nav */}
      <div className="md:hidden fixed bottom-0 left-0 right-0 z-50 glass-strong border-t border-dark-border/30 pb-safe">
        <nav className="flex justify-around py-2 px-2">
          {navItems.map(({ to, icon: Icon, label, end }) => (
            <NavLink
              key={to}
              to={to}
              end={end}
              className={({ isActive }) =>
                `flex flex-col items-center gap-0.5 px-3 py-1.5 rounded-xl text-xs transition-all duration-200 ${
                  isActive ? 'text-mint' : 'text-white/40'
                }`
              }
            >
              {({ isActive }) => (
                <>
                  <div className="relative">
                    <Icon className="h-5 w-5" />
                    {isActive && (
                      <motion.div
                        layoutId="nav-indicator"
                        className="absolute -bottom-1 left-1/2 -translate-x-1/2 h-0.5 w-4 rounded-full bg-mint"
                        transition={{ type: 'spring', stiffness: 500, damping: 30 }}
                      />
                    )}
                  </div>
                  <span className="truncate max-w-[56px]">{label}</span>
                </>
              )}
            </NavLink>
          ))}
        </nav>
      </div>
    </div>
  );
}
