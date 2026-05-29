/*
  # Link exercises to training programs (Routines A-H) - Fixed version
  This version avoids duplicate exercise-program combinations
*/

DO $$
DECLARE
  prog_a_id uuid;
  prog_b_id uuid;
  prog_c_id uuid;
  prog_d_id uuid;
  prog_e_id uuid;
  prog_f_id uuid;
  prog_g_id uuid;
  prog_h_id uuid;
BEGIN
  prog_a_id := (SELECT id FROM training_programs WHERE name = 'Rutina A - Énfasis Tren Inferior' LIMIT 1);
  prog_b_id := (SELECT id FROM training_programs WHERE name = 'Rutina B - Énfasis Cuadriceps' LIMIT 1);
  prog_c_id := (SELECT id FROM training_programs WHERE name = 'Rutina C - Énfasis Tren Superior' LIMIT 1);
  prog_d_id := (SELECT id FROM training_programs WHERE name = 'Rutina D - Equilibrada Fuerza + Hipertrofia' LIMIT 1);
  prog_e_id := (SELECT id FROM training_programs WHERE name = 'Rutina E - Solo con Mancuernas' LIMIT 1);
  prog_f_id := (SELECT id FROM training_programs WHERE name = 'Rutina F - Principiante' LIMIT 1);
  prog_g_id := (SELECT id FROM training_programs WHERE name = 'Rutina G - Minimalista 4 Básicos' LIMIT 1);
  prog_h_id := (SELECT id FROM training_programs WHERE name = 'Rutina H - Avanzada Alta Intensidad' LIMIT 1);

  -- Rutina A - Énfasis Tren Inferior
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_a_id, id, 1, 4, 6, 12, 120, 'Hip Thrust: 2x6-9 + 2x9-12' FROM training_exercises WHERE name = 'Hip Thrust con barra' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_a_id, id, 2, 3, 10, 12, 120, 'Peso muerto rumano' FROM training_exercises WHERE name = 'Peso muerto rumano' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_a_id, id, 3, 2, 10, 12, 90, 'Sentadilla búlgara' FROM training_exercises WHERE name = 'Sentadilla búlgara' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_a_id, id, 4, 3, 12, 15, 90, 'Curl de isquiotibiales' FROM training_exercises WHERE name = 'Curl de isquiotibiales en maquina' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_a_id, id, 5, 3, 9, 12, 90, 'Press inclinado' FROM training_exercises WHERE name = 'Press inclinado con mancuernas' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_a_id, id, 6, 3, 9, 12, 90, 'Jalon al pecho supino' FROM training_exercises WHERE name = 'Jalon al pecho agarre supino' ON CONFLICT DO NOTHING;

  -- Rutina B - Énfasis Cuadriceps
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_b_id, id, 1, 3, 6, 8, 120, 'Sentadilla en hack' FROM training_exercises WHERE name = 'Sentadilla en hack' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_b_id, id, 2, 3, 10, 14, 120, 'Prensa unilateral' FROM training_exercises WHERE name = 'Prensa unilateral' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_b_id, id, 3, 3, 12, 15, 90, 'Extension de cuadriceps' FROM training_exercises WHERE name = 'Extension de cuadriceps en maquina' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_b_id, id, 4, 3, 9, 12, 90, 'Press militar' FROM training_exercises WHERE name = 'Press militar de pie' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_b_id, id, 5, 3, 9, 12, 90, 'Jalon neutral' FROM training_exercises WHERE name = 'Jalon al pecho agarre neutro' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_b_id, id, 6, 3, 20, 40, 60, 'Hollow rock' FROM training_exercises WHERE name = 'Hollow rock' ON CONFLICT DO NOTHING;

  -- Rutina C - Énfasis Tren Superior
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_c_id, id, 1, 3, 6, 8, 120, 'Press banca' FROM training_exercises WHERE name = 'Press banca con barra' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_c_id, id, 2, 3, 8, 10, 120, 'Remo pecho apoyado' FROM training_exercises WHERE name = 'Remo pecho apoyado' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_c_id, id, 3, 2, 10, 12, 90, 'Aperturas pecho' FROM training_exercises WHERE name = 'Aperturas en maquina (pec deck)' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_c_id, id, 4, 3, 15, 20, 90, 'Elevaciones laterales' FROM training_exercises WHERE name = 'Elevaciones laterales con mancuernas' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_c_id, id, 5, 2, 10, 12, 90, 'Curl biceps' FROM training_exercises WHERE name = 'Curl de biceps con barra' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_c_id, id, 6, 2, 10, 12, 90, 'Extension triceps' FROM training_exercises WHERE name = 'Extension triceps en polea' ON CONFLICT DO NOTHING;

  -- Rutina D - Equilibrada Fuerza + Hipertrofia
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_d_id, id, 1, 3, 6, 8, 180, 'Sentadilla' FROM training_exercises WHERE name = 'Sentadilla con barra' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_d_id, id, 2, 3, 8, 10, 180, 'Peso muerto rumano' FROM training_exercises WHERE name = 'Peso muerto rumano' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_d_id, id, 3, 3, 8, 12, 120, 'Dominadas' FROM training_exercises WHERE name = 'Dominadas' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_d_id, id, 4, 3, 10, 12, 90, 'Press militar mancuernas' FROM training_exercises WHERE name = 'Press militar de pie' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_d_id, id, 5, 3, 10, 12, 90, 'Curl biceps' FROM training_exercises WHERE name = 'Curl de biceps con barra' ON CONFLICT DO NOTHING;

  -- Rutina E - Solo con Mancuernas
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_e_id, id, 1, 3, 12, 15, 90, 'Sentadilla goblet' FROM training_exercises WHERE name = 'Sentadilla goblet' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_e_id, id, 2, 3, 10, 12, 90, 'Peso muerto mancuernas' FROM training_exercises WHERE name = 'Peso muerto con mancuernas' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_e_id, id, 3, 3, 10, 12, 90, 'Remo unilateral' FROM training_exercises WHERE name = 'Remo unilateral con mancuerna' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_e_id, id, 4, 2, 10, 12, 90, 'Estocadas' FROM training_exercises WHERE name = 'Estocadas con mancuernas' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_e_id, id, 5, 3, 30, 45, 60, 'Plancha frontal' FROM training_exercises WHERE name = 'Plancha frontal' ON CONFLICT DO NOTHING;

  -- Rutina F - Principiante
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_f_id, id, 1, 3, 8, 12, 90, 'Flexiones' FROM training_exercises WHERE name = 'Flexiones de brazos' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_f_id, id, 2, 3, 10, 12, 90, 'Remo apoyado' FROM training_exercises WHERE name = 'Remo con mancuernas apoyado en banco' ON CONFLICT DO NOTHING;
  
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_f_id, id, 3, 3, 12, 15, 90, 'Puente gluteos' FROM training_exercises WHERE name = 'Puente de gluteos en el suelo' ON CONFLICT DO NOTHING;

  -- Rutina G - Minimalista 4 Básicos
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_g_id, id, 1, 3, 5, 6, 180, 'Sentadilla basica' FROM training_exercises WHERE name = 'Sentadilla con barra' ON CONFLICT DO NOTHING;

  -- Rutina H - Avanzada Alta Intensidad
  INSERT INTO program_exercises (program_id, exercise_id, order_index, sets, reps_min, reps_max, rest_seconds, technical_notes)
  SELECT prog_h_id, id, 1, 4, 5, 5, 180, 'Sentadilla avanzada' FROM training_exercises WHERE name = 'Sentadilla con barra' ON CONFLICT DO NOTHING;

END $$;
