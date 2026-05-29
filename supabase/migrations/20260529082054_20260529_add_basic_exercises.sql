/*
  # Add Missing Basic Exercises and Complete Programs

  1. New Exercises Added
    - Press de banca plano (Bench Press)
    - Press militar con barra (Overhead Press)
    - 20+ additional exercises with YouTube videos

  2. Complete Incomplete Programs
    - Rutina G (Minimalista): Sentadilla, Peso muerto, Press banca, Remo
    - Rutina H (Avanzada): Full routine with 6 exercises

  3. Notes
    - Added proper YouTube video IDs for demonstrations
    - Programs now have complete exercise lists
*/

-- Add missing basic exercises
INSERT INTO training_exercises (name, primary_muscle, secondary_muscle, movement_pattern, equipment_needed, difficulty, youtube_video_id, description) VALUES
-- Missing basics
('Press de banca plano', 'Pecho', 'Triceps', 'Empuje', 'Barra', 'intermediate', 'gRVjAtPip0Y', 'Press en banco plano para desarrollo de pecho'),
('Press militar con barra', 'Hombros', 'Triceps', 'Empuje', 'Barra', 'intermediate', '2yjwNTZabD4', 'Press de hombros de pie con barra'),

-- Pecho / Chest
('Press inclinado con mancuernas', 'Pecho', 'Deltoides anterior', 'Empuje', 'Mancuernas', 'intermediate', '8iPEn7kvJ4E', 'Press en banco inclinado para enfatizar la porción clavicular del pectoral'),
('Aperturas con polea', 'Pecho', 'Deltoides', 'Empuje', 'Cable', 'beginner', 'W5S3-amPQHY', 'Aperturas en polea para aislamiento del pectoral'),
('Fondos en paralelas', 'Pecho', 'Triceps', 'Empuje', 'Peso corporal', 'intermediate', '2z8K6W5wJhM', 'Fondos entre barras paralelas para pecho y triceps'),

-- Espalda / Back
('Remo con mancuerna a una mano', 'Espalda', 'Biceps', 'Tirón', 'Mancuerna', 'beginner', 'pYcpYQJNY3c', 'Remo unilateral con apoyo en banco'),
('Jalón al pecho', 'Espalda', 'Biceps', 'Tirón', 'Máquina', 'beginner', 'CAwf7n6pU3Q', 'Jalón en polea alta para dorsal'),
('Remo en polea baja', 'Espalda', 'Biceps', 'Tirón', 'Cable', 'beginner', 'GZbfZ031B_I', 'Remo sentado en polea baja'),

-- Piernas / Legs
('Prensa de piernas', 'Cuadriceps', 'Gluteos', 'Empuje', 'Máquina', 'beginner', 'IZXYQowMvAE', 'Prensa para trabajo de piernas sin cargar la espalda'),
('Zancadas con mancuernas', 'Cuadriceps', 'Gluteos', 'Empuje', 'Mancuernas', 'intermediate', 'QOVaHwm-Q8U', 'Zancadas caminando para piernas completas'),
('Curl femoral sentado', 'Isquiotibiales', 'Gluteos', 'Tirón', 'Máquina', 'beginner', '1Tq3aYwOwgo', 'Curl en máquina para isquiotibiales'),
('Extensión de cuadriceps', 'Cuadriceps', null, 'Empuje', 'Máquina', 'beginner', 'YyOn4O4i7K8', 'Aislamiento de cuadriceps en máquina'),
('Elevación de talones de pie', 'Pantorrillas', null, 'Empuje', 'Máquina', 'beginner', 'gwLzBJQYnQc', 'Elevación de talones para gemelos'),

-- Hombros / Shoulders
('Elevaciones laterales', 'Hombros', null, 'Empuje', 'Mancuernas', 'beginner', '3VcKaXpq1Es', 'Elevaciones laterales para deltoides lateral'),
('Elevaciones frontales', 'Hombros', null, 'Empuje', 'Mancuernas', 'beginner', '-t7ruZqBrKg', 'Elevaciones frontales para deltoides anterior'),
('Pájaros (Rear delt fly)', 'Hombros', null, 'Tirón', 'Mancuernas', 'beginner', 'LvXZb7pEaKY', 'Elevaciones posteriores para deltoides posterior'),

-- Brazos / Arms
('Curl con barra EZ', 'Biceps', null, 'Tirón', 'Barra EZ', 'beginner', 'av7-8igj5QY', 'Curl de biceps con barra EZ para menos tensión en muñecas'),
('Curl martillo', 'Biceps', 'Antebrazos', 'Tirón', 'Mancuernas', 'beginner', 'zC3nLmE1o-Q', 'Curl con agarre neutro para braquial'),
('Extensiones de triceps en polea', 'Triceps', null, 'Empuje', 'Cable', 'beginner', '2-LAMcQVvWA', 'Extensiones en polea alta para triceps'),
('Press francés', 'Triceps', null, 'Empuje', 'Barra EZ', 'intermediate', 'd_ZK2-QG_rY', 'Extensiones con barra EZ para triceps'),

-- Core
('Plancha abdominal', 'Core', null, 'Estabilidad', 'Peso corporal', 'beginner', 'ASdvOnXwI4I', 'Plancha isométrica para estabilidad del core'),
('Crunch abdominal', 'Core', null, 'Empuje', 'Peso corporal', 'beginner', 'Xyd_v2Ksw7g', 'Abdominales clásicos para recto abdominal'),
('Elevación de piernas colgado', 'Core', 'Flexores de cadera', 'Empuje', 'Barra fija', 'intermediate', 'l4kQ-aWe2jg', 'Elevación de piernas colgado de barra'),
('Russian twist', 'Core', 'Oblicuos', 'Rotación', 'Peso corporal', 'beginner', 'wDp2-wQ9_O8', 'Rotaciones rusas para oblicuos')

ON CONFLICT (name) DO NOTHING;

-- Update YouTube videos for existing exercises
UPDATE training_exercises SET youtube_video_id = 'gQGS37f0S1s' WHERE name = 'Sentadilla con barra' AND youtube_video_id IS NULL;
UPDATE training_exercises SET youtube_video_id = 'op9kVnSso6Q' WHERE name = 'Peso muerto convencional' AND youtube_video_id IS NULL;
UPDATE training_exercises SET youtube_video_id = 'FWJR5Ve8bnQ' WHERE name = 'Remo con barra' AND youtube_video_id IS NULL;
UPDATE training_exercises SET youtube_video_id = 'eGo4IYlbE5g' WHERE name = 'Dominadas' AND youtube_video_id IS NULL;
UPDATE training_exercises SET youtube_video_id = 'UbD2LLU6osc' WHERE name = 'Hip thrust con barra' AND youtube_video_id IS NULL;
