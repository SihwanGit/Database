SELECT 
    b.evolution_id,
    p.name AS species_name,
    b.evolution_relation,
    b.notes
FROM BiologicalEvolution b
JOIN PokemonSpecies p ON b.species_id = p.species_id
WHERE p.name IN ('메탕구','메타그로스','메가메타그로스')
ORDER BY b.evolution_id;