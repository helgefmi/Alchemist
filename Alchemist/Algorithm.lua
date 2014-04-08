local function get_discovered_traits(reagents)
    -- compare reagents and find traits that would be discovered if these reagents was combined.
    local discoveries = {}

    for _, r1 in pairs(reagents) do
        for trait, discovered in pairs(r1.traits) do
            if not discovered then
                for _, r2 in pairs(reagents) do
                    if r1 ~= r2 then
                        if r2.traits[trait] ~= nil then
                            table.insert(discoveries, {
                                reagent = r1,
                                trait = trait,
                            })
                            break
                        end
                    end
                end
            end
        end
    end

    return discoveries
end

local function get_best_combination(inventory, max_reagents)
    -- given a set of reagents (inventory), return the best possible combination, maximizing on
    -- number of new discoveries.
    if inventory:num_reagents() < 2 then
        return
    end

    local best_score = 0
    local best_combination

    reagent_names = inventory:get_reagent_names()
    local all_combinations = {}

    for num_reagents = 2, max_reagents do
        local combinations = Alchemist.Batteries.combinations(reagent_names, num_reagents)
        for _, combination in pairs(combinations) do
            table.insert(all_combinations, combination)
        end
    end

    for _, reagent_names in pairs(all_combinations) do
        local reagents_combination = {}
        for _, reagent_name in pairs(reagent_names) do
            table.insert(reagents_combination, inventory:get_reagent(reagent_name))
        end

        local discoveries = get_discovered_traits(reagents_combination)
        local score = (#discoveries * 10) - #reagent_names
        if score > best_score then
            best_score = score
            best_combination = {
                reagents = reagents_combination,
                discoveries = discoveries,
            }
        end
    end

    if best_combination and #best_combination.discoveries > 0 then
        return best_combination
    end
end

local function get_optimal_combinations(inventory, max_reagents)
    -- returns a list of combinations that can be done in order, to maximize discovery of traits.
    local ret = {}

    local combination
    repeat
        combination = get_best_combination(inventory, max_reagents)
        if combination then
            table.insert(ret, combination)

            for _, reagent in pairs(combination.reagents) do
                inventory:decrement_reagent_qty(reagent)
            end

            for _, discovery in pairs(combination.discoveries) do
                discovery.reagent:discover(discovery.trait)
            end
        end
    until not combination

    return ret
end

Alchemist.Algorithm = {
    get_optimal_combinations = get_optimal_combinations,
}
