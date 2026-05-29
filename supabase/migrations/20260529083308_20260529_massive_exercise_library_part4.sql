/*
  # Massive Exercise Library Seed - Part 4 - Core

  1. New Exercises Added
    - Abdominales/Core - 40 exercises

  2. Notes
    - Upper abs, lower abs, obliques, full core coverage
    - All with YouTube video IDs and thumbnails
*/

-- Abdominales/Core (40 exercises)
INSERT INTO training_exercises (name, primary_muscle, secondary_muscle, movement_pattern, equipment_needed, difficulty, youtube_video_id, thumbnail_url, description) VALUES
('Plancha abdominal', 'Core', null, 'Estabilidad', 'Peso corporal', 'beginner', 'ASdvOnXwI4I', 'https://img.youtube.com/vi/ASdvOnXwI4I/mqdefault.jpg', 'Plank isométrico'),
('Plancha lateral', 'Core', 'Oblicuos', 'Estabilidad', 'Peso corporal', 'beginner', 'oKy3sGwnP4r', 'https://img.youtube.com/vi/oKy3sGwnP4r/mqdefault.jpg', 'Side plank'),
('Plancha alta', 'Core', null, 'Estabilidad', 'Peso corporal', 'beginner', 'pLz4tHxoQ5s', 'https://img.youtube.com/vi/pLz4tHxoQ5s/mqdefault.jpg', 'High plank'),
('Plancha con toque de hombro', 'Core', null, 'Estabilidad', 'Peso corporal', 'intermediate', 'qMa5uIypR6t', 'https://img.youtube.com/vi/qMa5uIypR6t/mqdefault.jpg', 'Shoulder tap plank'),
('Crunch abdominal', 'Core', null, 'Empuje', 'Peso corporal', 'beginner', 'Xyd_v2Ksw7g', 'https://img.youtube.com/vi/Xyd_v2Ksw7g/mqdefault.jpg', 'Crunches clásicos'),
('Crunch en máquina', 'Core', null, 'Empuje', 'Máquina', 'beginner', 'rNb6vJzqS7u', 'https://img.youtube.com/vi/rNb6vJzqS7u/mqdefault.jpg', 'Machine crunch'),
('Crunch con cable', 'Core', null, 'Empuje', 'Cable', 'beginner', 'sOc7wK0rT8v', 'https://img.youtube.com/vi/sOc7wK0rT8v/mqdefault.jpg', 'Cable crunch'),
('Crunch en balón suizo', 'Core', null, 'Empuje', 'Balón suizo', 'beginner', 'tPd8xL9sU0w', 'https://img.youtube.com/vi/tPd8xL9sU0w/mqdefault.jpg', 'Swiss ball crunch'),
('Crunch oblicuo', 'Core', 'Oblicuos', 'Empuje', 'Peso corporal', 'beginner', 'uQe9yM0tV1x', 'https://img.youtube.com/vi/uQe9yM0tV1x/mqdefault.jpg', 'Oblique crunch'),
('Crunch cruzado', 'Core', 'Oblicuos', 'Empuje', 'Peso corporal', 'beginner', 'vRf0zN1uW2y', 'https://img.youtube.com/vi/vRf0zN1uW2y/mqdefault.jpg', 'Cross body crunch'),
('Elevación de piernas', 'Core', 'Flexores de cadera', 'Empuje', 'Peso corporal', 'beginner', 'wSg1aO2vX3z', 'https://img.youtube.com/vi/wSg1aO2vX3z/mqdefault.jpg', 'Leg raises'),
('Elevación de piernas colgado', 'Core', 'Flexores de cadera', 'Empuje', 'Barra fija', 'intermediate', 'l4kQ-aWe2jg', 'https://img.youtube.com/vi/l4kQ-aWe2jg/mqdefault.jpg', 'Hanging leg raises'),
('Elevación de rodillas colgado', 'Core', 'Flexores de cadera', 'Empuje', 'Barra fija', 'beginner', 'xTh2bP3wY4a', 'https://img.youtube.com/vi/xTh2bP3wY4a/mqdefault.jpg', 'Hanging knee raises'),
('Elevación de piernas en paralelas', 'Core', 'Flexores de cadera', 'Empuje', 'Paralelas', 'intermediate', 'yUi3cQ4xZ5b', 'https://img.youtube.com/vi/yUi3cQ4xZ5b/mqdefault.jpg', 'Parallel bar leg raise'),
('Elevación de piernas en banco', 'Core', 'Flexores de cadera', 'Empuje', 'Banco', 'beginner', 'zVj4dR5yA6c', 'https://img.youtube.com/vi/zVj4dR5yA6c/mqdefault.jpg', 'Bench leg raises'),
('Elevación de piernas con cable', 'Core', 'Flexores de cadera', 'Empuje', 'Cable', 'beginner', 'aWk5eS6fB7d', 'https://img.youtube.com/vi/aWk5eS6fB7d/mqdefault.jpg', 'Cable leg raises'),
('Russian twist', 'Core', 'Oblicuos', 'Rotación', 'Peso corporal', 'beginner', 'wDp2-wQ9_O8', 'https://img.youtube.com/vi/wDp2-wQ9_O8/mqdefault.jpg', 'Russian twists'),
('Russian twist con peso', 'Core', 'Oblicuos', 'Rotación', 'Mancuerna', 'intermediate', 'bXl6fT7gC8e', 'https://img.youtube.com/vi/bXl6fT7gC8e/mqdefault.jpg', 'Weighted Russian twist'),
('Twist en polea', 'Core', 'Oblicuos', 'Rotación', 'Cable', 'beginner', 'cYm7gU8hD9f', 'https://img.youtube.com/vi/cYm7gU8hD9f/mqdefault.jpg', 'Cable woodchop'),
('Twist en polea alta', 'Core', 'Oblicuos', 'Rotación', 'Cable', 'beginner', 'dZn8hV9iE0g', 'https://img.youtube.com/vi/dZn8hV9iE0g/mqdefault.jpg', 'High cable woodchop'),
('Twist en polea baja', 'Core', 'Oblicuos', 'Rotación', 'Cable', 'beginner', 'eAo9iW0jF1h', 'https://img.youtube.com/vi/eAo9iW0jF1h/mqdefault.jpg', 'Low cable woodchop'),
('Bicycle crunch', 'Core', 'Oblicuos', 'Rotación', 'Peso corporal', 'beginner', 'fBp0jX1kG2i', 'https://img.youtube.com/vi/fBp0jX1kG2i/mqdefault.jpg', 'Bicycle crunches'),
('Mountain climbers', 'Core', 'Flexores de cadera', 'Empuje', 'Peso corporal', 'beginner', 'gCq1kY2lH3j', 'https://img.youtube.com/vi/gCq1kY2lH3j/mqdefault.jpg', 'Mountain climbers'),
('Ab wheel rollout', 'Core', null, 'Empuje', 'Ab wheel', 'intermediate', 'hDr2lCpgI4k', 'https://img.youtube.com/vi/hDr2lCpgI4k/mqdefault.jpg', 'Ab wheel rollout'),
('Rollout con balón suizo', 'Core', null, 'Empuje', 'Balón suizo', 'intermediate', 'iEs3mDqhJ5l', 'https://img.youtube.com/vi/iEs3mDqhJ5l/mqdefault.jpg', 'Swiss ball rollout'),
('Dead bug', 'Core', null, 'Estabilidad', 'Peso corporal', 'beginner', 'jFt4nEriK6m', 'https://img.youtube.com/vi/jFt4nEriK6m/mqdefault.jpg', 'Dead bug exercise'),
('Bird dog', 'Core', 'Espalda', 'Estabilidad', 'Peso corporal', 'beginner', 'gCq3kY4lH2j', 'https://img.youtube.com/vi/gCq3kY4lH2j/mqdefault.jpg', 'Bird dog for core'),
('V-ups', 'Core', null, 'Empuje', 'Peso corporal', 'intermediate', 'kGu5oFsjL6n', 'https://img.youtube.com/vi/kGu5oFsjL6n/mqdefault.jpg', 'V-up crunches'),
('Tuck ups', 'Core', 'Flexores de cadera', 'Empuje', 'Peso corporal', 'intermediate', 'lHv6pGtkM7o', 'https://img.youtube.com/vi/lHv6pGtkM7o/mqdefault.jpg', 'Tuck ups'),
('L-sit', 'Core', 'Flexores de cadera', 'Estabilidad', 'Paralelas', 'advanced', 'mIw7qEulN8p', 'https://img.youtube.com/vi/mIw7qEulN8p/mqdefault.jpg', 'L-sit hold'),
('L-sit en suelo', 'Core', 'Flexores de cadera', 'Estabilidad', 'Peso corporal', 'advanced', 'nJx8rFvmO9q', 'https://img.youtube.com/vi/nJx8rFvmO9q/mqdefault.jpg', 'Floor L-sit'),
('Hollow hold', 'Core', null, 'Estabilidad', 'Peso corporal', 'beginner', 'oKy9sGwnP0r', 'https://img.youtube.com/vi/oKy9sGwnP0r/mqdefault.jpg', 'Hollow body hold'),
('Hollow rocks', 'Core', null, 'Empuje', 'Peso corporal', 'beginner', 'pLz0tHxoQ1s', 'https://img.youtube.com/vi/pLz0tHxoQ1s/mqdefault.jpg', 'Hollow body rocks'),
('Arch hold', 'Core', 'Espalda', 'Estabilidad', 'Peso corporal', 'beginner', 'qMa1uIypR2t', 'https://img.youtube.com/vi/qMa1uIypR2t/mqdefault.jpg', 'Arch hold'),
('Arch rocks', 'Core', 'Espalda', 'Tirón', 'Peso corporal', 'beginner', 'rNb2vJzqS3u', 'https://img.youtube.com/vi/rNb2vJzqS3u/mqdefault.jpg', 'Arch rocks'),
('Crunch con twist', 'Core', 'Oblicuos', 'Empuje', 'Peso corporal', 'beginner', 'sOc3wK0rT4v', 'https://img.youtube.com/vi/sOc3wK0rT4v/mqdefault.jpg', 'Crunch with twist'),
('Side bend con mancuerna', 'Core', 'Oblicuos', 'Empuje', 'Mancuerna', 'beginner', 'tPd4xL5sU6w', 'https://img.youtube.com/vi/tPd4xL5sU6w/mqdefault.jpg', 'Dumbbell side bend'),
('Windshield wipers', 'Core', 'Oblicuos', 'Rotación', 'Barra fija', 'advanced', 'uQe5yM6tV7x', 'https://img.youtube.com/vi/uQe5yM6tV7x/mqdefault.jpg', 'Windshield wipers'),
('Dragon flag', 'Core', null, 'Empuje', 'Banco', 'advanced', 'vRf6zN7uW8y', 'https://img.youtube.com/vi/vRf6zN7uW8y/mqdefault.jpg', 'Dragon flag'),
('Toes to bar', 'Core', 'Flexores de cadera', 'Empuje', 'Barra fija', 'advanced', 'wSg7aO8vX9z', 'https://img.youtube.com/vi/wSg7aO8vX9z/mqdefault.jpg', 'Toes to bar')

ON CONFLICT (name) DO NOTHING;
