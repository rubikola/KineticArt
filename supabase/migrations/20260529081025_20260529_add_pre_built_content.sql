/*
  # Add Pre-built Training Programs and Content Library

  1. New Tables
    - `training_programs` - Pre-built full body routines from PDF
      - `id` (uuid, primary key)
      - `name` (text, routine name A-H)
      - `description` (text, focus area)
      - `difficulty_level` (text: beginner, intermediate, advanced)
      - `program_type` (text: full_body, upper_body, lower_body, etc.)
      - `duration_minutes` (int, typical session length)
      - `frequency_per_week` (text)
      - `created_at` (timestamp)

    - `training_exercises` - Exercise library with classifications
      - `id` (uuid, primary key)
      - `name` (text)
      - `primary_muscle` (text)
      - `secondary_muscle` (text)
      - `movement_pattern` (text: push_horizontal, pull_vertical, etc.)
      - `equipment_needed` (text)
      - `difficulty` (text)
      - `youtube_video_id` (text)
      - `description` (text)
      - `created_at` (timestamp)

    - `program_exercises` - Link training programs to exercises
      - `id` (uuid, primary key)
      - `program_id` (uuid, foreign key)
      - `exercise_id` (uuid, foreign key)
      - `order_index` (int)
      - `sets` (int)
      - `reps_min` (int)
      - `reps_max` (int)
      - `rest_seconds` (int)
      - `technical_notes` (text)

    - `training_resources` - Links to external content
      - `id` (uuid, primary key)
      - `title` (text)
      - `description` (text)
      - `resource_type` (text: website, youtube_channel, pdf)
      - `url` (text)
      - `category` (text)
      - `source` (text: entrenamientos_com, cptrainer_pdf, youtube)

  2. Security
    - Enable RLS on all tables
    - Allow trainers to view and use pre-built content
    - Allow clients to view assigned program details

  3. Indexes
    - Add index on primary_muscle for fast exercise filtering
    - Add index on difficulty_level for program filtering
*/

CREATE TABLE IF NOT EXISTS training_programs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  description text NOT NULL,
  difficulty_level text NOT NULL CHECK (difficulty_level IN ('beginner', 'intermediate', 'advanced')),
  program_type text NOT NULL,
  duration_minutes int,
  frequency_per_week text,
  detailed_guide text,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS training_exercises (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL UNIQUE,
  primary_muscle text NOT NULL,
  secondary_muscle text,
  movement_pattern text,
  equipment_needed text,
  difficulty text,
  youtube_video_id text,
  description text,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS program_exercises (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  program_id uuid NOT NULL REFERENCES training_programs(id) ON DELETE CASCADE,
  exercise_id uuid NOT NULL REFERENCES training_exercises(id) ON DELETE CASCADE,
  order_index int NOT NULL,
  sets int NOT NULL,
  reps_min int NOT NULL,
  reps_max int NOT NULL,
  rest_seconds int,
  technical_notes text,
  created_at timestamptz DEFAULT now(),
  UNIQUE(program_id, exercise_id)
);

CREATE TABLE IF NOT EXISTS training_resources (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  description text,
  resource_type text NOT NULL,
  url text NOT NULL,
  category text,
  source text,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE training_programs ENABLE ROW LEVEL SECURITY;
ALTER TABLE training_exercises ENABLE ROW LEVEL SECURITY;
ALTER TABLE program_exercises ENABLE ROW LEVEL SECURITY;
ALTER TABLE training_resources ENABLE ROW LEVEL SECURITY;

-- Training programs: anyone can read
CREATE POLICY "Anyone can read training programs"
  ON training_programs FOR SELECT
  TO authenticated
  USING (true);

-- Training exercises: anyone can read
CREATE POLICY "Anyone can read training exercises"
  ON training_exercises FOR SELECT
  TO authenticated
  USING (true);

-- Program exercises: anyone can read
CREATE POLICY "Anyone can read program exercises"
  ON program_exercises FOR SELECT
  TO authenticated
  USING (true);

-- Training resources: anyone can read
CREATE POLICY "Anyone can read training resources"
  ON training_resources FOR SELECT
  TO authenticated
  USING (true);

-- Indexes for performance
CREATE INDEX idx_training_exercises_primary_muscle ON training_exercises(primary_muscle);
CREATE INDEX idx_training_exercises_difficulty ON training_exercises(difficulty);
CREATE INDEX idx_training_programs_difficulty ON training_programs(difficulty_level);
CREATE INDEX idx_program_exercises_program_id ON program_exercises(program_id);
CREATE INDEX idx_program_exercises_exercise_id ON program_exercises(exercise_id);
