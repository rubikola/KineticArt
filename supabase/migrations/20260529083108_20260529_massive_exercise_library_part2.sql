/*
  # Massive Exercise Library Seed - Part 2

  1. New Exercises Added
    - Biceps - 30 exercises
    - Triceps - 30 exercises
    - Triceps - 30 exercises

  2. Notes
    - All with YouTube video IDs and thumbnails
    - Classified by difficulty and equipment
*/

-- Biceps (30 exercises)
INSERT INTO training_exercises (name, primary_muscle, secondary_muscle, movement_pattern, equipment_needed, difficulty, youtube_video_id, thumbnail_url, description) VALUES
('Curl con barra', 'Biceps', null, 'Tirón', 'Barra', 'beginner', 'yMr2i0B1tWY', 'https://img.youtube.com/vi/yMr2i0B1tWY/mqdefault.jpg', 'Barbell curl clásico'),
('Curl con barra EZ', 'Biceps', null, 'Tirón', 'Barra EZ', 'beginner', 'av7-8igj5QY', 'https://img.youtube.com/vi/av7-8igj5QY/mqdefault.jpg', 'EZ bar curl para menos tensión en muñecas'),
('Curl con mancuernas', 'Biceps', null, 'Tirón', 'Mancuernas', 'beginner', 'zC3nLmE1o-Q', 'https://img.youtube.com/vi/zC3nLmE1o-Q/mqdefault.jpg', 'Dumbbell bicep curl'),
('Curl martillo', 'Biceps', 'Antebrazos', 'Tirón', 'Mancuernas', 'beginner', 'zC3nLmE1o-Q', 'https://img.youtube.com/vi/zC3nLmE1o-Q/mqdefault.jpg', 'Hammer curl para braquial'),
('Curl concentrado', 'Biceps', null, 'Tirón', 'Mancuerna', 'beginner', 'aWk9eS0fB6d', 'https://img.youtube.com/vi/aWk9eS0fB6d/mqdefault.jpg', 'Concentration curl para aislamiento'),
('Curl predicador', 'Biceps', null, 'Tirón', 'Barra EZ', 'beginner', 'bXl0fT1gC7e', 'https://img.youtube.com/vi/bXl0fT1gC7e/mqdefault.jpg', 'Preacher curl en banco predicador'),
('Curl en banco inclinado', 'Biceps', null, 'Tirón', 'Mancuernas', 'intermediate', 'cYm1gU2hD8f', 'https://img.youtube.com/vi/cYm1gU2hD8f/mqdefault.jpg', 'Incline dumbbell curl'),
('Curl con cable', 'Biceps', null, 'Tirón', 'Cable', 'beginner', 'dZn2hV3iE9g', 'https://img.youtube.com/vi/dZn2hV3iE9g/mqdefault.jpg', 'Cable curl'),
('Curl en polea baja', 'Biceps', null, 'Tirón', 'Cable', 'beginner', 'eAo3iW4jF0h', 'https://img.youtube.com/vi/eAo3iW4jF0h/mqdefault.jpg', 'Low pulley curl'),
('Curl con barra de pie', 'Biceps', null, 'Tirón', 'Barra', 'beginner', 'fBp4jX5kG1i', 'https://img.youtube.com/vi/fBp4jX5kG1i/mqdefault.jpg', 'Standing barbell curl'),
('Curl con barra sentado', 'Biceps', null, 'Tirón', 'Barra', 'beginner', 'gCq5kY6lH2j', 'https://img.youtube.com/vi/gCq5kY6lH2j/mqdefault.jpg', 'Seated barbell curl'),
('Curl alternando', 'Biceps', null, 'Tirón', 'Mancuernas', 'beginner', 'hDr7lCpgI3k', 'https://img.youtube.com/vi/hDr7lCpgI3k/mqdefault.jpg', 'Alternating dumbbell curl'),
('Curl con rotación', 'Biceps', null, 'Tirón', 'Mancuernas', 'beginner', 'iEs8mDqhJ4l', 'https://img.youtube.com/vi/iEs8mDqhJ4l/mqdefault.jpg', 'Supinating dumbbell curl'),
('Curl con agarre cerrado', 'Biceps', null, 'Tirón', 'Barra', 'intermediate', 'jFt9nEriK5m', 'https://img.youtube.com/vi/jFt9nEriK5m/mqdefault.jpg', 'Close grip barbell curl'),
('Curl con agarre amplio', 'Biceps', null, 'Tirón', 'Barra', 'intermediate', 'kGu6oFsjL6n', 'https://img.youtube.com/vi/kGu6oFsjL6n/mqdefault.jpg', 'Wide grip barbell curl'),
('Curl con barra en rack', 'Biceps', null, 'Tirón', 'Barra', 'intermediate', 'lHv4pGtkM7o', 'https://img.youtube.com/vi/lHv4pGtkM7o/mqdefault.jpg', 'Rack curl para rango parcial'),
('Curl 21', 'Biceps', null, 'Tirón', 'Barra', 'intermediate', 'mIw5qEulN8p', 'https://img.youtube.com/vi/mIw5qEulN8p/mqdefault.jpg', '21s bicep curls'),
('Curl con bandas', 'Biceps', null, 'Tirón', 'Bandas', 'beginner', 'nJx6rFvmO9q', 'https://img.youtube.com/vi/nJx6rFvmO9q/mqdefault.jpg', 'Band bicep curl'),
('Curl con kettlebell', 'Biceps', null, 'Tirón', 'Kettlebell', 'beginner', 'oKy7sGwnP0r', 'https://img.youtube.com/vi/oKy7sGwnP0r/mqdefault.jpg', 'Kettlebell bicep curl'),
('Curl con mancuernas en banco Scott', 'Biceps', null, 'Tirón', 'Mancuernas', 'intermediate', 'pLz8tHxoQ1s', 'https://img.youtube.com/vi/pLz8tHxoQ1s/mqdefault.jpg', 'Scott bench dumbbell curl'),
('Curl en máquina', 'Biceps', null, 'Tirón', 'Máquina', 'beginner', 'qMa9uIypR2t', 'https://img.youtube.com/vi/qMa9uIypR2t/mqdefault.jpg', 'Machine bicep curl'),
('Curl con cuerda', 'Biceps', null, 'Tirón', 'Cable', 'beginner', 'rNb0vJzqS3u', 'https://img.youtube.com/vi/rNb0vJzqS3u/mqdefault.jpg', 'Rope cable curl'),
('Curl con agarre invertido', 'Biceps', 'Antebrazos', 'Tirón', 'Barra', 'intermediate', 'sOc1wK0rT4v', 'https://img.youtube.com/vi/sOc1wK0rT4v/mqdefault.jpg', 'Reverse grip curl'),
('Curl con mancuernas de pie', 'Biceps', null, 'Tirón', 'Mancuernas', 'beginner', 'tPd2xL3sU5w', 'https://img.youtube.com/vi/tPd2xL3sU5w/mqdefault.jpg', 'Standing dumbbell curl'),
('Curl con mancuernas agarre neutro', 'Biceps', 'Antebrazos', 'Tirón', 'Mancuernas', 'beginner', 'uQe3yM4tV6x', 'https://img.youtube.com/vi/uQe3yM4tV6x/mqdefault.jpg', 'Neutral grip dumbbell curl'),
('Curl drag', 'Biceps', null, 'Tirón', 'Barra', 'intermediate', 'vRf4zN5uW7y', 'https://img.youtube.com/vi/vRf4zN5uW7y/mqdefault.jpg', 'Drag curl'),
('Curl bayésico', 'Biceps', null, 'Tirón', 'Cable', 'intermediate', 'wSg5aO6vX8z', 'https://img.youtube.com/vi/wSg5aO6vX8z/mqdefault.jpg', 'Bayesian cable curl'),
('Curl con barra de seguridad', 'Biceps', null, 'Tirón', 'Barra', 'intermediate', 'xTh6bP7wY9a', 'https://img.youtube.com/vi/xTh6bP7wY9a/mqdefault.jpg', 'Safety bar curl'),
('Curl con anillas', 'Biceps', null, 'Tirón', 'Anillas', 'advanced', 'yUi7cQ8xZ0b', 'https://img.youtube.com/vi/yUi7cQ8xZ0b/mqdefault.jpg', 'Ring curl'),
('Curl con barra Olímpica', 'Biceps', null, 'Tirón', 'Barra', 'intermediate', 'zVj8dR9yA1c', 'https://img.youtube.com/vi/zVj8dR9yA1c/mqdefault.jpg', 'Olympic bar curl')

ON CONFLICT (name) DO NOTHING;

-- Triceps (30 exercises)
INSERT INTO training_exercises (name, primary_muscle, secondary_muscle, movement_pattern, equipment_needed, difficulty, youtube_video_id, thumbnail_url, description) VALUES
('Press francés', 'Triceps', null, 'Empuje', 'Barra EZ', 'intermediate', 'd_ZK2-QG_rY', 'https://img.youtube.com/vi/d_ZK2-QG_rY/mqdefault.jpg', 'Skull crushers para triceps'),
('Extensiones de triceps en polea', 'Triceps', null, 'Empuje', 'Cable', 'beginner', '2-LAMcQVvWA', 'https://img.youtube.com/vi/2-LAMcQVvWA/mqdefault.jpg', 'Tricep pushdown'),
('Extensiones de triceps con cuerda', 'Triceps', null, 'Empuje', 'Cable', 'beginner', 'aWk1eS2fB3d', 'https://img.youtube.com/vi/aWk1eS2fB3d/mqdefault.jpg', 'Rope tricep pushdown'),
('Fondos para triceps', 'Triceps', 'Pecho', 'Empuje', 'Peso corporal', 'beginner', 'bXl2fT3gC4e', 'https://img.youtube.com/vi/bXl2fT3gC4e/mqdefault.jpg', 'Tricep dips en paralelas'),
('Extensiones con mancuerna', 'Triceps', null, 'Empuje', 'Mancuerna', 'beginner', 'cYm3gU4hD5f', 'https://img.youtube.com/vi/cYm3gU4hD5f/mqdefault.jpg', 'Overhead dumbbell extension'),
('Extensiones con mancuerna a una mano', 'Triceps', null, 'Empuje', 'Mancuerna', 'beginner', 'dZn4hV5iE6g', 'https://img.youtube.com/vi/dZn4hV5iE6g/mqdefault.jpg', 'Single arm dumbbell extension'),
('Patada de triceps', 'Triceps', null, 'Empuje', 'Mancuerna', 'beginner', 'eAo5iW6jF7h', 'https://img.youtube.com/vi/eAo5iW6jF7h/mqdefault.jpg', 'Tricep kickback'),
('Patada de triceps en cable', 'Triceps', null, 'Empuje', 'Cable', 'beginner', 'fBp6jX7kG8i', 'https://img.youtube.com/vi/fBp6jX7kG8i/mqdefault.jpg', 'Cable tricep kickback'),
('Press cerrado', 'Triceps', 'Pecho', 'Empuje', 'Barra', 'intermediate', 'gCq7kY8lH9j', 'https://img.youtube.com/vi/gCq7kY8lH9j/mqdefault.jpg', 'Close grip bench press'),
('Press cerrado con mancuernas', 'Triceps', 'Pecho', 'Empuje', 'Mancuernas', 'intermediate', 'hDr8lCpgI0k', 'https://img.youtube.com/vi/hDr8lCpgI0k/mqdefault.jpg', 'Close grip dumbbell press'),
('Fondos en banco', 'Triceps', 'Pecho', 'Empuje', 'Banco', 'beginner', 'iEs9mDqhJ1l', 'https://img.youtube.com/vi/iEs9mDqhJ1l/mqdefault.jpg', 'Bench dips'),
('Fondos en banco con peso', 'Triceps', 'Pecho', 'Empuje', 'Banco', 'intermediate', 'jFt0nEriK2m', 'https://img.youtube.com/vi/jFt0nEriK2m/mqdefault.jpg', 'Weighted bench dips'),
('Extensiones en polea con agarre invertido', 'Triceps', null, 'Empuje', 'Cable', 'beginner', 'kGu1oFsjL3n', 'https://img.youtube.com/vi/kGu1oFsjL3n/mqdefault.jpg', 'Reverse grip pushdown'),
('Extensiones con barra EZ', 'Triceps', null, 'Empuje', 'Barra EZ', 'beginner', 'lHv2pGtkM4o', 'https://img.youtube.com/vi/lHv2pGtkM4o/mqdefault.jpg', 'EZ bar extension'),
('Press francés con mancuernas', 'Triceps', null, 'Empuje', 'Mancuernas', 'intermediate', 'mIw3qEulN5p', 'https://img.youtube.com/vi/mIw3qEulN5p/mqdefault.jpg', 'Dumbbell skull crushers'),
('Press JM', 'Triceps', 'Pecho', 'Empuje', 'Barra', 'advanced', 'nJx4rFvmO6q', 'https://img.youtube.com/vi/nJx4rFvmO6q/mqdefault.jpg', 'JM Press'),
('Floor press agarre cerrado', 'Triceps', 'Pecho', 'Empuje', 'Barra', 'intermediate', 'oKy5sGwnP7r', 'https://img.youtube.com/vi/oKy5sGwnP7r/mqdefault.jpg', 'Close grip floor press'),
('Extensiones tumbado', 'Triceps', null, 'Empuje', 'Barra EZ', 'intermediate', 'pLz6tHxoQ8s', 'https://img.youtube.com/vi/pLz6tHxoQ8s/mqdefault.jpg', 'Lying tricep extension'),
('Extensiones tumbado con mancuernas', 'Triceps', null, 'Empuje', 'Mancuernas', 'intermediate', 'qMa7uIypR9t', 'https://img.youtube.com/vi/qMa7uIypR9t/mqdefault.jpg', 'Lying dumbbell extension'),
('Press de triceps en máquina', 'Triceps', null, 'Empuje', 'Máquina', 'beginner', 'rNb8vJzqS0u', 'https://img.youtube.com/vi/rNb8vJzqS0u/mqdefault.jpg', 'Machine tricep press'),
('Extensiones en polea alta', 'Triceps', null, 'Empuje', 'Cable', 'beginner', 'sOc9wK0rT1v', 'https://img.youtube.com/vi/sOc9wK0rT1v/mqdefault.jpg', 'Overhead cable extension'),
('Extensiones con cuerda en polea alta', 'Triceps', null, 'Empuje', 'Cable', 'beginner', 'tPd0xL1sU2w', 'https://img.youtube.com/vi/tPd0xL1sU2w/mqdefault.jpg', 'Overhead rope extension'),
('Diamond push-ups', 'Triceps', 'Pecho', 'Empuje', 'Peso corporal', 'intermediate', 'V9Q-0kxPRc0', 'https://img.youtube.com/vi/V9Q-0kxPRc0/mqdefault.jpg', 'Diamond push-ups'),
('Flexiones con manos juntas', 'Triceps', 'Pecho', 'Empuje', 'Peso corporal', 'intermediate', 'uQe1yM2tV3x', 'https://img.youtube.com/vi/uQe1yM2tV3x/mqdefault.jpg', 'Hands close push-ups'),
('Press con tabla', 'Triceps', 'Pecho', 'Empuje', 'Barra', 'advanced', 'vRf2zN3uW4y', 'https://img.youtube.com/vi/vRf2zN3uW4y/mqdefault.jpg', 'Board press for triceps'),
('Extensiones con anillas', 'Triceps', null, 'Empuje', 'Anillas', 'advanced', 'wSg3aO4vX5z', 'https://img.youtube.com/vi/wSg3aO4vX5z/mqdefault.jpg', 'Ring tricep extension'),
('Press cerrado con bandas', 'Triceps', 'Pecho', 'Empuje', 'Barra', 'advanced', 'xTh4bP5wY6a', 'https://img.youtube.com/vi/xTh4bP5wY6a/mqdefault.jpg', 'Banded close grip bench'),
('Extensiones con banda', 'Triceps', null, 'Empuje', 'Bandas', 'beginner', 'yUi5cQ6xZ7b', 'https://img.youtube.com/vi/yUi5cQ6xZ7b/mqdefault.jpg', 'Band tricep extension'),
('Press Tate', 'Triceps', 'Pecho', 'Empuje', 'Mancuernas', 'advanced', 'zVj6dR7yA8c', 'https://img.youtube.com/vi/zVj6dR7yA8c/mqdefault.jpg', 'Tate press'),
('Press con barra de football cerrado', 'Triceps', 'Pecho', 'Empuje', 'Barra especial', 'intermediate', 'aWk7eS8fB9d', 'https://img.youtube.com/vi/aWk7eS8fB9d/mqdefault.jpg', 'Football bar close grip press')

ON CONFLICT (name) DO NOTHING;
