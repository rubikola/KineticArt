import { useState, useEffect, useRef, type FormEvent } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { motion, AnimatePresence } from 'framer-motion';
import { supabase } from '../lib/supabase';
import { useAuth } from '../context/AuthContext';
import { Button } from '../components/ui/Button';
import { SkeletonList } from '../components/ui/Skeleton';
import { cn, formatTime } from '../lib/utils';
import type { Conversation, Message, Profile } from '../types/database';
import { Send, ArrowLeft, MessageCircle } from 'lucide-react';

export default function ChatPage() {
  const { profile, user } = useAuth();
  const { conversationId } = useParams();
  const navigate = useNavigate();
  const [conversations, setConversations] = useState<(Conversation & { other?: Profile })[]>([]);
  const [messages, setMessages] = useState<Message[]>([]);
  const [newMessage, setNewMessage] = useState('');
  const [loading, setLoading] = useState(true);
  const [sending, setSending] = useState(false);
  const messagesEndRef = useRef<HTMLDivElement>(null);
  const isTrainer = profile?.role === 'entrenador';

  useEffect(() => { fetchConversations(); }, []);

  useEffect(() => {
    if (conversationId) {
      fetchMessages();
      const channel = supabase.channel(`chat-${conversationId}`)
        .on('postgres_changes', { event: 'INSERT', schema: 'public', table: 'messages', filter: `conversation_id=eq.${conversationId}` }, (payload) => {
          const newMsg = payload.new as Message;
          setMessages((prev) => prev.some((m) => m.id === newMsg.id) ? prev : [...prev, newMsg]);
        }).subscribe();
      return () => { supabase.removeChannel(channel); };
    }
  }, [conversationId]);

  useEffect(() => { messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' }); }, [messages]);

  async function fetchConversations() {
    setLoading(true);
    const { data } = isTrainer
      ? await supabase.from('conversations').select('*, trainer:profiles!conversations_trainer_id_fkey(*), client:profiles!conversations_client_id_fkey(*)').eq('trainer_id', user!.id).order('created_at', { ascending: false })
      : await supabase.from('conversations').select('*, trainer:profiles!conversations_trainer_id_fkey(*), client:profiles!conversations_client_id_fkey(*)').eq('client_id', user!.id).order('created_at', { ascending: false });
    setConversations((data || []).map((c: any) => ({ ...c, other: isTrainer ? c.client : c.trainer })));
    setLoading(false);
  }

  async function fetchMessages() {
    const { data } = await supabase.from('messages').select('*').eq('conversation_id', conversationId!).order('created_at', { ascending: true });
    setMessages(data || []);
  }

  async function sendMessage(e: FormEvent) {
    e.preventDefault();
    if (!newMessage.trim() || !conversationId) return;
    setSending(true);
    const { error } = await supabase.from('messages').insert({ conversation_id: conversationId, sender_id: user!.id, content: newMessage.trim() });
    if (!error) setNewMessage('');
    setSending(false);
  }

  const currentConversation = conversations.find((c) => c.id === conversationId);

  return (
    <div className="space-y-4">
      <h1 className="text-2xl font-bold text-white">Mensajes</h1>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4 h-[calc(100vh-200px)] md:h-[calc(100vh-180px)]">
        {/* Conversation list */}
        <div className={cn('md:col-span-1 glass rounded-xl overflow-hidden', conversationId ? 'hidden md:flex md:flex-col' : 'flex flex-col')}>
          <div className="p-4 border-b border-dark-border/30">
            <h2 className="font-semibold text-white text-sm">Conversaciones</h2>
          </div>
          <div className="flex-1 overflow-y-auto">
            {loading ? <div className="p-3"><SkeletonList count={4} /></div>
              : conversations.length === 0 ? (
                <div className="text-center py-8 px-4"><MessageCircle className="h-8 w-8 text-white/15 mx-auto mb-2" /><p className="text-sm text-white/30">Sin conversaciones</p></div>
              ) : conversations.map((conv) => (
                <button key={conv.id} onClick={() => navigate(`/chat/${conv.id}`)}
                  className={cn('w-full flex items-center gap-3 px-4 py-3 hover:bg-white/[0.03] transition-colors border-b border-dark-border/20 text-left',
                    conv.id === conversationId ? 'bg-mint/5' : ''
                  )}>
                  <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-mint/10 text-mint text-sm font-semibold">
                    {conv.other?.full_name?.charAt(0)?.toUpperCase() || '?'}
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-medium text-white truncate">{conv.other?.full_name || 'Usuario'}</p>
                    <p className="text-xs text-white/25 capitalize">{conv.other?.role}</p>
                  </div>
                </button>
              ))
            }
          </div>
        </div>

        {/* Chat area */}
        <div className={cn('md:col-span-2 glass rounded-xl flex flex-col overflow-hidden', !conversationId ? 'hidden md:flex' : 'flex')}>
          {!conversationId ? (
            <div className="flex-1 flex items-center justify-center"><MessageCircle className="h-12 w-12 text-white/10" /></div>
          ) : (
            <>
              <div className="flex items-center gap-3 px-4 py-3 border-b border-dark-border/30">
                <button onClick={() => navigate('/chat')} className="md:hidden p-1.5 rounded-lg hover:bg-white/5 text-white/50" aria-label="Volver"><ArrowLeft className="h-5 w-5" /></button>
                <div className="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-mint/10 text-mint text-sm font-semibold">
                  {currentConversation?.other?.full_name?.charAt(0)?.toUpperCase() || '?'}
                </div>
                <div>
                  <p className="text-sm font-medium text-white">{currentConversation?.other?.full_name || 'Usuario'}</p>
                  <p className="text-xs text-white/25 capitalize">{currentConversation?.other?.role}</p>
                </div>
              </div>

              <div className="flex-1 overflow-y-auto px-4 py-4 space-y-3">
                {messages.map((msg) => {
                  const isMine = msg.sender_id === user!.id;
                  return (
                    <motion.div key={msg.id} initial={{ opacity: 0, y: 4 }} animate={{ opacity: 1, y: 0 }} transition={{ duration: 0.15 }}
                      className={cn('flex', isMine ? 'justify-end' : 'justify-start')}>
                      <div className={cn('max-w-[75%] rounded-2xl px-4 py-2.5 text-sm',
                        isMine ? 'bg-gradient-mint text-dark rounded-br-md' : 'bg-dark-elevated text-white rounded-bl-md border border-dark-border/50'
                      )}>
                        <p className="whitespace-pre-wrap break-words">{msg.content}</p>
                        <p className={cn('text-[10px] mt-1', isMine ? 'text-dark/40' : 'text-white/25')}>{formatTime(msg.created_at)}</p>
                      </div>
                    </motion.div>
                  );
                })}
                <div ref={messagesEndRef} />
              </div>

              <form onSubmit={sendMessage} className="flex gap-2 px-4 py-3 border-t border-dark-border/30">
                <input type="text" value={newMessage} onChange={(e) => setNewMessage(e.target.value)} placeholder="Escribe un mensaje..."
                  className="input-dark flex-1" />
                <Button type="submit" size="sm" disabled={sending || !newMessage.trim()}><Send className="h-4 w-4" /></Button>
              </form>
            </>
          )}
        </div>
      </div>
    </div>
  );
}
