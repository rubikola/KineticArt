import { Link } from 'react-router-dom';
import { motion } from 'framer-motion';

export default function NotFoundPage() {
  return (
    <div className="min-h-screen flex items-center justify-center bg-dark p-4">
      <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="text-center">
        <h1 className="text-8xl font-bold bg-gradient-mixed bg-clip-text text-transparent">404</h1>
        <p className="text-white/40 mt-2">Pagina no encontrada</p>
        <Link to="/" className="mt-6 inline-block btn-primary">
          Volver al inicio
        </Link>
      </motion.div>
    </div>
  );
}
