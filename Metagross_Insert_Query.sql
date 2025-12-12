INSERT INTO PokemonSpecies
(name, type1, type2, origin, sex_rate, activity_time, diet_type, extinction_status, notes)
VALUES
('메탕', 'Steel', 'Psychic', 'Natural', 0.00, 'All-Day', 'Omnivore', 'Alive', NULL),
('메탕구', 'Steel', 'Psychic', 'Natural', 0.00, 'All-Day', 'Omnivore', 'Alive', NULL),
('메타그로스', 'Steel', 'Psychic', 'Natural', 0.00, 'All-Day', 'Omnivore', 'Alive', NULL),
('메가메타그로스', 'Steel', 'Psychic', 'Artificial', 0.00, 'All-Day', 'Omnivore', 'Alive', '메가진화 개념 적용');

INSERT INTO BiologicalEvolution
(species_id, evolution_relation, notes)
VALUES
((SELECT species_id FROM PokemonSpecies WHERE name='메탕구'), 'Fusion', '메탕 2마리의 합체');


INSERT INTO BiologicalEvolution
(species_id, evolution_relation, notes)
VALUES
((SELECT species_id FROM PokemonSpecies WHERE name='메타그로스'), 'Fusion', '메탕구 + 메탕 2마리의 합체');

INSERT INTO BiologicalEvolution
(species_id, evolution_relation, notes)
VALUES
((SELECT species_id FROM PokemonSpecies WHERE name='메가메타그로스'), 'Fusion', '메타그로스 + 메탕구 + 메탕 2마리의 합체');



