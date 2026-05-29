export type Role = 'entrenador' | 'cliente';

export interface Profile {
  id: string;
  full_name: string;
  email: string;
  role: Role;
  trainer_id: string | null;
  dni_front_url: string;
  dni_back_url: string;
  dni_verified: boolean;
  created_at: string;
  updated_at: string;
}

export interface Exercise {
  id: string;
  name: string;
  description: string;
  primary_muscle: string;
  youtube_video_id: string;
  thumbnail_url?: string;
  difficulty?: string;
  equipment_needed?: string;
  movement_pattern?: string;
  created_by: string;
  created_at: string;
  updated_at: string;
}

export interface Routine {
  id: string;
  client_id: string;
  trainer_id: string;
  name: string;
  assigned_date: string;
  notes: string;
  is_active: boolean;
  created_at: string;
  updated_at: string;
  client?: Profile;
  trainer?: Profile;
  routine_exercises?: RoutineExercise[];
}

export interface RoutineExercise {
  id: string;
  routine_id: string;
  exercise_id: string;
  sets: number;
  reps: number;
  rest_seconds: number;
  order_index: number;
  notes: string;
  created_at: string;
  exercise?: Exercise;
}

export interface Conversation {
  id: string;
  trainer_id: string;
  client_id: string;
  created_at: string;
  trainer?: Profile;
  client?: Profile;
  last_message?: Message;
}

export interface Message {
  id: string;
  conversation_id: string;
  sender_id: string;
  content: string;
  read_at: string | null;
  created_at: string;
  sender?: Profile;
}
