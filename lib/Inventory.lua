local all_reagents = {
    ["Blessed Thistle"] = {
        "Restore Stamina",
        "Increase Weapon Power",
        "Speed",
        "Ravage Health"
    },
    ["Blue Entoloma"] = {
        "Restore Health",
        "Invisible",
        "Lower Spell Power",
        "Ravage Magicka"
    },
    ["Bugloss"] = {
        "Increase Spell Resist",
        "Restore Health",
        "Restore Magicka",
        "Lower Spell Power"
    },
    ["Columbine"] = {
        "Restore Health",
        "Restore Stamina",
        "Restore Magicka",
        "Unstoppable"
    },
    ["Corn Flower"] = {
        "Restore Magicka",
        "Increase Spell Power",
        "Detection",
        "Ravage Health"
    },
    ["Dragonthorn"] = {
        "Increase Weapon Power",
        "Restore Stamina",
        "Weapon Critical",
        "Lower Armor"
    },
    ["Emetic Russula"] = {
        "Ravage Health",
        "Ravage Stamina",
        "Ravage Magicka",
        "Stun"
    },
    ["Imp Stool"] = {
        "Increase Armor",
        "Lower Weapon Power",
        "Ravage Stamina",
        "Lower Weapon Critical"
    },
    ["Lady's Smock"] = {
        "Increase Spell Power",
        "Restore Magicka",
        "Spell Critical",
        "Lower Spell Resist"
    },
    ["Luminous Russula"] = {
        "Restore Health",
        "Ravage Stamina",
        "Lower Weapon Power",
        "Reduce Speed"
    },
    ["Mountain Flower"] = {
        "Increase Armor",
        "Restore Health",
        "Restore Stamina",
        "Lower Weapon Power"
    },
    ["Namira's Rot"] = {
        "Spell Critical",
        "Invisible",
        "Speed",
        "Unstoppable"
    },
    ["Nirnroot"] = {
        "Invisible",
        "Ravage Health",
        "Lower Weapon Critical",
        "Lower Spell Critical"
    },
    ["Stinkhorn"] = {
        "Increase Weapon Power",
        "Lower Armor",
        "Ravage Health",
        "Ravage Stamina"
    },
    ["Violet Coprinus"] = {
        "Increase Spell Power",
        "Lower Spell Resist",
        "Ravage Health",
        "Ravage Magicka"
    },
    ["Water Hyacinth"] = {
        "Restore Health",
        "Weapon Critical",
        "Spell Critical",
        "Stun"
    },
    ["White Cap"] = {
        "Increase Spell Resist",
        "Lower Spell Power",
        "Ravage Magicka",
        "Lower Spell Critical"
    },
    ["Wormwood"] = {
        "Weapon Critical",
        "Detection",
        "Unstoppable",
        "Reduce Speed"
    }
}

local Inventory = {}

function Inventory:new(control)
    local self = {
        reagents = {}
    }
    setmetatable(self, { __index = Inventory })
    
    self:populate_from_control(control)

    return self
end

function Inventory:add_reagent(name, qty, known_traits, bag_id, slot_index)
    local traits = {}
    local all_traits = all_reagents[name]
    for _, trait in pairs(all_traits) do
        traits[trait] = Alchemist.Batteries.element_is_in_table(trait, known_traits)
    end
    
    assert(self.reagents[name] == nil)
    self.reagents[name] = Alchemist.Reagent:new(name, qty, traits, bag_id, slot_index)
end

 function Inventory:remove_reagent(reagent)
    if reagent.qty == 1 then
        self.reagents[reagent.name] = nil
    else
        reagent.qty = reagent.qty - 1
    end
end

function Inventory:get_reagent(reagent_name)
    return self.reagents[reagent_name]
end

function Inventory:num_reagents()
    return Alchemist.Batteries.num_items_in_table(self.reagents)
end

function Inventory:get_reagent_names()
    return Alchemist.Batteries.table_keys_to_list(self.reagents)
end

function Inventory:populate_from_control(control)
    local list_data = control["list"]["data"]
    for _, list_item in pairs(list_data) do
        local type_id = list_item.typeId
        if type_id == 2 then
            local reagent_data = list_item["data"]
            
            local name = reagent_data.name
            local bag_id = reagent_data.bagId
            local slot_index = reagent_data.slotIndex
            local qty = reagent_data.stackCount
      
            local t1, _, _, t2, _, _, t3, _, _, t4, _, _ = GetAlchemyItemTraits(bag_id, slot_index)
            local traits = {t1, t2, t3, t4}
            
            self:add_reagent(name, qty, traits, bag_id, slot_index)
        end
    end
end

Alchemist.Inventory = Inventory
