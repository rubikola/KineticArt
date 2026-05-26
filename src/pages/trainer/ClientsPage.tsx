import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { motion, AnimatePresence } from 'framer-motion';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../context/AuthContext';
import { useToast } from '../../context/ToastContext';
import { Button } from '../../components/ui/Button';
import { Card } from '../../components/ui/Card';
import { SkeletonList } from '../../components/ui/Skeleton';
import type { Profile } from '../../types/database';
import { Users, MessageCircle, Shield, Search, CheckCircle2, XCircle, Eye, UserPlus, X } from 'lucide-react';

export default function ClientsPage() {
  const { user } = useAuth();
  const navigate = useNavigate();
  const { toast } = useToast();
  const [clients, setClients] = useState<Profile[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState('');
  const [selectedClient, setSelectedClient] = useState<Profile | null>(null);
  const [verifying, setVerifying] = useState<string | null>(null);
  const [addEmail, setAddEmail] = useState('');
  const [addError, setAddError] = useState('');
  const [adding, setAdding] = useState(false);
  const [showAddModal, setShowAddModal] = useState(false);
  const [dniModal, setDniModal] = useState<{ front: string; back: string; name: string } | null>(null);

  useEffect(() => { fetchClients(); }, []);

  async function fetchClients() {
    setLoading(true);
    const { data } = await supabase.from('profiles').select('*').eq('trainer_id', user!.id).eq('role', 'cliente').order('full_name');
    setClients(data || []);
    setLoading(false);
  }

  async function handleVerify(clientId: string, verified: boolean) {
    setVerifying(clientId);
    const { error } = await supabase.from('profiles').update({ dni_verified: verified }).eq('id', clientId);
    if (!error) {
      setClients((prev) => prev.map((c) => c.id === clientId ? { ...c, dni_verified: verified } : c));
      if (selectedClient?.id === clientId) setSelectedClient({ ...selectedClient, dni_verified: verified });
      toast(verified ? 'DNI verificado' : 'DNI rechazado', verified ? 'success' : 'error');
    }
    setVerifying(null);
  }

  async function handleAddClient(e: React.FormEvent) {
    e.preventDefault();
    setAddError('');
    setAdding(true);
    const { data: clientProfile } = await supabase.from('profiles').select('*').eq('email', addEmail.trim().toLowerCase()).eq('role', 'cliente').maybeSingle();
    if (!clientProfile) { setAddError('No se encontro un cliente con ese email'); setAdding(false); return; }
    if (clientProfile.trainer_id) { setAddError('Este cliente ya tiene entrenador'); setAdding(false); return; }
    const { error } = await supabase.from('profiles').update({ trainer_id: user!.id }).eq('id', clientProfile.id);
    if (error) { setAddError('Error al asignar'); } else {
      setClients((prev) => [...prev, { ...clientProfile, trainer_id: user!.id }]);
      setShowAddModal(false); setAddEmail('');
      toast('Cliente asignado', 'success');
    }
    setAdding(false);
  }

  async function startChat(clientId: string) {
    const { data, error } = await supabase.from('conversations').upsert({ trainer_id: user!.id, client_id: clientId }, { onConflict: 'trainer_id,client_id' }).select('id').maybeSingle();
    if (!error && data) navigate(`/chat/${data.id}`);
  }

  const filtered = clients.filter((c) =>
    c.full_name.toLowerCase().includes(search.toLowerCase()) || c.email.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-white">Clientes</h1>
          <p className="text-white/40 mt-1">{clients.length} asignados</p>
        </div>
        <Button onClick={() => setShowAddModal(true)} size="sm"><UserPlus className="h-4 w-4 mr-1" />Anadir</Button>
      </div>

      <div className="relative">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-white/30" />
        <input type="text" placeholder="Buscar..." value={search} onChange={(e) => setSearch(e.target.value)}
          className="input-dark pl-10" />
      </div>

      {loading ? <SkeletonList count={4} /> : filtered.length === 0 ? (
        <div className="text-center py-12">
          <Users className="h-12 w-12 text-white/15 mx-auto mb-3" />
          <p className="text-white/40">{search ? 'Sin resultados' : 'Sin clientes'}</p>
        </div>
      ) : (
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-4">
          <div className="lg:col-span-1 space-y-2">
            {filtered.map((client) => (
              <motion.button key={client.id} layout onClick={() => setSelectedClient(client)}
                className={`w-full text-left flex items-center gap-3 p-3 rounded-xl transition-all duration-200 ${
                  selectedClient?.id === client.id ? 'glass border-mint/30' : 'glass hover:bg-white/[0.03]'
                }`}>
                <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-mint/10 text-mint text-sm font-semibold">
                  {client.full_name?.charAt(0)?.toUpperCase() || '?'}
                </div>
                <div className="flex-1 min-w-0">
                  <p className="text-sm font-medium text-white truncate">{client.full_name}</p>
                  <p className="text-xs text-white/30 truncate">{client.email}</p>
                </div>
                <div className="shrink-0">
                  {client.dni_verified ? <CheckCircle2 className="h-5 w-5 text-mint" />
                    : client.dni_front_url ? <XCircle className="h-5 w-5 text-flame" />
                    : <div className="h-5 w-5 rounded-full border-2 border-white/15" />}
                </div>
              </motion.button>
            ))}
          </div>

          <div className="lg:col-span-2">
            {selectedClient ? (
              <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }}>
                <Card>
                  <div className="space-y-5">
                    <div className="flex items-start justify-between">
                      <div className="flex items-center gap-3">
                        <div className="flex h-14 w-14 items-center justify-center rounded-full bg-mint/10 text-mint text-lg font-semibold">
                          {selectedClient.full_name?.charAt(0)?.toUpperCase() || '?'}
                        </div>
                        <div>
                          <h2 className="text-lg font-semibold text-white">{selectedClient.full_name}</h2>
                          <p className="text-sm text-white/40">{selectedClient.email}</p>
                        </div>
                      </div>
                      <Button variant="ghost" size="sm" onClick={() => startChat(selectedClient.id)}>
                        <MessageCircle className="h-4 w-4 mr-1" />Chat
                      </Button>
                    </div>

                    <div className="space-y-3">
                      <h3 className="text-sm font-semibold text-white/60 flex items-center gap-2">
                        <Shield className="h-4 w-4" />Documento de identidad
                      </h3>
                      {selectedClient.dni_front_url || selectedClient.dni_back_url ? (
                        <>
                          <div className="flex items-center gap-2">
                            <span className="text-sm text-white/50">Estado:</span>
                            {selectedClient.dni_verified ? (
                              <span className="inline-flex items-center gap-1 text-sm font-medium text-mint"><CheckCircle2 className="h-4 w-4" />Verificado</span>
                            ) : (
                              <span className="inline-flex items-center gap-1 text-sm font-medium text-flame"><XCircle className="h-4 w-4" />Pendiente</span>
                            )}
                          </div>
                          <div className="grid grid-cols-2 gap-3">
                            <button onClick={() => setDniModal({ front: selectedClient.dni_front_url, back: selectedClient.dni_back_url, name: selectedClient.full_name })}
                              className="group rounded-xl overflow-hidden border border-dark-border hover:border-mint/30 transition-colors">
                              <img src={selectedClient.dni_front_url} alt="DNI frontal" className="w-full h-32 object-cover" />
                              <div className="flex items-center justify-center gap-1 py-1.5 bg-dark-elevated text-xs text-white/40 group-hover:text-mint transition-colors">
                                <Eye className="h-3 w-3" />Frontal
                              </div>
                            </button>
                            <button onClick={() => setDniModal({ front: selectedClient.dni_front_url, back: selectedClient.dni_back_url, name: selectedClient.full_name })}
                              className="group rounded-xl overflow-hidden border border-dark-border hover:border-mint/30 transition-colors">
                              <img src={selectedClient.dni_back_url} alt="DNI trasera" className="w-full h-32 object-cover" />
                              <div className="flex items-center justify-center gap-1 py-1.5 bg-dark-elevated text-xs text-white/40 group-hover:text-mint transition-colors">
                                <Eye className="h-3 w-3" />Trasera
                              </div>
                            </button>
                          </div>
                          {!selectedClient.dni_verified && (
                            <div className="flex gap-2 pt-1">
                              <Button size="sm" onClick={() => handleVerify(selectedClient.id, true)} loading={verifying === selectedClient.id}>
                                <CheckCircle2 className="h-4 w-4 mr-1" />Verificar
                              </Button>
                              <Button variant="danger" size="sm" onClick={() => handleVerify(selectedClient.id, false)} loading={verifying === selectedClient.id}>
                                Rechazar
                              </Button>
                            </div>
                          )}
                        </>
                      ) : <p className="text-sm text-white/30 py-4 text-center">El cliente aun no ha subido su DNI</p>}
                    </div>
                  </div>
                </Card>
              </motion.div>
            ) : (
              <div className="h-full flex items-center justify-center py-12">
                <p className="text-white/30">Selecciona un cliente</p>
              </div>
            )}
          </div>
        </div>
      )}

      {/* Add modal */}
      <AnimatePresence>
        {showAddModal && (
          <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
            className="fixed inset-0 z-50 flex items-center justify-center bg-black/70 p-4">
            <motion.div initial={{ scale: 0.95, opacity: 0 }} animate={{ scale: 1, opacity: 1 }} exit={{ scale: 0.95, opacity: 0 }}
              className="glass-strong rounded-2xl w-full max-w-md p-6">
              <h2 className="text-lg font-semibold text-white mb-1">Anadir cliente</h2>
              <p className="text-sm text-white/40 mb-4">Busca por email</p>
              <form onSubmit={handleAddClient} className="space-y-4">
                <input type="email" value={addEmail} onChange={(e) => setAddEmail(e.target.value)} placeholder="email del cliente" required className="input-dark" />
                {addError && <div className="bg-flame/10 border border-flame/20 text-flame text-sm rounded-xl px-4 py-3">{addError}</div>}
                <div className="flex gap-3">
                  <Button type="submit" loading={adding} className="flex-1">Asignar</Button>
                  <Button type="button" variant="secondary" onClick={() => { setShowAddModal(false); setAddError(''); }}>Cancelar</Button>
                </div>
              </form>
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>

      {/* DNI modal */}
      {dniModal && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/90 p-4" onClick={() => setDniModal(null)}>
          <div className="max-w-2xl w-full space-y-4" onClick={(e) => e.stopPropagation()}>
            <div className="flex items-center justify-between">
              <h3 className="text-white font-semibold">DNI - {dniModal.name}</h3>
              <button onClick={() => setDniModal(null)} className="text-white/50 hover:text-white" aria-label="Cerrar"><X className="h-5 w-5" /></button>
            </div>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
              <div className="rounded-xl overflow-hidden bg-dark-surface"><img src={dniModal.front} alt="Frontal" className="w-full" /><p className="text-center text-white/30 text-xs py-2">Cara frontal</p></div>
              <div className="rounded-xl overflow-hidden bg-dark-surface"><img src={dniModal.back} alt="Trasera" className="w-full" /><p className="text-center text-white/30 text-xs py-2">Cara trasera</p></div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
