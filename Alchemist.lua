Alchemist = {
    version = 0.02,
    listview = nil,
}

function Alchemist.initialize()
    local supported_languages = {
        english = true,
        german = true,
    }

    local current_language = Alchemist.Multilingual.get_current_language()
    if not supported_languages[current_language] then
        d("Alchemist is sorry, but your language is not supported as of yet.")
        d("If you want this to be fixed, you could leave a message on http://www.esoui.com/downloads/info120-Alchemist.html")
        return
    end

    Alchemist.listview = Unicorn.ListView.new(AlchemistControl, {
        title = "Alchemist",
        width = 350,
        left = 970,
        top = 40,
    })

    Alchemist.listview.control:SetHidden(true)
    
    EVENT_MANAGER:RegisterForEvent("Alchemist", EVENT_CRAFTING_STATION_INTERACT, Alchemist.on_start_crafting)
    EVENT_MANAGER:RegisterForEvent("Alchemist", EVENT_END_CRAFTING_STATION_INTERACT, Alchemist.on_end_crafting)

    EVENT_MANAGER:RegisterForEvent("Alchemist", EVENT_CRAFT_STARTED, Alchemist.on_craft_started)
    EVENT_MANAGER:RegisterForEvent("Alchemist", EVENT_CRAFT_COMPLETED, Alchemist.on_craft_completed)
    
    Alchemist.initialized = true
end

function Alchemist.print_combinations()
    local inventory = Alchemist.Inventory:new(ALCHEMY["inventory"])
    combinations = Alchemist.Algorithm.get_optimal_combinations(inventory, 2)
    
    local mw = Alchemist.listview
    
    mw:clear()
    mw.control:SetHidden(false)

    local _ = Alchemist.Multilingual.translate_text

    if #combinations == 0 then
        mw:add_message(_("Alchemist: No discoveries available."))
    else
        mw:add_message(#combinations .. _(" combinations available!"))
        mw:add_message("")
        for _, combination in pairs(combinations) do
            mw:add_message(_("Combine the following:"))
            
            table.sort(combination.reagents, function(a, b) return a.name < b.name end)
            for _, reagent in pairs(combination.reagents) do
                mw:add_message("- |c00ff00" .. reagent.name)
            end
            
            mw:add_message(_(".. to get the following discoveries:"))
            
            table.sort(combination.discoveries, function(a, b) return a.reagent.name < b.reagent.name end)
            for _, discovery in pairs(combination.discoveries) do
                mw:add_message("- |c9999ff" .. discovery.reagent.name .. ": " .. discovery.trait)
            end
            mw:add_message("")
        end
    end
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
