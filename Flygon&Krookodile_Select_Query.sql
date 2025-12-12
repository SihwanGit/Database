SELECT
    pi.pokemon_interaction_id,
    p1.name AS base_pokemon,
    p2.name AS target_pokemon,
    it.type_name AS interaction_type,
    it.directionality,
    pi.notes
FROM PokemonInteraction pi
JOIN PokemonSpecies p1 ON pi.pokemon_id_1 = p1.species_id
JOIN PokemonSpecies p2 ON pi.pokemon_id_2 = p2.species_id
JOIN InteractionType it ON pi.type_id = it.type_id
WHERE (p1.name = '플라이곤' AND p2.name = '악비아르')
   OR (p1.name = '악비아르' AND p2.name = '플라이곤')
ORDER BY pi.pokemon_interaction_id;
