-- all reagents {{{
local all_reagents = {
    english = {
        ["Blessed Thistle"] = {
            "Restore Stamina",
            "Increase Weapon Power",
            "Speed",
            "Ravage Health",
        },
        ["Blue Entoloma"] = {
            "Restore Health",
            "Invisible",
            "Lower Spell Power",
            "Ravage Magicka",
        },
        ["Bugloss"] = {
            "Increase Spell Resist",
            "Restore Health",
            "Restore Magicka",
            "Lower Spell Power",
        },
        ["Columbine"] = {
            "Restore Health",
            "Restore Stamina",
            "Restore Magicka",
            "Unstoppable",
        },
        ["Corn Flower"] = {
            "Restore Magicka",
            "Increase Spell Power",
            "Detection",
            "Ravage Health",
        },
        ["Dragonthorn"] = {
            "Increase Weapon Power",
            "Restore Stamina",
            "Weapon Crit",
            "Lower Armor",
        },
        ["Emetic Russula"] = {
            "Ravage Health",
            "Ravage Stamina",
            "Ravage Magicka",
            "Stun",
        },
        ["Imp Stool"] = {
            "Increase Armor",
            "Lower Weapon Power",
            "Ravage Stamina",
            "Lower Weapon Crit",
        },
        ["Lady's Smock"] = {
            "Increase Spell Power",
            "Restore Magicka",
            "Spell Crit",
            "Lower Spell Resist",
        },
        ["Luminous Russula"] = {
            "Restore Health",
            "Ravage Stamina",
            "Lower Weapon Power",
            "Reduce Speed",
        },
        ["Mountain Flower"] = {
            "Increase Armor",
            "Restore Health",
            "Restore Stamina",
            "Lower Weapon Power",
        },
        ["Namira's Rot"] = {
            "Spell Crit",
            "Invisible",
            "Speed",
            "Unstoppable",
        },
        ["Nirnroot"] = {
            "Invisible",
            "Ravage Health",
            "Lower Weapon Crit",
            "Lower Spell Crit",
        },
        ["Stinkhorn"] = {
            "Increase Weapon Power",
            "Lower Armor",
            "Ravage Health",
            "Ravage Stamina",
        },
        ["Violet Coprinus"] = {
            "Increase Spell Power",
            "Lower Spell Resist",
            "Ravage Health",
            "Ravage Magicka",
        },
        ["Water Hyacinth"] = {
            "Restore Health",
            "Weapon Crit",
            "Spell Crit",
            "Stun",
        },
        ["White Cap"] = {
            "Increase Spell Resist",
            "Lower Spell Power",
            "Ravage Magicka",
            "Lower Spell Crit",
        },
        ["Wormwood"] = {
            "Weapon Crit",
            "Detection",
            "Unstoppable",
            "Reduce Speed",
        }
    },
    german = {
        ["Akelei"] = {
            "Leben wiederherstellen",
            "Magicka wiederherstellen",
            "Ausdauer wiederherstellen",
            "Sicherer Stand",
        },
        ["Benediktenkraut"] = {
            "Ausdauer wiederherstellen",
            "Erhöht Waffenkraft",
            "Lebensverwüstung",
            "Tempo",
        },
        ["Bergblume"] = {
            "Erhöht Rüstung",
            "Leben wiederherstellen",
            "Verringert Waffenkraft",
            "Ausdauer wiederherstellen",
        },
        ["Blauer Glöckling"] = {
            "Magickaverwüstung",
            "Verringert Magiekraft",
            "Leben wiederherstellen",
            "Unsichtbarkeit",
        },
        ["Brechtäubling"] = {
            "Lebensverwüstung",
            "Magickaverwüstung",
            "Ausdauerverwüstung",
            "Betäubung",
        },
        ["Drachendorn"] = {
            "Erhöht Waffenkraft",
            "Ausdauer wiederherstellen",
            "Verringert Rüstung",
            "Kritische Waffentreffer",
        },
        ["Koboldschemel"] = {
            "Verringert Waffenkraft",
            "Erhöht Rüstung",
            "Ausdauerverwüstung",
            "Reduziert Kritische Waffentreffer",
        },
        ["Kornblume"] = {
            "Magicka wiederherstellen",
            "Erhöht Magiekraft",
            "Lebensverwüstung",
            "Detektion",
        },
        ["Leuchttäubling"] = {
            "Ausdauerverwüstung",
            "Leben wiederherstellen",
            "Verringert Waffenkraft",
            "Reduziert Tempo",
        },
        ["Namiras Fäulnis"] = {
            "Kritische Zaubertreffer",
            "Unsichtbarkeit",
            "Tempo",
            "Sicherer Stand",
        },
        ["Nirnwurz"] = {
            "Lebensverwüstung",
            "Verringert Kritische Magietreffer",
            "Verringert Kritische Waffentreffer",
            "Unsichtbarkeit",
        },
        ["Stinkmorchel"] = {
            "Verringert Rüstung",
            "Erhöht Waffenkraft",
            "Lebensverwüstung",
            "Ausdauerverwüstung",
        },
        ["Violetter Tintling"] = {
            "Verringert Magieresistenz",
            "Erhöht Magiekraft",
            "Lebensverwüstung",
            "Magickaverwüstung",
        },
        ["Wasserhyazinthe"] = {
            "Leben wiederherstellen",
            "Kritische Zaubertreffer",
            "Kritische Waffentreffer",
            "Betäubung",
        },
        ["Weißkappe"] = {
            "Reduziert Magiekraft",
            "Magickaverwüstung",
            "Erhöht Magieresistenz",
            "Reduziert Kritische Magietreffer",
        },
        ["Wermut"] = {
            "Kritische Waffentreffer",
            "Reduziert Tempo",
            "Detektion",
            "Sicherer Stand",
        },
        ["Wiesenschaumkraut"] = {
            "Erhöht Magiekraft",
            "Magicka wiederherstellen",
            "Verringert Magieresistenz",
            "Kritische Zaubertreffer",
        },
        ["Wolfsauge"] = {
            "Erhöht Magieresistenz",
            "Leben wiederherstellen",
            "Verringert Magiekraft",
            "Magicka wiederherstellen",
        }
    },
    french = {
        ["Chardon Béni"] = {
            "Rend de la Vigueur",
            "Augmente la puissance de l'arme",
            "Vitesse",
            "Réduit la Santé",
        },
        ["Entoloma"] = {
            "Rend de la Santé",
            "invisible^z",
            "Diminue la puissance des sorts",
            "Réduit la Magie",
        },
        ["Noctuelle"] = {
            "Augmente la résistance aux sorts",
            "Rend de la Santé",
            "Rend de la Magie",
            "Diminue la puissance des sorts",
        },
        ["Ancolie"] = {
            "Rend de la Santé",
            "Rend de la Vigueur",
            "Rend de la Magie",
            "Implacable",
        },
        ["Bleuet"] = {
            "Rend de la Magie",
            "Augmente la puissance des sorts",
            "de détection^z",
            "Réduit la Santé",
        },
        ["Épine-de-Dragon"] = {
            "Augmente la puissance de l'arme",
            "Rend de la Vigueur",
            "Arme critique",
            "Diminue l'armure",
        },
        ["Russule Émétique"] = {
            "Réduit la Santé",
            "Réduit la Vigueur",
            "Réduit la Magie",
            "Sonne",
        },
        ["Pied-de-Lutin"] = {
            "Augmente l'armure",
            "Diminue la puissance de l'arme",
            "Réduit la Vigueur",
            "Diminue l'arme critique",
        },
        ["Cardamine des Prés"] = {
            "Augmente la puissance des sorts",
            "Rend de la Magie",
            "Sort critique",
            "Diminue la résistance aux sorts",
        },
        ["Russule Phosphorescente"] = {
            "Rend de la Santé",
            "Réduit la Vigueur",
            "Diminue la puissance de l'arme",
            "Réduit la vitesse",
        },
        ["Lys des Cimes"] = {
            "Augmente l'armure",
            "Rend de la Santé",
            "Rend de la Vigueur",
            "Diminue la puissance de l'arme",
        },
        ["Truffe de Namira"] = {
            "Sort critique",
            "invisible^z",
            "Vitesse",
            "Implacable",
        },
        ["Nirnrave"] = {
            "invisible^z",
            "Réduit la Santé",
            "Diminue l'arme critique",
            "Diminue le sort critique",
        },
        ["Mutinus Elegans"] = {
            "Augmente la puissance de l'arme",
            "Diminue l'armure",
            "Réduit la Santé",
            "Réduit la Vigueur",
        },
        ["Coprin Violet"] = {
            "Augmente la puissance des sorts",
            "Diminue la résistance aux sorts",
            "Réduit la Santé",
            "Réduit la Magie",
        },
        ["Jacinthe D'eau"] = {
            "Rend de la Santé",
            "Arme critique",
            "Sort critique",
            "Sonne",
        },
        ["Chapeau Blanc"] = {
            "Augmente la résistance aux sorts",
            "Diminue la puissance des sorts",
            "Réduit la Magie",
            "Diminue le sort critique",
        },
        ["Absinthe"] = {
            "Arme critique",
            "de détection^z",
            "Implacable",
            "Réduit la vitesse",
        }
    },
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

function Inventory:add_reagent(reagent_name, qty, known_traits, bag_id, slot_index)
    -- Adds a reagent to the current inventory. It will also add traits that we don't know about yet,
    -- and set them to "not discovered". This is indicated by the *value* in the `traits` table.
    local traits = {}
    local lang = Alchemist.Multilingual.get_current_language()

    assert(all_reagents[lang] ~= nil, string.format("'%s' is not a supported language.", lang))

    local all_traits = all_reagents[lang][reagent_name]
    assert(all_traits ~= nil and #all_traits == 4, string.format("'%s' is not a valid reagent.", reagent_name))

    for _, trait in pairs(all_traits) do
        assert(traits[trait] == nil, string.format("Could not find trait '%s' in reagent '%s'", trait, reagent_name))

        -- key = trait name
        -- value = is discovered
        traits[trait] = Alchemist.Batteries.element_is_in_table(trait, known_traits)
    end

    -- This check makes sure that the player didn't have some trait in his inventory that ISN'T in all_reagents.
    for _, trait in pairs(known_traits) do
        assert(traits[trait], string.format("Trait '%s' is NOT in our list of traits for reagent '%s'. " ..
                                            "Please leaeve a comment on esoui.com with this error.", trait, reagent_name))
    end
    
    assert(self.reagents[reagent_name] == nil, string.format("Tried to add '%s', but it's already added.", reagent_name))

    local num_traits = Alchemist.Batteries.num_items_in_table(traits)
    assert(num_traits == 4, string.format("Found %d traits; something is wrong with the reagent '%s'.", num_traits, reagent_name))

    self.reagents[reagent_name] = Alchemist.Reagent:new(reagent_name, qty, traits, bag_id, slot_index)
    
    return self.reagents[reagent_name]
end

 function Inventory:decrement_reagent_qty(reagent)
    -- will either decrement qty or remove the reagent all together.
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
            local known_traits = {t1, t2, t3, t4}
            
            local reagent = self:add_reagent(name, qty, known_traits, bag_id, slot_index)
        end
    end
end

Alchemist.Inventory = Inventory
