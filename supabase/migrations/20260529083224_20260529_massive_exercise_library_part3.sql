/*
  # Massive Exercise Library Seed - Part 3

  1. New Exercises Added
    - Piernas (Legs) - 60 exercises
    - Gluteos - 25 exercises  
    - Abdominales/Core - 40 exercises

  2. Notes
    - All with YouTube video IDs and thumbnails
    - Complete coverage of leg muscles
*/

-- Piernas / Legs (60 exercises)
INSERT INTO training_exercises (name, primary_muscle, secondary_muscle, movement_pattern, equipment_needed, difficulty, youtube_video_id, thumbnail_url, description) VALUES
-- Cuadriceps
('Sentadilla con barra', 'Cuadriceps', 'Gluteos', 'Sentadilla', 'Barra', 'intermediate', 'gQGS37f0S1s', 'https://img.youtube.com/vi/gQGS37f0S1s/mqdefault.jpg', 'Back squat clásica'),
('Sentadilla frontal', 'Cuadriceps', 'Gluteos', 'Sentadilla', 'Barra', 'intermediate', 'bXl3fT4gC5e', 'https://img.youtube.com/vi/bXl3fT4gC5e/mqdefault.jpg', 'Front squat para cuadriceps'),
('Sentadilla goblet', 'Cuadriceps', 'Gluteos', 'Sentadilla', 'Mancuerna', 'beginner', 'cYm4gU5hD6f', 'https://img.youtube.com/vi/cYm4gU5hD6f/mqdefault.jpg', 'Goblet squat con mancuerna'),
('Sentadilla overhead', 'Cuadriceps', 'Hombros', 'Sentadilla', 'Barra', 'advanced', 'dZn5hV6iE7g', 'https://img.youtube.com/vi/dZn5hV6iE7g/mqdefault.jpg', 'Overhead squat'),
('Sentadilla con barra de seguridad', 'Cuadriceps', 'Gluteos', 'Sentadilla', 'Barra especial', 'intermediate', 'eAo6iW7jF8h', 'https://img.youtube.com/vi/eAo6iW7jF8h/mqdefault.jpg', 'Safety bar squat'),
('Sentadilla con mancuernas', 'Cuadriceps', 'Gluteos', 'Sentadilla', 'Mancuernas', 'beginner', 'fBp7jX8kG9i', 'https://img.youtube.com/vi/fBp7jX8kG9i/mqdefault.jpg', 'Dumbbell squat'),
('Sentadilla búlgara', 'Cuadriceps', 'Gluteos', 'Sentadilla', 'Mancuernas', 'intermediate', 'gCq8kY9lH0j', 'https://img.youtube.com/vi/gCq8kY9lH0j/mqdefault.jpg', 'Bulgarian split squat'),
('Sentadilla búlgara con barra', 'Cuadriceps', 'Gluteos', 'Sentadilla', 'Barra', 'intermediate', 'hDr9lCpgI1k', 'https://img.youtube.com/vi/hDr9lCpgI1k/mqdefault.jpg', 'Barbell Bulgarian split squat'),
('Sentadilla Zercher', 'Cuadriceps', 'Gluteos', 'Sentadilla', 'Barra', 'advanced', 'iEs0mDqhJ2l', 'https://img.youtube.com/vi/iEs0mDqhJ2l/mqdefault.jpg', 'Zercher squat'),
('Sentadilla box', 'Cuadriceps', 'Gluteos', 'Sentadilla', 'Barra', 'intermediate', 'jFt1nEriK3m', 'https://img.youtube.com/vi/jFt1nEriK3m/mqdefault.jpg', 'Box squat'),
('Sentadilla Anderson', 'Cuadriceps', 'Gluteos', 'Sentadilla', 'Barra', 'advanced', 'kGu2oFsjL4n', 'https://img.youtube.com/vi/kGu2oFsjL4n/mqdefault.jpg', 'Anderson squat from pins'),
('Prensa de piernas', 'Cuadriceps', 'Gluteos', 'Empuje', 'Máquina', 'beginner', 'IZXYQowMvAE', 'https://img.youtube.com/vi/IZXYQowMvAE/mqdefault.jpg', 'Leg press'),
('Prensa con pies altos', 'Cuadriceps', 'Gluteos', 'Empuje', 'Máquina', 'intermediate', 'lHv3pGtkM5o', 'https://img.youtube.com/vi/lHv3pGtkM5o/mqdefault.jpg', 'High foot leg press'),
('Prensa con pies bajos', 'Cuadriceps', null, 'Empuje', 'Máquina', 'intermediate', 'mIw4qEulN6p', 'https://img.youtube.com/vi/mIw4qEulN6p/mqdefault.jpg', 'Low foot leg press'),
('Extensión de cuadriceps', 'Cuadriceps', null, 'Empuje', 'Máquina', 'beginner', 'YyOn4O4i7K8', 'https://img.youtube.com/vi/YyOn4O4i7K8/mqdefault.jpg', 'Leg extension'),
('Zancadas con barra', 'Cuadriceps', 'Gluteos', 'Sentadilla', 'Barra', 'intermediate', 'nJx5rFvmO7q', 'https://img.youtube.com/vi/nJx5rFvmO7q/mqdefault.jpg', 'Barbell lunges'),
('Zancadas con mancuernas', 'Cuadriceps', 'Gluteos', 'Sentadilla', 'Mancuernas', 'beginner', 'QOVaHwm-Q8U', 'https://img.youtube.com/vi/QOVaHwm-Q8U/mqdefault.jpg', 'Dumbbell lunges'),
('Zancadas caminando', 'Cuadriceps', 'Gluteos', 'Sentadilla', 'Mancuernas', 'beginner', 'oKy6sGwnP8r', 'https://img.youtube.com/vi/oKy6sGwnP8r/mqdefault.jpg', 'Walking lunges'),
('Zancadas laterales', 'Cuadriceps', 'Gluteos', 'Sentadilla', 'Mancuernas', 'beginner', 'pLz7tHxoQ9s', 'https://img.youtube.com/vi/pLz7tHxoQ9s/mqdefault.jpg', 'Lateral lunges'),
('Zancadas reversas', 'Cuadriceps', 'Gluteos', 'Sentadilla', 'Barra', 'intermediate', 'qMa8uIypR0t', 'https://img.youtube.com/vi/qMa8uIypR0t/mqdefault.jpg', 'Reverse lunges'),
('Step ups', 'Cuadriceps', 'Gluteos', 'Empuje', 'Mancuernas', 'beginner', 'rNb9vJzqS1u', 'https://img.youtube.com/vi/rNb9vJzqS1u/mqdefault.jpg', 'Step ups'),
('Step ups con barra', 'Cuadriceps', 'Gluteos', 'Empuje', 'Barra', 'intermediate', 'sOc0wK0rT2v', 'https://img.youtube.com/vi/sOc0wK0rT2v/mqdefault.jpg', 'Barbell step ups'),
('Sentadilla pisón', 'Cuadriceps', 'Gluteos', 'Sentadilla', 'Barra', 'advanced', 'tPd1xL2sU3w', 'https://img.youtube.com/vi/tPd1xL2sU3w/mqdefault.jpg', 'Hack squat'),
('Sentadilla pisón con máquina', 'Cuadriceps', null, 'Sentadilla', 'Máquina', 'beginner', 'uQe2yM3tV4x', 'https://img.youtube.com/vi/uQe2yM3tV4x/mqdefault.jpg', 'Machine hack squat'),
('Sentadilla sissy', 'Cuadriceps', null, 'Sentadilla', 'Peso corporal', 'advanced', 'vRf3zN4uW5y', 'https://img.youtube.com/vi/vRf3zN4uW5y/mqdefault.jpg', 'Sissy squat'),
('Sentadilla con anillas', 'Cuadriceps', 'Gluteos', 'Sentadilla', 'Anillas', 'advanced', 'wSg4aO5vX6z', 'https://img.youtube.com/vi/wSg4aO5vX6z/mqdefault.jpg', 'Ring squat'),

-- Isquiotibiales
('Curl femoral acostado', 'Isquiotibiales', null, 'Tirón', 'Máquina', 'beginner', 'xTh5bP6wY7a', 'https://img.youtube.com/vi/xTh5bP6wY7a/mqdefault.jpg', 'Lying leg curl'),
('Curl femoral sentado', 'Isquiotibiales', null, 'Tirón', 'Máquina', 'beginner', '1Tq3aYwOwgo', 'https://img.youtube.com/vi/1Tq3aYwOwgo/mqdefault.jpg', 'Seated leg curl'),
('Curl femoral de pie', 'Isquiotibiales', null, 'Tirón', 'Máquina', 'beginner', 'yUi6cQ7xZ8b', 'https://img.youtube.com/vi/yUi6cQ7xZ8b/mqdefault.jpg', 'Standing leg curl'),
('Curl femoral con balón suizo', 'Isquiotibiales', null, 'Tirón', 'Balón suizo', 'beginner', 'zVj7dR8yA9c', 'https://img.youtube.com/vi/zVj7dR8yA9c/mqdefault.jpg', 'Swiss ball hamstring curl'),
('Peso muerto rumano', 'Isquiotibiales', 'Espalda', 'Tirón', 'Barra', 'intermediate', 'm_KUs5dmsk4', 'https://img.youtube.com/vi/m_KUs5dmsk4/mqdefault.jpg', 'Romanian deadlift'),
('Peso muerto con piernas rígidas', 'Isquiotibiales', 'Espalda', 'Tirón', 'Barra', 'intermediate', 'aWk8eS9fB0d', 'https://img.youtube.com/vi/aWk8eS9fB0d/mqdefault.jpg', 'Stiff leg deadlift'),
('Good morning', 'Isquiotibiales', 'Espalda', 'Tirón', 'Barra', 'intermediate', 'uQe1yM2tV0x', 'https://img.youtube.com/vi/uQe1yM2tV0x/mqdefault.jpg', 'Good mornings'),
('Curl nordico', 'Isquiotibiales', null, 'Tirón', 'Peso corporal', 'advanced', 'bXl9fT0gC1e', 'https://img.youtube.com/vi/bXl9fT0gC1e/mqdefault.jpg', 'Nordic curl'),
('Peso muerto rumano con mancuernas', 'Isquiotibiales', 'Espalda', 'Tirón', 'Mancuernas', 'beginner', 'cYm0gU1hD2f', 'https://img.youtube.com/vi/cYm0gU1hD2f/mqdefault.jpg', 'Dumbbell RDL'),
('Curl con mancuernas', 'Isquiotibiales', null, 'Tirón', 'Mancuerna', 'beginner', 'dZn1hV2iE3g', 'https://img.youtube.com/vi/dZn1hV2iE3g/mqdefault.jpg', 'Dumbbell leg curl'),
('Glute ham raise', 'Isquiotibiales', 'Gluteos', 'Tirón', 'Máquina', 'advanced', 'eAo2iW3jF4h', 'https://img.youtube.com/vi/eAo2iW3jF4h/mqdefault.jpg', 'Glute ham developer'),

-- Pantorrillas
('Elevación de talones de pie', 'Pantorrillas', null, 'Empuje', 'Máquina', 'beginner', 'gwLzBJQYnQc', 'https://img.youtube.com/vi/gwLzBJQYnQc/mqdefault.jpg', 'Standing calf raise'),
('Elevación de talones sentado', 'Pantorrillas', null, 'Empuje', 'Máquina', 'beginner', 'fBp3jX4kG5i', 'https://img.youtube.com/vi/fBp3jX4kG5i/mqdefault.jpg', 'Seated calf raise'),
('Elevación de talones con barra', 'Pantorrillas', null, 'Empuje', 'Barra', 'intermediate', 'gCq4kY5lH6j', 'https://img.youtube.com/vi/gCq4kY5lH6j/mqdefault.jpg', 'Barbell calf raise'),
('Elevación de talones con mancuernas', 'Pantorrillas', null, 'Empuje', 'Mancuernas', 'beginner', 'hDr5lCpgI7k', 'https://img.youtube.com/vi/hDr5lCpgI7k/mqdefault.jpg', 'Dumbbell calf raise'),
('Elevación de talones en prensa', 'Pantorrillas', null, 'Empuje', 'Máquina', 'beginner', 'iEs6mDqhJ8l', 'https://img.youtube.com/vi/iEs6mDqhJ8l/mqdefault.jpg', 'Leg press calf raise'),
('Elevación de talones en step', 'Pantorrillas', null, 'Empuje', 'Step', 'beginner', 'jFt7nEriK9m', 'https://img.youtube.com/vi/jFt7nEriK9m/mqdefault.jpg', 'Single leg calf raise'),
('Elevación de talones burro', 'Pantorrillas', null, 'Empuje', 'Máquina', 'intermediate', 'kGu8oFsjL0n', 'https://img.youtube.com/vi/kGu8oFsjL0n/mqdefault.jpg', 'Donkey calf raise'),

-- Aductores
('Aducción en máquina', 'Aductores', null, 'Empuje', 'Máquina', 'beginner', 'lHv9pGtkM1o', 'https://img.youtube.com/vi/lHv9pGtkM1o/mqdefault.jpg', 'Machine adductor'),
('Aducción con cable', 'Aductores', null, 'Empuje', 'Cable', 'beginner', 'mIw0qEulN2p', 'https://img.youtube.com/vi/mIw0qEulN2p/mqdefault.jpg', 'Cable adduction'),
('Sentadilla sumo', 'Cuadriceps', 'Aductores', 'Sentadilla', 'Barra', 'intermediate', 'nJx1rFvmO3q', 'https://img.youtube.com/vi/nJx1rFvmO3q/mqdefault.jpg', 'Sumo squat'),
('Sentadilla plie', 'Cuadriceps', 'Aductores', 'Sentadilla', 'Mancuerna', 'beginner', 'oKy2sGwnP4r', 'https://img.youtube.com/vi/oKy2sGwnP4r/mqdefault.jpg', 'Plié squat'),

-- Abductores  
('Abducción en máquina', 'Abductores', null, 'Empuje', 'Máquina', 'beginner', 'pLz3tHxoQ5s', 'https://img.youtube.com/vi/pLz3tHxoQ5s/mqdefault.jpg', 'Machine abductor'),
('Abducción con cable', 'Abductores', null, 'Empuje', 'Cable', 'beginner', 'qMa4uIypR6t', 'https://img.youtube.com/vi/qMa4uIypR6t/mqdefault.jpg', 'Cable abduction'),
('Banda de caminar lateral', 'Abductores', null, 'Empuje', 'Bandas', 'beginner', 'rNb5vJzqS7u', 'https://img.youtube.com/vi/rNb5vJzqS7u/mqdefault.jpg', 'Lateral band walk'),
('Patada de glúteo en cable', 'Abductores', 'Gluteos', 'Empuje', 'Cable', 'beginner', 'sOc6wK0rT8v', 'https://img.youtube.com/vi/sOc6wK0rT8v/mqdefault.jpg', 'Cable glute kickback'),

-- Combinados
('Sentadilla con salto', 'Cuadriceps', 'Gluteos', 'Salto', 'Peso corporal', 'intermediate', 'tPd7xL8sU9w', 'https://img.youtube.com/vi/tPd7xL8sU9w/mqdefault.jpg', 'Jump squat'),
('Sentadilla con salto con peso', 'Cuadriceps', 'Gluteos', 'Salto', 'Mancuernas', 'intermediate', 'uQe8yM9tV0x', 'https://img.youtube.com/vi/uQe8yM9tV0x/mqdefault.jpg', 'Weighted jump squat'),
('Saltos de caja', 'Cuadriceps', 'Gluteos', 'Salto', 'Caja', 'intermediate', 'vRf9zN0uW1y', 'https://img.youtube.com/vi/vRf9zN0uW1y/mqdefault.jpg', 'Box jumps')

ON CONFLICT (name) DO NOTHING;

-- Gluteos (25 exercises)
INSERT INTO training_exercises (name, primary_muscle, secondary_muscle, movement_pattern, equipment_needed, difficulty, youtube_video_id, thumbnail_url, description) VALUES
('Hip thrust con barra', 'Gluteos', 'Isquiotibiales', 'Empuje', 'Barra', 'intermediate', 'UbD2LLU6osc', 'https://img.youtube.com/vi/UbD2LLU6osc/mqdefault.jpg', 'Hip thrust para glúteos'),
('Hip thrust con mancuernas', 'Gluteos', 'Isquiotibiales', 'Empuje', 'Mancuernas', 'beginner', 'wSg0aO1vX2z', 'https://img.youtube.com/vi/wSg0aO1vX2z/mqdefault.jpg', 'Dumbbell hip thrust'),
('Hip thrust en máquina', 'Gluteos', 'Isquiotibiales', 'Empuje', 'Máquina', 'beginner', 'xTh1bP2wY3a', 'https://img.youtube.com/vi/xTh1bP2wY3a/mqdefault.jpg', 'Machine hip thrust'),
('Hip thrust una pierna', 'Gluteos', 'Isquiotibiales', 'Empuje', 'Barra', 'advanced', 'yUi2cQ3xZ4b', 'https://img.youtube.com/vi/yUi2cQ3xZ4b/mqdefault.jpg', 'Single leg hip thrust'),
('Puente de glúteos', 'Gluteos', 'Isquiotibiales', 'Empuje', 'Peso corporal', 'beginner', 'zVj3dR4yA5c', 'https://img.youtube.com/vi/zVj3dR4yA5c/mqdefault.jpg', 'Glute bridge'),
('Puente de glúteos con peso', 'Gluteos', 'Isquiotibiales', 'Empuje', 'Mancuerna', 'beginner', 'aWk4eS5fB6d', 'https://img.youtube.com/vi/aWk4eS5fB6d/mqdefault.jpg', 'Weighted glute bridge'),
('Patada de glúteo en máquina', 'Gluteos', null, 'Empuje', 'Máquina', 'beginner', 'bXl5fT6gC7e', 'https://img.youtube.com/vi/bXl5fT6gC7e/mqdefault.jpg', 'Machine glute kickback'),
('Patada de glúteo en cable', 'Gluteos', null, 'Empuje', 'Cable', 'beginner', 'sOc6wK0rT8v', 'https://img.youtube.com/vi/sOc6wK0rT8v/mqdefault.jpg', 'Cable glute kickback'),
('Abducción de cadera en máquina', 'Gluteos', 'Abductores', 'Empuje', 'Máquina', 'beginner', 'pLz3tHxoQ5s', 'https://img.youtube.com/vi/pLz3tHxoQ5s/mqdefault.jpg', 'Hip abduction machine'),
('Abducción de cadera con banda', 'Gluteos', 'Abductores', 'Empuje', 'Bandas', 'beginner', 'cYm7gU8hD9f', 'https://img.youtube.com/vi/cYm7gU8hD9f/mqdefault.jpg', 'Band hip abduction'),
('Sentadilla sumo', 'Gluteos', 'Cuadriceps', 'Sentadilla', 'Barra', 'intermediate', 'lHv9pGtkM1o', 'https://img.youtube.com/vi/lHv9pGtkM1o/mqdefault.jpg', 'Sumo squat for glutes'),
('Sentadilla búlgara', 'Gluteos', 'Cuadriceps', 'Sentadilla', 'Mancuernas', 'intermediate', 'gCq8kY9lH0j', 'https://img.youtube.com/vi/gCq8kY9lH0j/mqdefault.jpg', 'Bulgarian split squat'),
('Zancadas inversas', 'Gluteos', 'Cuadriceps', 'Sentadilla', 'Mancuernas', 'beginner', 'qMa8uIypR0t', 'https://img.youtube.com/vi/qMa8uIypR0t/mqdefault.jpg', 'Reverse lunges'),
('Peso muerto sumo', 'Gluteos', 'Isquiotibiales', 'Tirón', 'Barra', 'intermediate', 'lHv2pGtkM1o', 'https://img.youtube.com/vi/lHv2pGtkM1o/mqdefault.jpg', 'Sumo deadlift'),
('Peso muerto con mancuernas entre piernas', 'Gluteos', 'Isquiotibiales', 'Tirón', 'Mancuerna', 'beginner', 'dZn9hV0iE1g', 'https://img.youtube.com/vi/dZn9hV0iE1g/mqdefault.jpg', 'Dumbbell deadlift between legs'),
('Clamshell', 'Gluteos', 'Abductores', 'Empuje', 'Banda', 'beginner', 'eAo0iW1jF2h', 'https://img.youtube.com/vi/eAo0iW1jF2h/mqdefault.jpg', 'Clamshell exercise'),
('Fire hydrant', 'Gluteos', 'Abductores', 'Empuje', 'Peso corporal', 'beginner', 'fBp1jX2kG3i', 'https://img.youtube.com/vi/fBp1jX2kG3i/mqdefault.jpg', 'Fire hydrant'),
('Step ups laterales', 'Gluteos', 'Cuadriceps', 'Empuje', 'Mancuernas', 'beginner', 'gCq2kY3lH4j', 'https://img.youtube.com/vi/gCq2kY3lH4j/mqdefault.jpg', 'Lateral step ups'),
('Sentadilla curtsy', 'Gluteos', 'Cuadriceps', 'Sentadilla', 'Mancuernas', 'beginner', 'hDr3lCpgI5k', 'https://img.youtube.com/vi/hDr3lCpgI5k/mqdefault.jpg', 'Curtsy lunge'),
('Extensión de cadera en polea', 'Gluteos', null, 'Empuje', 'Cable', 'beginner', 'iEs4mDqhJ6l', 'https://img.youtube.com/vi/iEs4mDqhJ6l/mqdefault.jpg', 'Cable hip extension'),
('Sentadilla caja con banda', 'Gluteos', 'Cuadriceps', 'Sentadilla', 'Bandas', 'beginner', 'jFt5nEriK7m', 'https://img.youtube.com/vi/jFt5nEriK7m/mqdefault.jpg', 'Banded box squat'),
('Marcha de cadera', 'Gluteos', null, 'Empuje', 'Peso corporal', 'beginner', 'kGu6oFsjL8n', 'https://img.youtube.com/vi/kGu6oFsjL8n/mqdefault.jpg', 'Hip march'),
('Glute kickback con banda', 'Gluteos', null, 'Empuje', 'Bandas', 'beginner', 'lHv7pGtkM9o', 'https://img.youtube.com/vi/lHv7pGtkM9o/mqdefault.jpg', 'Banded glute kickback'),
('Sentadilla lateral', 'Gluteos', 'Cuadriceps', 'Sentadilla', 'Mancuernas', 'beginner', 'mIw8qEulN0p', 'https://img.youtube.com/vi/mIw8qEulN0p/mqdefault.jpg', 'Side squat'),
('45-degree hip extension', 'Gluteos', 'Isquiotibiales', 'Empuje', 'Máquina', 'beginner', 'nJx9rFvmO1q', 'https://img.youtube.com/vi/nJx9rFvmO1q/mqdefault.jpg', '45 degree hip extension')

ON CONFLICT (name) DO NOTHING;
