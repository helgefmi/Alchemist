-- all reagents {{{
local all_reagents = {
    english = {
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
            "Weapon Crit",
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
            "Lower Weapon Crit"
        },
        ["Lady's Smock"] = {
            "Increase Spell Power",
            "Restore Magicka",
            "Spell Crit",
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
            "Spell Crit",
            "Invisible",
            "Speed",
            "Unstoppable"
        },
        ["Nirnroot"] = {
            "Invisible",
            "Ravage Health",
            "Lower Weapon Crit",
            "Lower Spell Crit"
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
            "Weapon Crit",
            "Spell Crit",
            "Stun"
        },
        ["White Cap"] = {
            "Increase Spell Resist",
            "Lower Spell Power",
            "Ravage Magicka",
            "Lower Spell Crit"
        },
        ["Wormwood"] = {
            "Weapon Crit",
            "Detection",
            "Unstoppable",
            "Reduce Speed"
        }
    },
    german = {
        ["Benediktenkraut"] = {
            "Ausdauer wiederherstellen",
            "Erhöht Waffenkraft",
            "Lebensverwüstung",
            "Tempo"
        },
        ["Blauer Glöckling"] = {
            "Magickaverwüstung",
            "Veringert Magiekraft",
            "Leben wiederherstellen",
            "Unsichtbarkeit"
        },
        ["Wolfsauge"] = {
            "Erhöht Magieresistenz",
            "Leben wiederherstellen",
            "Verringert Magiekraft",
            "Magicka wiederherstellen"
        },
        ["Akelei"] = {
            "Leben wiederherstellen",
            "Magicka wiederherstellen",
            "Ausdauer wiederherstellen",
            "Sicherer Stand"
        },
        ["Kornblume"] = {
            "Magicka wiederherstellen",
            "Erhöht Magiekraft",
            "Lebensverwüstung",
            "Detektion"
        },
        ["Drachendorn"] = {
            "Erhöht Waffenkraft",
            "Ausdauer wiederherstellen",
            "Verringert Rüstung",
            "Kritische Waffentreffer"
        },
        ["Brechtäubling"] = {
            "Lebensverwüstung",
            "Magickaverwüstung",
            "Ausdauerverwüstung",
            "Betäubung"
        },
        ["Koboldschemel"] = {
            "Verringert Waffenkraft",
            "Ausdauerverwüstung",
            "Erhöht Rüstung",
            "Verringert kritische Waffentreffer"
        },
        ["Wiesenschaumkraut"] = {
            "Erhöht Magiekraft",
            "Magicka wiederherstellen",
            "Verringert Magieresistenz",
            "Kritische Zaubertreffer"
        },
        ["Leuchttäubling"] = {
            "Ausdauerverwüstung",
            "Verringert Waffenkraft",
            "Leben wiederherstellen",
            "Reduziert Tempo"        
        },
        ["Bergblume"] = {
            "Erhöht Rüstung",
            "Leben wiederherstellen",
            "Verringert Magiekraft",
            "Ausdauer wiederherstellen"
        },
        ["Namiras Fäulnis"] = {
            "Kritische Waffentreffer",
            "Tempo",
            "Unsichtbarkeit",
            "Sicherer Stand"        
        },
        ["Nirnwurz"] = {
            "Lebensverwüstung",
            "Verringert kritische Zaubertreffer",
            "Verringert kritische Waffentreffer",
            "Unsichtbarkeit"
        },
        ["Stinkmorchel"] = {
            "Verringert Rüstung",
            "Lebensverwüstung",
            "Erhöht Waffenkraft",
            "Ausdauerverwüstung"
        },
        ["Violetter Tintling"] = {
            "Verringert Magieresistenz",
            "Lebensverwüstung",
            "Erhöht Magiekraft",
            "Magickaverwüstung"
        },
        ["Wasserhyazinthe"] = {
            "Leben wiederherstellen",
            "Kritische Zaubertreffer",
            "Kritische Waffentreffer",
            "Betäubung"
        },
        ["Weiße Kappe"] = {
            "Verringert Magiekraft",
            "Magickaverwüstung",
            "Erhöht Magieresistenz",
            "Verringert kritische Zaubertreffer"
        },
        ["Wermut"] = {
            "Kritische Waffentreffer",
            "Reduziert Tempo",
            "Detektion",
            "Sicherer Stand"
        }
    }
}
-- }}}

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
    -- Adds a reagent to the current inventory. It will also add traits that we don't know about yet,
    -- and set them to "not discovered". This is indicated by the *value* in the `traits` table.
    local traits = {}
    local lang = Alchemist.Multilingual.get_current_language()
    assert(all_reagents[lang] ~= nil)

    local all_traits = all_reagents[lang][name]
    assert(all_traits ~= nil and #all_traits == 4)
    for _, trait in pairs(all_traits) do
        -- key = trait name
        -- value = is discovered
        assert(traits[trait] == nil)
        traits[trait] = Alchemist.Batteries.element_is_in_table(trait, known_traits)
    end
    
    assert(self.reagents[name] == nil)
    self.reagents[name] = Alchemist.Reagent:new(name, qty, traits, bag_id, slot_index)
    
    return self.reagents[name]
end

 function Inventory:remove_reagent(reagent)
    -- will weight decrement qty or remove the reagent all together.
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
    -- populates self.reagents using ZO API.
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
            
            local reagent = self:add_reagent(name, qty, traits, bag_id, slot_index)
        end
    end
end

Alchemist.Inventory = Inventory
