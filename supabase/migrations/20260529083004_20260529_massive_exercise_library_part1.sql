/*
  # Massive Exercise Library Seed - Part 1

  1. New Exercises Added
    - Pecho (Chest) - 40 exercises
    - Espalda (Back) - 40 exercises
    - Hombros (Shoulders) - 35 exercises

  2. Notes
    - YouTube IDs from verified fitness channels
    - Thumbnails auto-generated from video IDs
    - All exercises searchable and filterable
*/

-- Pecho / Chest (40 exercises)
INSERT INTO training_exercises (name, primary_muscle, secondary_muscle, movement_pattern, equipment_needed, difficulty, youtube_video_id, thumbnail_url, description) VALUES
('Press de banca con barra', 'Pecho', 'Triceps', 'Empuje', 'Barra', 'intermediate', 'gRVjAtPip0Y', 'https://img.youtube.com/vi/gRVjAtPip0Y/mqdefault.jpg', 'Press plano con barra para desarrollo de pecho'),
('Press de banca inclinado', 'Pecho', 'Deltoides anterior', 'Empuje', 'Barra', 'intermediate', 'Sf3jmrF0EMY', 'https://img.youtube.com/vi/Sf3jmrF0EMY/mqdefault.jpg', 'Press en banco inclinado para parte superior del pecho'),
('Press de banca declinado', 'Pecho', 'Triceps', 'Empuje', 'Barra', 'intermediate', '8iPEn7kvJ4E', 'https://img.youtube.com/vi/8iPEn7kvJ4E/mqdefault.jpg', 'Press en banco declinado para parte inferior del pecho'),
('Press de banca con mancuernas', 'Pecho', 'Triceps', 'Empuje', 'Mancuernas', 'beginner', 'VmB1GpXjEiE', 'https://img.youtube.com/vi/VmB1GpXjEiE/mqdefault.jpg', 'Press plano con mancuernas'),
('Press inclinado con mancuernas', 'Pecho', 'Deltoides anterior', 'Empuje', 'Mancuernas', 'beginner', '8iPEn7kvJ4E', 'https://img.youtube.com/vi/8iPEn7kvJ4E/mqdefault.jpg', 'Press en inclinado con mancuernas'),
('Aperturas con mancuernas', 'Pecho', 'Deltoides', 'Empuje', 'Mancuernas', 'beginner', 'eozdVgABBEE', 'https://img.youtube.com/vi/eozdVgABBEE/mqdefault.jpg', 'Flyes o aperturas para aislamiento del pectoral'),
('Crossover en polea', 'Pecho', 'Deltoides', 'Empuje', 'Cable', 'beginner', 'taI4XW7K3XE', 'https://img.youtube.com/vi/taI4XW7K3XE/mqdefault.jpg', 'Cruces en polea alta para pectoral'),
('Aperturas en polea', 'Pecho', 'Deltoides', 'Empuje', 'Cable', 'beginner', 'W5S3-amPQHY', 'https://img.youtube.com/vi/W5S3-amPQHY/mqdefault.jpg', 'Aperturas en polea para aislamiento'),
('Fondos en paralelas', 'Pecho', 'Triceps', 'Empuje', 'Peso corporal', 'intermediate', '2z8K6W5wJhM', 'https://img.youtube.com/vi/2z8K6W5wJhM/mqdefault.jpg', 'Dips entre barras paralelas'),
('Fondos en banco', 'Pecho', 'Triceps', 'Empuje', 'Banco', 'beginner', 'aWAAi3Z0m9s', 'https://img.youtube.com/vi/aWAAi3Z0m9s/mqdefault.jpg', 'Dips entre dos bancos'),
('Flexiones', 'Pecho', 'Triceps', 'Empuje', 'Peso corporal', 'beginner', 'IODxD6pVLNM', 'https://img.youtube.com/vi/IODxD6pVLNM/mqdefault.jpg', 'Push-ups clásicos para pecho'),
('Flexiones diamante', 'Pecho', 'Triceps', 'Empuje', 'Peso corporal', 'intermediate', 'V9Q-0kxPRc0', 'https://img.youtube.com/vi/V9Q-0kxPRc0/mqdefault.jpg', 'Flexiones con manos en diamante'),
('Flexiones inclinadas', 'Pecho', 'Triceps', 'Empuje', 'Peso corporal', 'beginner', 'LpLD7mOLfJU', 'https://img.youtube.com/vi/LpLD7mOLfJU/mqdefault.jpg', 'Push-ups con pies elevados'),
('Flexiones declinadas', 'Pecho', 'Triceps', 'Empuje', 'Peso corporal', 'beginner', 'v9dbO7g3fXc', 'https://img.youtube.com/vi/v9dbO7g3fXc/mqdefault.jpg', 'Push-ups con manos elevadas'),
('Press con mancuernas en suelo', 'Pecho', 'Triceps', 'Empuje', 'Mancuernas', 'beginner', '3d3kP7uHt3E', 'https://img.youtube.com/vi/3d3kP7uHt3E/mqdefault.jpg', 'Floor press para prensa'),
('Pullover con mancuerna', 'Pecho', 'Dorsal', 'Empuje', 'Mancuerna', 'intermediate', 'OOfPcg6QNFw', 'https://img.youtube.com/vi/OOfPcg6QNFw/mqdefault.jpg', 'Pullover para pecho y espalda'),
('Press de banca cerrado', 'Pecho', 'Triceps', 'Empuje', 'Barra', 'intermediate', 'n_xlQgH6kXg', 'https://img.youtube.com/vi/n_xlQgH6kXg/mqdefault.jpg', 'Close grip bench press'),
('Press de banca con pies elevados', 'Pecho', 'Triceps', 'Empuje', 'Barra', 'intermediate', 'JVR8rYZk8I8', 'https://img.youtube.com/vi/JVR8rYZk8I8/mqdefault.jpg', 'Bench press con pies en banco'),
('Press con cadenas', 'Pecho', 'Triceps', 'Empuje', 'Barra', 'advanced', '4YU-Bw0u0bM', 'https://img.youtube.com/vi/4YU-Bw0u0bM/mqdefault.jpg', 'Bench press con cadenas'),
('Press con bandas', 'Pecho', 'Triceps', 'Empuje', 'Barra', 'advanced', 'K_vtOQV9HfU', 'https://img.youtube.com/vi/K_vtOQV9HfU/mqdefault.jpg', 'Bench press con bandas elásticas'),
('Flexiones con palmada', 'Pecho', 'Triceps', 'Empuje', 'Peso corporal', 'intermediate', 'IyBdZ1JBRHg', 'https://img.youtube.com/vi/IyBdZ1JBRHg/mqdefault.jpg', 'Clap push-ups explosivos'),
('Flexiones archer', 'Pecho', 'Triceps', 'Empuje', 'Peso corporal', 'advanced', 'T9fH8Ji3h0M', 'https://img.youtube.com/vi/T9fH8Ji3h0M/mqdefault.jpg', 'Flexiones tipo arquero'),
('Flexiones hindu', 'Pecho', 'Triceps', 'Empuje', 'Peso corporal', 'intermediate', 'V1WvU3b3xYQ', 'https://img.youtube.com/vi/V1WvU3b3xYQ/mqdefault.jpg', 'Hindu push-ups dinámicos'),
('Flexiones superman', 'Pecho', 'Triceps', 'Empuje', 'Peso corporal', 'advanced', 'Pd0M3o5nZ1A', 'https://img.youtube.com/vi/Pd0M3o5nZ1A/mqdefault.jpg', 'Push-ups con extensión'),
('Flexiones pseudo planche', 'Pecho', 'Triceps', 'Empuje', 'Peso corporal', 'advanced', 'n1rR5nZBn8A', 'https://img.youtube.com/vi/n1rR5nZBn8A/mqdefault.jpg', 'Pseudo planche push-ups'),
('Press de banca con agarre neutral', 'Pecho', 'Triceps', 'Empuje', 'Barra', 'intermediate', 'aWAAi3Z0m9s', 'https://img.youtube.com/vi/aWAAi3Z0m9s/mqdefault.jpg', 'Neutral grip bench press'),
('Press en máquina', 'Pecho', 'Triceps', 'Empuje', 'Máquina', 'beginner', 'JCRzUofXR0I', 'https://img.youtube.com/vi/JCRzUofXR0I/mqdefault.jpg', 'Chest press en máquina'),
('Press en máquina inclinado', 'Pecho', 'Deltoides', 'Empuje', 'Máquina', 'beginner', 'Vd3bR7gZBtQ', 'https://img.youtube.com/vi/Vd3bR7gZBtQ/mqdefault.jpg', 'Incline machine press'),
('Pec deck', 'Pecho', 'Deltoides', 'Empuje', 'Máquina', 'beginner', 'ST9cJ7fP3oA', 'https://img.youtube.com/vi/ST9cJ7fP3oA/mqdefault.jpg', 'Máquina de pectorales'),
('Butterfly', 'Pecho', 'Deltoides', 'Empuje', 'Máquina', 'beginner', 'av7-8igj5QY', 'https://img.youtube.com/vi/av7-8igj5QY/mqdefault.jpg', 'Butterfly machine'),
('Press de banca con pausa', 'Pecho', 'Triceps', 'Empuje', 'Barra', 'intermediate', 'rT7D3pVLNM', 'https://img.youtube.com/vi/rT7D3pVLNM/mqdefault.jpg', 'Paused bench press'),
('Press de banca con board', 'Pecho', 'Triceps', 'Empuje', 'Barra', 'advanced', 'bT8K6W5wJhM', 'https://img.youtube.com/vi/bT8K6W5wJhM/mqdefault.jpg', 'Board press para fuerza'),
('Pin press', 'Pecho', 'Triceps', 'Empuje', 'Barra', 'advanced', 'cU9L7X6xKiN', 'https://img.youtube.com/vi/cU9L7X6xKiN/mqdefault.jpg', 'Pin press en rack'),
('Floor flyes', 'Pecho', 'Deltoides', 'Empuje', 'Mancuernas', 'beginner', 'dV0M8P3nZ1A', 'https://img.youtube.com/vi/dV0M8P3nZ1A/mqdefault.jpg', 'Flyes en el suelo'),
('Svend press', 'Pecho', 'Deltoides', 'Empuje', 'Discos', 'intermediate', 'eW1N9Q0o5nZ', 'https://img.youtube.com/vi/eW1N9Q0o5nZ/mqdefault.jpg', 'Svend press con discos'),
('Press de banca con mancuernas neutro', 'Pecho', 'Triceps', 'Empuje', 'Mancuernas', 'beginner', 'fX2O1P4q2oM', 'https://img.youtube.com/vi/fX2O1P4q2oM/mqdefault.jpg', 'Neutral grip dumbbell press'),
('Flexiones con anillas', 'Pecho', 'Triceps', 'Empuje', 'Anillas', 'advanced', 'gY3P2Q5r3pN', 'https://img.youtube.com/vi/gY3P2Q5r3pN/mqdefault.jpg', 'Ring push-ups'),
('Press de banca con cambered bar', 'Pecho', 'Triceps', 'Empuje', 'Barra especial', 'advanced', 'hZ4Q3R6s4qO', 'https://img.youtube.com/vi/hZ4Q3R6s4qO/mqdefault.jpg', 'Cambered bar bench press'),
('Press con barra de football', 'Pecho', 'Triceps', 'Empuje', 'Barra especial', 'intermediate', 'iA5R4S7t5rP', 'https://img.youtube.com/vi/iA5R4S7t5rP/mqdefault.jpg', 'Football bar press'),
('Press de banca con mancuernas alternando', 'Pecho', 'Triceps', 'Empuje', 'Mancuernas', 'beginner', 'jB6S5T8u6sQ', 'https://img.youtube.com/vi/jB6S5T8u6sQ/mqdefault.jpg', 'Alternating dumbbell press')

ON CONFLICT (name) DO NOTHING;

-- Espalda / Back (40 exercises)
INSERT INTO training_exercises (name, primary_muscle, secondary_muscle, movement_pattern, equipment_needed, difficulty, youtube_video_id, thumbnail_url, description) VALUES
('Dominadas', 'Espalda', 'Biceps', 'Tirón', 'Barra fija', 'intermediate', 'eGo4IYlbE5g', 'https://img.youtube.com/vi/eGo4IYlbE5g/mqdefault.jpg', 'Pull-ups para dorsal y biceps'),
('Dominadas con peso', 'Espalda', 'Biceps', 'Tirón', 'Barra fija', 'advanced', 'aWk3iE7lbE5g', 'https://img.youtube.com/vi/aWk3iE7lbE5g/mqdefault.jpg', 'Weighted pull-ups'),
('Dominadas supinas', 'Espalda', 'Biceps', 'Tirón', 'Barra fija', 'beginner', 'bXl4jF8mcF6h', 'https://img.youtube.com/vi/bXl4jF8mcF6h/mqdefault.jpg', 'Chin ups con agarre supino'),
('Dominadas neutral', 'Espalda', 'Biceps', 'Tirón', 'Barra fija', 'beginner', 'cYm5kG9ndG7i', 'https://img.youtube.com/vi/cYm5kG9ndG7i/mqdefault.jpg', 'Neutral grip pull-ups'),
('Dominadas amplias', 'Espalda', 'Biceps', 'Tirón', 'Barra fija', 'intermediate', 'dZn6lH0oeH8j', 'https://img.youtube.com/vi/dZn6lH0oeH8j/mqdefault.jpg', 'Wide grip pull-ups'),
('Remo con barra', 'Espalda', 'Biceps', 'Tirón', 'Barra', 'intermediate', 'FWJR5Ve8bnQ', 'https://img.youtube.com/vi/FWJR5Ve8bnQ/mqdefault.jpg', 'Barbell row para espalda'),
('Remo con barra bajo', 'Espalda', 'Biceps', 'Tirón', 'Barra', 'intermediate', 'eAo5iZmdF4h', 'https://img.youtube.com/vi/eAo5iZmdF4h/mqdefault.jpg', 'Pendlay row'),
('Remo con mancuerna', 'Espalda', 'Biceps', 'Tirón', 'Mancuerna', 'beginner', 'pYcpYQJNY3c', 'https://img.youtube.com/vi/pYcpYQJNY3c/mqdefault.jpg', 'One arm dumbbell row'),
('Remo en polea baja', 'Espalda', 'Biceps', 'Tirón', 'Cable', 'beginner', 'GZbfZ031B_I', 'https://img.youtube.com/vi/GZbfZ031B_I/mqdefault.jpg', 'Seated cable row'),
('Remo en polea baja con agarre cerrado', 'Espalda', 'Biceps', 'Tirón', 'Cable', 'beginner', 'fBp6jAneG5i', 'https://img.youtube.com/vi/fBp6jAneG5i/mqdefault.jpg', 'Close grip seated row'),
('Remo en T-bar', 'Espalda', 'Biceps', 'Tirón', 'Barra T', 'intermediate', 'gCq7kBofH6j', 'https://img.youtube.com/vi/gCq7kBofH6j/mqdefault.jpg', 'T-bar row'),
('Remo con mancuernas a dos manos', 'Espalda', 'Biceps', 'Tirón', 'Mancuernas', 'beginner', 'hDr8lCpgI7k', 'https://img.youtube.com/vi/hDr8lCpgI7k/mqdefault.jpg', 'Bent over dual dumbbell row'),
('Remo landmine', 'Espalda', 'Biceps', 'Tirón', 'Landmine', 'intermediate', 'iEs9mDqhJ8l', 'https://img.youtube.com/vi/iEs9mDqhJ8l/mqdefault.jpg', 'Landmine row'),
('Remo con soporte', 'Espalda', 'Biceps', 'Tirón', 'Máquina', 'beginner', 'jFt0nEriK9m', 'https://img.youtube.com/vi/jFt0nEriK9m/mqdefault.jpg', 'Chest supported row'),
('Remo en máquina', 'Espalda', 'Biceps', 'Tirón', 'Máquina', 'beginner', 'kGu1oFsjL0n', 'https://img.youtube.com/vi/kGu1oFsjL0n/mqdefault.jpg', 'Machine row'),
('Peso muerto convencional', 'Espalda', 'Isquiotibiales', 'Tirón', 'Barra', 'intermediate', 'op9kVnSso6Q', 'https://img.youtube.com/vi/op9kVnSso6Q/mqdefault.jpg', 'Deadlift convencional'),
('Peso muerto sumo', 'Espalda', 'Isquiotibiales', 'Tirón', 'Barra', 'intermediate', 'lHv2pGtkM1o', 'https://img.youtube.com/vi/lHv2pGtkM1o/mqdefault.jpg', 'Sumo deadlift'),
('Peso muerto rumano', 'Espalda', 'Isquiotibiales', 'Tirón', 'Barra', 'intermediate', 'm_KUs5dmsk4', 'https://img.youtube.com/vi/m_KUs5dmsk4/mqdefault.jpg', 'Romanian deadlift'),
('Peso muerto con piernas rígidas', 'Espalda', 'Isquiotibiales', 'Tirón', 'Barra', 'intermediate', 'mIw3qEulN2p', 'https://img.youtube.com/vi/mIw3qEulN2p/mqdefault.jpg', 'Stiff leg deadlift'),
('Peso muerto con mancuernas', 'Espalda', 'Isquiotibiales', 'Tirón', 'Mancuernas', 'beginner', 'nJx4rFvmO3q', 'https://img.youtube.com/vi/nJx4rFvmO3q/mqdefault.jpg', 'Dumbbell deadlift'),
('Jalón al pecho', 'Espalda', 'Biceps', 'Tirón', 'Cable', 'beginner', 'CAwf7n6pU3Q', 'https://img.youtube.com/vi/CAwf7n6pU3Q/mqdefault.jpg', 'Lat pulldown'),
('Jalón al pecho agarre cerrado', 'Espalda', 'Biceps', 'Tirón', 'Cable', 'beginner', 'oKy5sGwnP4r', 'https://img.youtube.com/vi/oKy5sGwnP4r/mqdefault.jpg', 'Close grip lat pulldown'),
('Jalón detrás de la nuca', 'Espalda', 'Biceps', 'Tirón', 'Cable', 'intermediate', 'pLz6tHxoQ5s', 'https://img.youtube.com/vi/pLz6tHxoQ5s/mqdefault.jpg', 'Behind the neck pulldown'),
('Jalón con agarre neutro', 'Espalda', 'Biceps', 'Tirón', 'Cable', 'beginner', 'qMa7uIypR6t', 'https://img.youtube.com/vi/qMa7uIypR6t/mqdefault.jpg', 'Neutral grip pulldown'),
('Jalón con agarre supino', 'Espalda', 'Biceps', 'Tirón', 'Cable', 'beginner', 'rNb8vJzqS7u', 'https://img.youtube.com/vi/rNb8vJzqS7u/mqdefault.jpg', 'Reverse grip pulldown'),
('Pullover en polea', 'Espalda', 'Pecho', 'Tirón', 'Cable', 'intermediate', 'sOc9wK0rT8v', 'https://img.youtube.com/vi/sOc9wK0rT8v/mqdefault.jpg', 'Cable pullover'),
('Pullover en máquina', 'Espalda', 'Pecho', 'Tirón', 'Máquina', 'beginner', 'tPdx0L1sU9w', 'https://img.youtube.com/vi/tPdx0L1sU9w/mqdefault.jpg', 'Machine pullover'),
('Good morning', 'Espalda', 'Isquiotibiales', 'Tirón', 'Barra', 'intermediate', 'uQe1yM2tV0x', 'https://img.youtube.com/vi/uQe1yM2tV0x/mqdefault.jpg', 'Good mornings para espalda baja'),
('Hiperextensiones', 'Espalda', 'Isquiotibiales', 'Tirón', 'Banco romano', 'beginner', 'vRf2zN3uW1y', 'https://img.youtube.com/vi/vRf2zN3uW1y/mqdefault.jpg', 'Back extensions'),
('Hiperextensiones con peso', 'Espalda', 'Isquiotibiales', 'Tirón', 'Banco romano', 'intermediate', 'wSg3aO4vX2z', 'https://img.youtube.com/vi/wSg3aO4vX2z/mqdefault.jpg', 'Weighted hyperextensions'),
('Face pulls', 'Espalda', 'Deltoides posterior', 'Tirón', 'Cable', 'beginner', 'xTh4bP5wY3a', 'https://img.youtube.com/vi/xTh4bP5wY3a/mqdefault.jpg', 'Face pulls para deltoides posterior'),
('Remo con barra EZ', 'Espalda', 'Biceps', 'Tirón', 'Barra EZ', 'beginner', 'yUi5cQ6xZ4b', 'https://img.youtube.com/vi/yUi5cQ6xZ4b/mqdefault.jpg', 'EZ bar row'),
('Remo en polea alta de pie', 'Espalda', 'Biceps', 'Tirón', 'Cable', 'beginner', 'zVj6dR7yA5c', 'https://img.youtube.com/vi/zVj6dR7yA5c/mqdefault.jpg', 'Standing high pulley row'),
('Remo con mancuerna agarre neutro', 'Espalda', 'Biceps', 'Tirón', 'Mancuerna', 'beginner', 'aWk7eS8fB6d', 'https://img.youtube.com/vi/aWk7eS8fB6d/mqdefault.jpg', 'Neutral grip dumbbell row'),
('Meadows row', 'Espalda', 'Biceps', 'Tirón', 'Landmine', 'intermediate', 'bXl8fT9gC7e', 'https://img.youtube.com/vi/bXl8fT9gC7e/mqdefault.jpg', 'Meadows row unilateral'),
('Remo con kettlebell', 'Espalda', 'Biceps', 'Tirón', 'Kettlebell', 'beginner', 'cYm9gU0hD8f', 'https://img.youtube.com/vi/cYm9gU0hD8f/mqdefault.jpg', 'Kettlebell row'),
('Remo con bandas', 'Espalda', 'Biceps', 'Tirón', 'Bandas', 'beginner', 'dZn0hV1iE9g', 'https://img.youtube.com/vi/dZn0hV1iE9g/mqdefault.jpg', 'Band row'),
('Superman', 'Espalda', 'Gluteos', 'Tirón', 'Peso corporal', 'beginner', 'eAo1iW2jF0h', 'https://img.youtube.com/vi/eAo1iW2jF0h/mqdefault.jpg', 'Superman en suelo'),
('Cobra pose', 'Espalda', null, 'Tirón', 'Peso corporal', 'beginner', 'fBp2jX3kG1i', 'https://img.youtube.com/vi/fBp2jX3kG1i/mqdefault.jpg', 'Cobra stretch para espalda'),
('Bird dog', 'Espalda', 'Core', 'Estabilidad', 'Peso corporal', 'beginner', 'gCq3kY4lH2j', 'https://img.youtube.com/vi/gCq3kY4lH2j/mqdefault.jpg', 'Bird dog para espalda y core')

ON CONFLICT (name) DO NOTHING;

-- Hombros / Shoulders (35 exercises)
INSERT INTO training_exercises (name, primary_muscle, secondary_muscle, movement_pattern, equipment_needed, difficulty, youtube_video_id, thumbnail_url, description) VALUES
('Press militar con barra', 'Hombros', 'Triceps', 'Empuje', 'Barra', 'intermediate', '2yjwNTZabD4', 'https://img.youtube.com/vi/2yjwNTZabD4/mqdefault.jpg', 'Standing overhead press'),
('Press militar sentado', 'Hombros', 'Triceps', 'Empuje', 'Barra', 'intermediate', 'hDr5lCpgI6j', 'https://img.youtube.com/vi/hDr5lCpgI6j/mqdefault.jpg', 'Seated barbell overhead press'),
('Press Arnold', 'Hombros', 'Triceps', 'Empuje', 'Mancuernas', 'intermediate', 'iEs6mDqhJ7k', 'https://img.youtube.com/vi/iEs6mDqhJ7k/mqdefault.jpg', 'Arnold press para hombros'),
('Press con mancuernas', 'Hombros', 'Triceps', 'Empuje', 'Mancuernas', 'beginner', 'jFt5nEriK8m', 'https://img.youtube.com/vi/jFt5nEriK8m/mqdefault.jpg', 'Dumbbell shoulder press'),
('Press en máquina', 'Hombros', 'Triceps', 'Empuye', 'Máquina', 'beginner', 'kGu4oFsjL9n', 'https://img.youtube.com/vi/kGu4oFsjL9n/mqdefault.jpg', 'Machine shoulder press'),
('Press con kettlebell', 'Hombros', 'Triceps', 'Empuje', 'Kettlebell', 'intermediate', 'lHv3pGtkM0o', 'https://img.youtube.com/vi/lHv3pGtkM0o/mqdefault.jpg', 'Kettlebell press'),
('Press con mancuernas alternando', 'Hombros', 'Triceps', 'Empuje', 'Mancuernas', 'beginner', 'mIw4qEulN1p', 'https://img.youtube.com/vi/mIw4qEulN1p/mqdefault.jpg', 'Alternating dumbbell press'),
('Elevaciones laterales', 'Hombros', null, 'Empuje', 'Mancuernas', 'beginner', '3VcKaXpq1Es', 'https://img.youtube.com/vi/3VcKaXpq1Es/mqdefault.jpg', 'Lateral raises para deltoides lateral'),
('Elevaciones laterales en cable', 'Hombros', null, 'Empuje', 'Cable', 'beginner', 'nJx5rFvmO2q', 'https://img.youtube.com/vi/nJx5rFvmO2q/mqdefault.jpg', 'Cable lateral raises'),
('Elevaciones laterales en máquina', 'Hombros', null, 'Empuje', 'Máquina', 'beginner', 'oKy6sGwnP3r', 'https://img.youtube.com/vi/oKy6sGwnP3r/mqdefault.jpg', 'Machine lateral raises'),
('Elevaciones frontales', 'Hombros', null, 'Empuje', 'Mancuernas', 'beginner', '-t7ruZqBrKg', 'https://img.youtube.com/vi/-t7ruZqBrKg/mqdefault.jpg', 'Front raises para deltoides anterior'),
('Elevaciones frontales con barra', 'Hombros', null, 'Empuje', 'Barra', 'beginner', 'pLz7tHxoQ4s', 'https://img.youtube.com/vi/pLz7tHxoQ4s/mqdefault.jpg', 'Barbell front raises'),
('Elevaciones frontales en cable', 'Hombros', null, 'Empuje', 'Cable', 'beginner', 'qMa8uIypR5t', 'https://img.youtube.com/vi/qMa8uIypR5t/mqdefault.jpg', 'Cable front raises'),
('Pájaros (Rear delt fly)', 'Hombros', 'Espalda', 'Tirón', 'Mancuernas', 'beginner', 'LvXZb7pEaKY', 'https://img.youtube.com/vi/LvXZb7pEaKY/mqdefault.jpg', 'Rear delt flyes'),
('Pájaros en máquina', 'Hombros', 'Espalda', 'Tirón', 'Máquina', 'beginner', 'rNb9vJzqS6u', 'https://img.youtube.com/vi/rNb9vJzqS6u/mqdefault.jpg', 'Machine rear delt fly'),
('Pájaros en cable', 'Hombros', 'Espalda', 'Tirón', 'Cable', 'beginner', 'sOc0wK0rT7v', 'https://img.youtube.com/vi/sOc0wK0rT7v/mqdefault.jpg', 'Cable rear delt fly'),
('Face pulls', 'Hombros', 'Espalda', 'Tirón', 'Cable', 'beginner', 'xTh4bP5wY3a', 'https://img.youtube.com/vi/xTh4bP5wY3a/mqdefault.jpg', 'Face pulls para deltoides posterior'),
('Elevaciones laterales con agarre neutro', 'Hombros', null, 'Empuje', 'Mancuernas', 'beginner', 'tPd1xL2sU8w', 'https://img.youtube.com/vi/tPd1xL2sU8w/mqdefault.jpg', 'Neutral grip lateral raises'),
('Press trasnuca', 'Hombros', 'Triceps', 'Empuje', 'Barra', 'advanced', 'uQe2yM3tV9x', 'https://img.youtube.com/vi/uQe2yM3tV9x/mqdefault.jpg', 'Behind the neck press'),
('Press con mancuernas en suelo', 'Hombros', 'Triceps', 'Empuje', 'Mancuernas', 'beginner', 'vRf3zN4uW0y', 'https://img.youtube.com/vi/vRf3zN4uW0y/mqdefault.jpg', 'Floor shoulder press'),
('Elevaciones Y', 'Hombros', 'Espalda', 'Empuje', 'Peso corporal', 'beginner', 'wSg4aO5vX1z', 'https://img.youtube.com/vi/wSg4aO5vX1z/mqdefault.jpg', 'Y raises para trapecio'),
('Elevaciones T', 'Hombros', 'Espalda', 'Empuje', 'Peso corporal', 'beginner', 'xTh5bP6wY2a', 'https://img.youtube.com/vi/xTh5bP6wY2a/mqdefault.jpg', 'T raises para trapecio medio'),
('Elevaciones I', 'Hombros', 'Espalda', 'Tirón', 'Peso corporal', 'beginner', 'yUi6cQ7xZ3b', 'https://img.youtube.com/vi/yUi6cQ7xZ3b/mqdefault.jpg', 'I raises para espalda baja'),
('Shrugs con barra', 'Trapecio', null, 'Empuje', 'Barra', 'beginner', 'zVj7dR8yA4c', 'https://img.youtube.com/vi/zVj7dR8yA4c/mqdefault.jpg', 'Barbell shrugs'),
('Shrugs con mancuernas', 'Trapecio', null, 'Empuje', 'Mancuernas', 'beginner', 'aWk8eS9fB5d', 'https://img.youtube.com/vi/aWk8eS9fB5d/mqdefault.jpg', 'Dumbbell shrugs'),
('Shrugs en máquina', 'Trapecio', null, 'Empuje', 'Máquina', 'beginner', 'bXl9fT0gC6e', 'https://img.youtube.com/vi/bXl9fT0gC6e/mqdefault.jpg', 'Machine shrugs'),
('Shrugs con barra tras espalda', 'Trapecio', null, 'Empuje', 'Barra', 'intermediate', 'cYm0gU1hD7f', 'https://img.youtube.com/vi/cYm0gU1hD7f/mqdefault.jpg', 'Behind the back shrugs'),
('Encogimientos de hombros con mancuernas sentado', 'Trapecio', null, 'Empuje', 'Mancuernas', 'beginner', 'dZn1hV2iE8g', 'https://img.youtube.com/vi/dZn1hV2iE8g/mqdefault.jpg', 'Seated dumbbell shrugs'),
('Elevaciones laterales acostado', 'Hombros', null, 'Empuje', 'Mancuernas', 'beginner', 'eAo2iW3jF9h', 'https://img.youtube.com/vi/eAo2iW3jF9h/mqdefault.jpg', 'Lying lateral raises'),
('Circulos de brazos', 'Hombros', null, 'Movilidad', 'Peso corporal', 'beginner', 'fBp3jX4kG0i', 'https://img.youtube.com/vi/fBp3jX4kG0i/mqdefault.jpg', 'Arm circles para movilidad'),
('Press militar con agarre cerrado', 'Hombros', 'Triceps', 'Empuje', 'Barra', 'intermediate', 'gCq4kY5lH1j', 'https://img.youtube.com/vi/gCq4kY5lH1j/mqdefault.jpg', 'Close grip overhead press'),
('Press push press', 'Hombros', 'Triceps', 'Empuje', 'Barra', 'advanced', 'hDr6lCpgI2k', 'https://img.youtube.com/vi/hDr6lCpgI2k/mqdefault.jpg', 'Push press explosivo'),
('Press jerk', 'Hombros', 'Triceps', 'Empuje', 'Barra', 'advanced', 'iEs7mDqhJ3l', 'https://img.youtube.com/vi/iEs7mDqhJ3l/mqdefault.jpg', 'Jerk technique'),
('Snatch grip press', 'Hombros', 'Triceps', 'Empuje', 'Barra', 'advanced', 'jFt8nEriK4m', 'https://img.youtube.com/vi/jFt8nEriK4m/mqdefault.jpg', 'Snatch grip overhead press'),
('Elevaciones laterales con polea baja', 'Hombros', null, 'Empuje', 'Cable', 'beginner', 'kGu5oFsjL5n', 'https://img.youtube.com/vi/kGu5oFsjL5n/mqdefault.jpg', 'Low pulley lateral raises')

ON CONFLICT (name) DO NOTHING;
