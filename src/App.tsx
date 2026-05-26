import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { Suspense, lazy, Component, type ReactNode, type ErrorInfo } from 'react';
import { AuthProvider, useAuth } from './context/AuthContext';
import { AppLayout } from './components/layout/AppLayout';

const LoginPage = lazy(() => import('./pages/auth/LoginPage'));
const RegisterPage = lazy(() => import('./pages/auth/RegisterPage'));
const TrainerDashboard = lazy(() => import('./pages/trainer/DashboardPage'));
const ClientsPage = lazy(() => import('./pages/trainer/ClientsPage'));
const ExercisesPage = lazy(() => import('./pages/trainer/ExercisesPage'));
const RoutinesPage = lazy(() => import('./pages/trainer/RoutinesPage'));
const ClientDashboard = lazy(() => import('./pages/client/DashboardPage'));
const MyRoutinesPage = lazy(() => import('./pages/client/MyRoutinesPage'));
const ChatPage = lazy(() => import('./pages/ChatPage'));
const NotFoundPage = lazy(() => import('./pages/NotFoundPage'));

function Spinner() {
  return (
    <div className="min-h-screen flex items-center justify-center bg-dark">
      <div className="animate-spin h-8 w-8 border-2 border-mint/30 border-t-mint rounded-full" />
    </div>
  );
}

function PageSpinner() {
  return (
    <div className="flex items-center justify-center py-20">
      <div className="animate-spin h-6 w-6 border-2 border-mint/30 border-t-mint rounded-full" />
    </div>
  );
}

class ErrorBoundary extends Component<{ children: ReactNode }, { hasError: boolean }> {
  state = { hasError: false };
  static getDerivedStateFromError() { return { hasError: true }; }
  componentDidCatch(error: Error, info: ErrorInfo) { console.error(error, info); }
  render() {
    if (this.state.hasError) {
      return (
        <div className="min-h-screen flex items-center justify-center bg-dark p-4">
          <div className="text-center">
            <p className="text-lg font-semibold text-white mb-2">Algo salio mal</p>
            <p className="text-sm text-white/40 mb-4">Hubo un error inesperado</p>
            <button onClick={() => window.location.reload()} className="btn-primary">Reintentar</button>
          </div>
        </div>
      );
    }
    return this.props.children;
  }
}

function ProtectedRoute({ children, requiredRole }: { children: ReactNode; requiredRole?: string }) {
  const { user, profile, loading } = useAuth();
  if (loading) return <Spinner />;
  if (!user) return <Navigate to="/login" replace />;
  if (requiredRole && profile?.role !== requiredRole) return <Navigate to="/" replace />;
  return <>{children}</>;
}

function RootRedirect() {
  const { profile, loading } = useAuth();
  if (loading) return <Spinner />;
  if (!profile) return <Navigate to="/login" replace />;
  return <Navigate to={profile.role === 'entrenador' ? '/trainer' : '/client'} replace />;
}

function AppRoutes() {
  return (
    <Routes>
      <Route path="/login" element={<Suspense fallback={<Spinner />}><LoginPage /></Suspense>} />
      <Route path="/register" element={<Suspense fallback={<Spinner />}><RegisterPage /></Suspense>} />
      <Route path="/" element={<RootRedirect />} />
      <Route element={<ProtectedRoute><AppLayout /></ProtectedRoute>}>
        <Route path="/trainer" element={<Suspense fallback={<PageSpinner />}><ProtectedRoute requiredRole="entrenador"><TrainerDashboard /></ProtectedRoute></Suspense>} />
        <Route path="/trainer/clients" element={<Suspense fallback={<PageSpinner />}><ProtectedRoute requiredRole="entrenador"><ClientsPage /></ProtectedRoute></Suspense>} />
        <Route path="/trainer/exercises" element={<Suspense fallback={<PageSpinner />}><ProtectedRoute requiredRole="entrenador"><ExercisesPage /></ProtectedRoute></Suspense>} />
        <Route path="/trainer/routines" element={<Suspense fallback={<PageSpinner />}><ProtectedRoute requiredRole="entrenador"><RoutinesPage /></ProtectedRoute></Suspense>} />
        <Route path="/client" element={<Suspense fallback={<PageSpinner />}><ProtectedRoute requiredRole="cliente"><ClientDashboard /></ProtectedRoute></Suspense>} />
        <Route path="/client/routines" element={<Suspense fallback={<PageSpinner />}><ProtectedRoute requiredRole="cliente"><MyRoutinesPage /></ProtectedRoute></Suspense>} />
        <Route path="/chat" element={<Suspense fallback={<PageSpinner />}><ChatPage /></Suspense>} />
        <Route path="/chat/:conversationId" element={<Suspense fallback={<PageSpinner />}><ChatPage /></Suspense>} />
      </Route>
      <Route path="*" element={<Suspense fallback={<Spinner />}><NotFoundPage /></Suspense>} />
    </Routes>
  );
}

export default function App() {
  return (
    <BrowserRouter>
      <AuthProvider>
        <ErrorBoundary>
          <AppRoutes />
        </ErrorBoundary>
      </AuthProvider>
    </BrowserRouter>
  );
}
