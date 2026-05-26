/*
  # Add DNI upload and Chat functionality

  1. Modified Tables
    - `profiles`
      - `dni_front_url` (text, URL of front DNI image stored in Supabase Storage)
      - `dni_back_url` (text, URL of back DNI image stored in Supabase Storage)
      - `dni_verified` (boolean, trainer verifies client DNI, default false)

  2. New Tables
    - `conversations`
      - `id` (uuid, primary key)
      - `trainer_id` (uuid, references profiles.id)
      - `client_id` (uuid, references profiles.id)
      - `created_at` (timestamptz)
      - UNIQUE constraint on (trainer_id, client_id) to prevent duplicate conversations

    - `messages`
      - `id` (uuid, primary key)
      - `conversation_id` (uuid, references conversations.id)
      - `sender_id` (uuid, references profiles.id)
      - `content` (text, message text)
      - `read_at` (timestamptz, when recipient read the message)
      - `created_at` (timestamptz)

  3. Security
    - Enable RLS on conversations and messages
    - Conversations: both trainer and client in the conversation can read; trainers can create conversations with their clients
    - Messages: participants in the conversation can read; participants can insert messages
    - Messages are ordered by created_at

  4. Indexes
    - Index on conversations.trainer_id and conversations.client_id
    - Index on messages.conversation_id and messages.created_at

  5. Important Notes
    - DNI images are uploaded to Supabase Storage bucket 'dni-uploads'
    - Only the trainer who owns the client can view their DNI images
    - Conversations are 1-to-1 between trainer and client
*/

-- Add DNI columns to profiles
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'profiles' AND column_name = 'dni_front_url'
  ) THEN
    ALTER TABLE profiles ADD COLUMN dni_front_url text DEFAULT '';
  END IF;
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'profiles' AND column_name = 'dni_back_url'
  ) THEN
    ALTER TABLE profiles ADD COLUMN dni_back_url text DEFAULT '';
  END IF;
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'profiles' AND column_name = 'dni_verified'
  ) THEN
    ALTER TABLE profiles ADD COLUMN dni_verified boolean DEFAULT false NOT NULL;
  END IF;
END $$;

-- =====================
-- CONVERSATIONS TABLE
-- =====================
CREATE TABLE IF NOT EXISTS conversations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  trainer_id uuid NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  client_id uuid NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  created_at timestamptz DEFAULT now() NOT NULL,
  UNIQUE (trainer_id, client_id)
);

ALTER TABLE conversations ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Trainer can read their conversations"
  ON conversations FOR SELECT
  TO authenticated
  USING (trainer_id = auth.uid());

CREATE POLICY "Client can read their conversations"
  ON conversations FOR SELECT
  TO authenticated
  USING (client_id = auth.uid());

CREATE POLICY "Trainer can create conversation with their client"
  ON conversations FOR INSERT
  TO authenticated
  WITH CHECK (
    auth.uid() = trainer_id
    AND (SELECT role FROM profiles WHERE id = auth.uid()) = 'entrenador'
    AND EXISTS (SELECT 1 FROM profiles WHERE id = client_id AND trainer_id = auth.uid())
  );

CREATE POLICY "Trainer can delete their conversations"
  ON conversations FOR DELETE
  TO authenticated
  USING (trainer_id = auth.uid());

CREATE INDEX IF NOT EXISTS idx_conversations_trainer_id ON conversations(trainer_id);
CREATE INDEX IF NOT EXISTS idx_conversations_client_id ON conversations(client_id);

-- =====================
-- MESSAGES TABLE
-- =====================
CREATE TABLE IF NOT EXISTS messages (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  conversation_id uuid NOT NULL REFERENCES conversations(id) ON DELETE CASCADE,
  sender_id uuid NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  content text NOT NULL DEFAULT '',
  read_at timestamptz,
  created_at timestamptz DEFAULT now() NOT NULL
);

ALTER TABLE messages ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Conversation participants can read messages"
  ON messages FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM conversations c
      WHERE c.id = conversation_id
      AND (c.trainer_id = auth.uid() OR c.client_id = auth.uid())
    )
  );

CREATE POLICY "Conversation participants can send messages"
  ON messages FOR INSERT
  TO authenticated
  WITH CHECK (
    auth.uid() = sender_id
    AND EXISTS (
      SELECT 1 FROM conversations c
      WHERE c.id = conversation_id
      AND (c.trainer_id = auth.uid() OR c.client_id = auth.uid())
    )
  );

CREATE POLICY "Sender can mark their messages as read"
  ON messages FOR UPDATE
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM conversations c
      WHERE c.id = conversation_id
      AND (c.trainer_id = auth.uid() OR c.client_id = auth.uid())
    )
  )
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM conversations c
      WHERE c.id = conversation_id
      AND (c.trainer_id = auth.uid() OR c.client_id = auth.uid())
    )
  );

CREATE INDEX IF NOT EXISTS idx_messages_conversation_id ON messages(conversation_id);
CREATE INDEX IF NOT EXISTS idx_messages_created_at ON messages(created_at);
