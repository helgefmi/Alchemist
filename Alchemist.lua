Alchemist = {
    version = 0.08,
    listview = nil,
}

function Alchemist.initialize()
    Alchemist.listview = Unicorn.ListView.new(AlchemistControl, {
        title = "|cccccccAlchemist |cffff99" .. Alchemist.version,
        width = 350,
        left = 970,
        top = 60,
    })

    Alchemist.listview.control:SetHidden(true)
    
    EVENT_MANAGER:RegisterForEvent("Alchemist", EVENT_CRAFTING_STATION_INTERACT, Alchemist.on_start_crafting)
    EVENT_MANAGER:RegisterForEvent("Alchemist", EVENT_END_CRAFTING_STATION_INTERACT, Alchemist.on_end_crafting)

    EVENT_MANAGER:RegisterForEvent("Alchemist", EVENT_CRAFT_STARTED, Alchemist.on_craft_started)
    EVENT_MANAGER:RegisterForEvent("Alchemist", EVENT_CRAFT_COMPLETED, Alchemist.on_craft_completed)
end

function Alchemist.print_combinations()
    local inventory = Alchemist.Inventory.new()
    inventory:populate_from_control(ALCHEMY["inventory"])

    local num_reagent_slots = Alchemist.get_num_reagent_slots()
    local combinations = Alchemist.Algorithm.get_optimal_combinations(inventory, num_reagent_slots)
    
    local mw = Alchemist.listview
    local SI = Alchemist.SI
    
    mw:clear()
    mw.control:SetHidden(false)

    if #combinations == 0 then
        mw:add_message(SI.get(SI.NO_DISCOVERIES_AVAILABLE))
    else
        mw:add_message(string.format(SI.get(SI.COMBINATIONS_AVAILABLE), #combinations))
        mw:add_message("")
        for _, combination in pairs(combinations) do
            mw:add_message(SI.get(SI.COMBINE_THE_FOLLOWING))
            
            table.sort(combination.reagents, function(a, b) return a.name < b.name end)
            for _, reagent in pairs(combination.reagents) do
                mw:add_message("- |c00ff00" .. reagent.name)
            end
            
            mw:add_message(SI.get(SI.TO_GET_THE_FOLLOWING_DISCOVERIES))
            
            table.sort(combination.discoveries, function(a, b) return a.reagent.name < b.reagent.name end)
            for _, discovery in pairs(combination.discoveries) do
                mw:add_message("- |c9999ff" .. discovery.reagent.name .. ": " .. discovery.trait)
            end
            mw:add_message("")
        end
    end
end

function Alchemist.get_num_reagent_slots()
    --local has_three_slot = not ZO_AlchemyTopLevelSlotContainerReagentSlot3:IsControlHidden()
    --return has_three_slot and 3 or 2
    --
    -- TODO: The current algorithm can't handle three slots, not sure why I didn't see that
    -- before, but if you have all 18 reagents, there'll be (18 * 17 * 16) + (18 * 17) = 5202
    -- combinations. My computer can handle that, but some computers will probably have a 
    -- bad time!

    return 2
end

function Alchemist.on_start_crafting(event_type, crafting_type)
    if crafting_type == CRAFTING_TYPE_ALCHEMY then
        Alchemist.print_combinations()
    end
end

function Alchemist.on_end_crafting(event_type, crafting_type)
    Alchemist.listview.control:SetHidden(true)
end

function Alchemist.on_craft_started(event_type, crafting_type)
    if crafting_type == CRAFTING_TYPE_ALCHEMY then
        
    end
end

function Alchemist.on_craft_completed(event_type, crafting_type)
    if crafting_type == CRAFTING_TYPE_ALCHEMY then
        Alchemist.print_combinations()
    end
end

local function on_addon_load(eventCode, addOnName)
    if addOnName == "Alchemist" then
        Alchemist.initialize()
    end
end

EVENT_MANAGER:RegisterForEvent("Alchemist", EVENT_ADD_ON_LOADED, on_addon_load)
