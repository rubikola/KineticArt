/*
  # Complete Training Programs G and H

  1. Rutina G - Minimalista 4 Básicos
    - Added: Peso muerto convencional, Press de banca plano, Remo con barra
    - Total: 4 compound exercises

  2. Rutina H - Avanzada Alta Intensidad
    - Complete routine with 6 compound exercises
    - Focus on strength and mass for advanced lifters
*/

-- Complete Rutina G (Minimalista 4 Básicos)
DO $$
DECLARE
  pid uuid;
BEGIN
  SELECT id INTO pid FROM training_programs WHERE name = 'Rutina G - Minimalista 4 Básicos';
  
  DELETE FROM program_exercises WHERE program_id = pid;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  VALUES
    (pid, (SELECT id FROM training_exercises WHERE name = 'Sentadilla con barra'), 0, 5, 5, 5, 180, 'Profundidad paralela. Rodillas en línea con los pies'),
    (pid, (SELECT id FROM training_exercises WHERE name = 'Peso muerto convencional'), 1, 5, 5, 5, 180, 'Espalda neutra. Barra cerca de las piernas'),
    (pid, (SELECT id FROM training_exercises WHERE name = 'Press de banca plano'), 2, 5, 5, 5, 180, 'Escápulas retraídas. Pies firmes en el suelo'),
    (pid, (SELECT id FROM training_exercises WHERE name = 'Remo con barra'), 3, 5, 5, 5, 180, 'Espalda paralela al suelo. Codos al cuerpo');
END $$;

-- Complete Rutina H (Avanzada Alta Intensidad)
DO $$
DECLARE
  pid uuid;
BEGIN
  SELECT id INTO pid FROM training_programs WHERE name = 'Rutina H - Avanzada Alta Intensidad';
  
  DELETE FROM program_exercises WHERE program_id = pid;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  VALUES
    (pid, (SELECT id FROM training_exercises WHERE name = 'Sentadilla con barra'), 0, 5, 5, 5, 180, 'Profundidad paralela. Rodillas en línea con los pies'),
    (pid, (SELECT id FROM training_exercises WHERE name = 'Peso muerto convencional'), 1, 5, 3, 3, 240, 'Peso muerto pesado. Espalda neutra siempre'),
    (pid, (SELECT id FROM training_exercises WHERE name = 'Press de banca plano'), 2, 5, 5, 5, 180, 'Control en la bajada. Empuje explosivo'),
    (pid, (SELECT id FROM training_exercises WHERE name = 'Press militar con barra'), 3, 4, 6, 8, 120, 'Core activo. Codos a 45 grados'),
    (pid, (SELECT id FROM training_exercises WHERE name = 'Dominadas'), 4, 4, 6, 10, 120, 'Pecho a la barra. Bajo total cada rep'),
    (pid, (SELECT id FROM training_exercises WHERE name = 'Remo con barra'), 5, 4, 8, 10, 120, 'Tirón fuerte. Sigue el torso para más ROM');
END $$;
