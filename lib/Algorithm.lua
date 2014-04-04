local function get_discovered_traits(reagents)
    local discoveries = {}

    for _, r1 in pairs(reagents) do
        for _, r2 in pairs(reagents) do
            if r1 ~= r2 then
                for trait, discovered in pairs(r1.traits) do
                    if r2.traits[trait] == false then
                        table.insert(discoveries, {
                            reagent = r2,
                            trait = trait,
                        })
                    end
                end
            end
        end
    end

    return discoveries
end

local function get_best_combination(inventory, max_reagents)
    if inventory:num_reagents() < 2 then
        return
    end

    local best_combination

    reagent_names = inventory:get_reagent_names()
    local reagent_names_combinations = Alchemist.Batteries.combinations(reagent_names, max_reagents)
    for reagent_names in reagent_names_combinations do
        local reagents_combination = {}
        for _, reagent_name in pairs(reagent_names) do
            table.insert(reagents_combination, inventory:get_reagent(reagent_name))
        end

        local discoveries = get_discovered_traits(reagents_combination)
        if not best_combination or #best_combination.discoveries < #discoveries then
            best_combination = {
                reagents = reagents_combination,
                discoveries = discoveries,
            }
        end
    end

    if #best_combination.discoveries > 0 then
        return best_combination
    end
end

local function get_optimal_combinations(inventory, max_reagents)
    local ret = {}

    local combination
    repeat
        combination = get_best_combination(inventory, max_reagents)
        if combination then
            table.insert(ret, combination)

            for _, reagent in pairs(combination.reagents) do
                inventory:remove_reagent(reagent)
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