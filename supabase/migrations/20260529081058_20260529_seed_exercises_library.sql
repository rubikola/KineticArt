/*
  # Seed Training Exercises Library
  
  Populate the exercises from the CP Trainer Full Body Guide
*/

INSERT INTO training_exercises (name, primary_muscle, secondary_muscle, movement_pattern, equipment_needed, difficulty, description) VALUES
-- Lower Body
('Hip Thrust con barra', 'Gluteos', 'Isquiotibiales', 'hip_dominant', 'Barbell', 'intermediate', 'Pies firmes, barbilla al pecho, apreta gluteos 1 seg arriba. No arquear la lumbar.'),
('Peso muerto rumano', 'Isquiotibiales', 'Gluteos', 'hip_dominant', 'Barbell/Dumbbells', 'intermediate', 'Espalda recta, barra hasta media espinilla sin redondear. Siente el estiramiento detras.'),
('Sentadilla búlgara', 'Cuadriceps', 'Gluteos', 'knee_dominant', 'Bodyweight', 'beginner', 'Pie trasero apoyado, bajar controlado, torso recto. Manten el equilibrio.'),
('Curl de isquiotibiales en maquina', 'Isquiotibiales', 'Gluteos', 'knee_dominant', 'Machine', 'beginner', 'Baja despacio, conta 2 seg en la bajada. No uses inercia.'),
('Sentadilla con barra', 'Cuadriceps', 'Gluteos', 'knee_dominant', 'Barbell', 'intermediate', 'Pies al ancho de hombros, baja profundo con control. Empuja fuerte con las piernas.'),
('Prensa unilateral', 'Cuadriceps', 'Gluteos', 'knee_dominant', 'Machine', 'intermediate', 'Pie firme, controla el movimiento, no extender completamente la rodilla al subir.'),
('Extension de cuadriceps en maquina', 'Cuadriceps', 'Vastus medialis', 'knee_dominant', 'Machine', 'beginner', 'Sube controlado, sostene 1 seg arriba, baja despacio en 2-3 seg.'),
('Sentadilla goblet', 'Cuadriceps', 'Gluteos', 'knee_dominant', 'Dumbbell', 'beginner', 'Sostene la mancuerna al pecho, baja lento, respeta la profundidad.'),
('Estocadas con mancuernas', 'Cuadriceps', 'Gluteos', 'knee_dominant', 'Dumbbells', 'beginner', 'Paso largo, rodilla trasera casi toca el suelo. Torso recto durante todo el movimiento.'),
('Sentadilla en hack', 'Cuadriceps', 'Gluteos', 'knee_dominant', 'Machine', 'beginner', 'Pies al ancho de hombros, baja profundo sin despegar talones. Core apretado.'),
('Puente de gluteos en el suelo', 'Gluteos', 'Isquiotibiales', 'hip_dominant', 'Bodyweight', 'beginner', 'Apoya la espalda y los pies en el suelo. Apreta gluteos arriba y baja controlado.'),
('Peso muerto convencional', 'Isquiotibiales', 'Gluteos', 'hip_dominant', 'Barbell', 'intermediate', 'Espalda recta, barra pegada al cuerpo. Empuja el suelo con los pies, no tires de la barra.'),
('Peso muerto sumo', 'Gluteos', 'Cuadriceps', 'hip_dominant', 'Barbell', 'intermediate', 'Pies mas abiertos que los hombros. Empuja el suelo con firmeza. Espalda recta.'),

-- Upper Body Push
('Press banca con barra', 'Pecho', 'Triceps', 'push_horizontal', 'Barbell', 'intermediate', 'Pies firmes, omoplatos retraidos y pegados al banco. Baja hasta el pecho sin rebotar.'),
('Press inclinado con mancuernas', 'Pecho', 'Hombro anterior', 'push_horizontal', 'Dumbbells', 'intermediate', 'Controla el recorrido, baja despacio, no rebotar en el pecho.'),
('Flexiones de brazos', 'Pecho', 'Triceps', 'push_horizontal', 'Bodyweight', 'beginner', 'Alinea hombros, caderas y talones. Si cuesta, apoya las rodillas en el suelo.'),
('Press militar de pie', 'Hombro anterior', 'Triceps', 'push_vertical', 'Barbell', 'intermediate', 'Apreta gluteos y abdomen para no arquear la espalda. Empuja en linea recta.'),
('Press militar sentado', 'Hombro anterior', 'Triceps', 'push_vertical', 'Barbell', 'intermediate', 'Asiento con soporte lumbar, empuja hacia arriba en linea recta.'),
('Press Arnold', 'Hombro anterior', 'Hombro lateral', 'push_vertical', 'Dumbbells', 'advanced', 'Rotación controlada, empuja hacia arriba, baja de forma lenta.'),
('Push press', 'Hombro anterior', 'Triceps', 'push_vertical', 'Barbell', 'advanced', 'Sentadilla parcial para generar momentum, empuja explosivo.'),
('Elevaciones laterales con mancuernas', 'Hombro lateral', 'Hombro anterior', 'isolation', 'Dumbbells', 'beginner', 'Brazo semiflexionado, sube a la altura del hombro. Lento y controlado.'),

-- Upper Body Pull
('Dominadas', 'Dorsal', 'Biceps', 'pull_vertical', 'Pull-up bar', 'intermediate', 'Sube hasta que la barbilla supere la barra, baja de forma controlada.'),
('Jalon al pecho agarre supino', 'Dorsal', 'Biceps', 'pull_vertical', 'Cable machine', 'beginner', 'Tira con la espalda, no solo con los brazos. Omoplatos hacia abajo.'),
('Jalon al pecho agarre neutro', 'Dorsal', 'Biceps', 'pull_vertical', 'Cable machine', 'beginner', 'Tira con dorsales sin balancear el torso. Codos apuntan hacia atras y abajo.'),
('Remo con barra', 'Espalda media', 'Biceps', 'pull_horizontal', 'Barbell', 'intermediate', 'Espalda recta, tira con los codos hacia atras, apreta escápulas al final.'),
('Remo pecho apoyado', 'Espalda media', 'Biceps', 'pull_horizontal', 'Machine', 'beginner', 'Jala con codos hacia atras, movimiento controlado. Apreta escápulas al final.'),
('Remo unilateral con mancuerna', 'Espalda media', 'Biceps', 'pull_horizontal', 'Dumbbell', 'beginner', 'Apoya una mano en una silla. Jala con el codo hacia atras.'),
('Remo con mancuernas apoyado en banco', 'Espalda media', 'Biceps', 'pull_horizontal', 'Dumbbells', 'beginner', 'Tronco a 45 grados, jala con el codo hacia atras sin encorvar la espalda.'),
('Curl de biceps con barra', 'Biceps', 'Braquial', 'isolation', 'Barbell', 'beginner', 'Controla la bajada, evita balancear el cuerpo. Codos fijos a los costados.'),
('Curl de biceps alterno con mancuernas', 'Biceps', 'Braquial', 'isolation', 'Dumbbells', 'beginner', 'Controla el movimiento, evita balancear el cuerpo. Codos fijos a los costados.'),
('Extension triceps en polea', 'Triceps', 'Pecho', 'isolation', 'Cable machine', 'beginner', 'Codos fijos, extensión completa, baja controlado.'),
('Aperturas en maquina (pec deck)', 'Pecho', 'Hombro anterior', 'isolation', 'Machine', 'beginner', 'Codos levemente flexionados, no cerrar de golpe. Apreta el pecho al juntar los brazos.'),

-- Core
('Plancha frontal', 'Abdominales', 'Core', 'core_stability', 'Bodyweight', 'beginner', 'Codos bajo hombros, abdomen y gluteos firmes. No dejes caer las caderas.'),
('Plancha lateral', 'Oblicuos', 'Core', 'core_stability', 'Bodyweight', 'beginner', 'Cuerpo en linea recta, no bajes las caderas, sostene la posición.'),
('Hollow rock', 'Abdominales', 'Core', 'core_stability', 'Bodyweight', 'beginner', 'Lumbar pegada al suelo, brazos extendidos atras. Mantener sin rebotar.'),
('Mountain climbers', 'Abdominales', 'Cardio', 'core_dynamic', 'Bodyweight', 'beginner', 'Ritmo rapido, mantene el core apretado, caderas firmes.'),
('Pallof press', 'Oblicuos', 'Core', 'core_stability', 'Cable machine', 'intermediate', 'Pie perpendicular a la maquina, empuja sin rotar el torso.'),
('Dead bug', 'Abdominales', 'Core', 'core_stability', 'Bodyweight', 'beginner', 'Brazos y piernas alternados, lumbar pegada al suelo.'),
('Plancha con toque de hombros alternos', 'Abdominales', 'Core', 'core_dynamic', 'Bodyweight', 'intermediate', 'Toque alternado, caderas firmes, no rotes los hombros.'),

-- Other Exercises
('Burpees', 'Full body', 'Cardio', 'compound', 'Bodyweight', 'advanced', 'Movimiento explosivo, completo y controlado, alternancia rapida.'),
('Swings con kettlebell', 'Gluteos', 'Espalda', 'hip_dominant', 'Kettlebell', 'intermediate', 'Impulso desde la cadera, brazos relajados, control en la bajada.'),
('Peso muerto con mancuernas', 'Isquiotibiales', 'Gluteos', 'hip_dominant', 'Dumbbells', 'beginner', 'Una mancuerna en cada mano, espalda recta, baja a la altura de las espinillas.'),
('Curl de isquiotibiales tumbado', 'Isquiotibiales', 'Gluteos', 'knee_dominant', 'Machine', 'beginner', 'Baja despacio, apoyo firme, movimiento controlado sin inercia.')
ON CONFLICT (name) DO NOTHING;
