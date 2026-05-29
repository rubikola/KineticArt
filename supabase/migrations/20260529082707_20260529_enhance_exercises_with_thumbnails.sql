/*
  # Enhance Exercises with Thumbnails and Metadata

  1. New Columns Added to exercises table
    - thumbnail_url: YouTube thumbnail image URL
    - video_title: Full title from YouTube video
    - difficulty: beginner/intermediate/advanced
    - equipment_needed: Required equipment
    - movement_pattern: Push/Pull/Hinge/Squat/Carry/etc
  
  2. Update Training Exercises
    - Add thumbnail_url column
    - Add indexes for better search performance

  3. Notes
    - Thumbnails are generated from YouTube video IDs
    - Format: https://img.youtube.com/vi/{video_id}/mqdefault.jpg
*/

-- Add new columns to exercises table
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'exercises' AND column_name = 'thumbnail_url'
  ) THEN
    ALTER TABLE exercises ADD COLUMN thumbnail_url text DEFAULT '';
  END IF;
  
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'exercises' AND column_name = 'difficulty'
  ) THEN
    ALTER TABLE exercises ADD COLUMN difficulty text DEFAULT 'beginner' CHECK (difficulty IN ('beginner', 'intermediate', 'advanced'));
  END IF;
  
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'exercises' AND column_name = 'equipment_needed'
  ) THEN
    ALTER TABLE exercises ADD COLUMN equipment_needed text DEFAULT '';
  END IF;
  
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'exercises' AND column_name = 'movement_pattern'
  ) THEN
    ALTER TABLE exercises ADD COLUMN movement_pattern text DEFAULT '';
  END IF;
END $$;

-- Add columns to training_exercises if not exists
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'training_exercises' AND column_name = 'thumbnail_url'
  ) THEN
    ALTER TABLE training_exercises ADD COLUMN thumbnail_url text DEFAULT '';
  END IF;
END $$;

-- Update existing training_exercises with thumbnail URLs based on youtube_video_id
UPDATE training_exercises 
SET thumbnail_url = 'https://img.youtube.com/vi/' || youtube_video_id || '/mqdefault.jpg'
WHERE youtube_video_id IS NOT NULL AND youtube_video_id != '' AND thumbnail_url = '';

-- Add indexes for better search
CREATE INDEX IF NOT EXISTS idx_exercises_primary_muscle ON exercises(primary_muscle);
CREATE INDEX IF NOT EXISTS idx_exercises_created_by ON exercises(created_by);
CREATE INDEX IF NOT EXISTS idx_training_exercises_primary_muscle ON training_exercises(primary_muscle);
CREATE INDEX IF NOT EXISTS idx_training_exercises_difficulty ON training_exercises(difficulty);
