/*
  # Seed Full Body Training Programs from CP Trainer PDF
*/

INSERT INTO training_programs (name, description, difficulty_level, program_type, duration_minutes, frequency_per_week, detailed_guide) VALUES
('Rutina A - Énfasis Tren Inferior', 'Trabajar glúteos e isquiotibiales como prioridad. Complementado con un empuje y tirón de tren superior.', 'intermediate', 'full_body_lower_emphasis', 45, '2-3 veces/semana', 'Full Body con énfasis en glúteos e isquiotibiales'),
('Rutina B - Énfasis Cuadriceps', 'Potenciar fuerza y desarrollo de cuadriceps. Complementado con hombros, espalda y core.', 'intermediate', 'full_body_quad_emphasis', 45, '2-3 veces/semana', 'Full Body con énfasis en cuadriceps'),
('Rutina C - Énfasis Tren Superior', 'Pectoral, espalda y brazos como protagonistas. Ideal para los dias que queres enfocarte en la parte superior.', 'intermediate', 'full_body_upper_emphasis', 45, '2-3 veces/semana', 'Full Body con énfasis en pecho, espalda y brazos'),
('Rutina D - Equilibrada Fuerza + Hipertrofia', 'Combinar trabajo de fuerza en los básicos con accesorios para hipertrofia. Ideal para nivel intermedio que busca ganar masa muscular y fuerza al mismo tiempo.', 'intermediate', 'full_body_balanced', 50, '3-4 veces/semana', 'Full Body equilibrada para fuerza e hipertrofia'),
('Rutina E - Solo con Mancuernas', 'Entrenar todo el cuerpo usando solo mancuernas. Ideal para casa, hotel o cualquier lugar sin máquinas.', 'beginner', 'full_body_dumbbells', 40, '2-3 veces/semana', 'Full Body solo con mancuernas (no requiere máquinas ni barras)'),
('Rutina F - Principiante', 'Aprender los movimientos fundamentales con buena técnica. Ideal si estás empezando o retomando después de mucho tiempo sin entrenar.', 'beginner', 'full_body_beginner', 35, '2-3 veces/semana', 'Full Body básica para principiantes, enfoque en técnica'),
('Rutina G - Minimalista 4 Básicos', 'Ganar fuerza y músculo con los 4 movimientos más eficientes que existen. Para quien prefiere entrenar poco pero bien.', 'intermediate', 'full_body_minimalist', 30, '2-3 veces/semana', 'Solo 4 ejercicios básicos: Sentadilla, Press Banca, Peso Muerto, Dominadas'),
('Rutina H - Avanzada Alta Intensidad', 'Combinar trabajo pesado en básicos con accesorios de alta intensidad para ganar fuerza y masa muscular. Para personas con experiencia real en el gimnasio.', 'advanced', 'full_body_advanced', 50, '3-5 veces/semana', 'Full Body avanzada con énfasis en trabajo pesado e intenso')
ON CONFLICT DO NOTHING;
