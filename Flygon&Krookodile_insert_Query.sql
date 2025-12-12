INSERT INTO PokemonInteraction
(pokemon_id_1, pokemon_id_2, type_id, notes)
VALUES
(
    (SELECT species_id FROM PokemonSpecies WHERE name='플라이곤' LIMIT 1),
    (SELECT species_id FROM PokemonSpecies WHERE name='악비아르' LIMIT 1),
    (SELECT type_id FROM InteractionType WHERE type_name='Mutualism' LIMIT 1),
    '플라이곤이 모래바람을 일으켜 악비아르를 숨긴다.'
),
(
    (SELECT species_id FROM PokemonSpecies WHERE name='악비아르' LIMIT 1),
    (SELECT species_id FROM PokemonSpecies WHERE name='플라이곤' LIMIT 1),
    (SELECT type_id FROM InteractionType WHERE type_name='Mutualism' LIMIT 1),
    '악비아르는 모래바람 속에서 사냥을 보조한다.'
);

