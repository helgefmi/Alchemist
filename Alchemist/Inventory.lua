-- all reagents {{{
local SI = Alchemist.SI

local all_reagents = {
    [SI.get(SI.BLESSED_THISTLE)] = {
        SI.get(SI.INCREASE_WEAPON_POWER),
        SI.get(SI.RAVAGE_HEALTH),
        SI.get(SI.RESTORE_STAMINA),
        SI.get(SI.SPEED),
    },
    [SI.get(SI.BLUE_ENTOLOMA)] = {
        SI.get(SI.INVISIBLE),
        SI.get(SI.LOWER_SPELL_POWER),
        SI.get(SI.RAVAGE_MAGICKA),
        SI.get(SI.RESTORE_HEALTH),
    },
    [SI.get(SI.BUGLOSS)] = {
        SI.get(SI.INCREASE_SPELL_RESIST),
        SI.get(SI.LOWER_SPELL_POWER),
        SI.get(SI.RESTORE_HEALTH),
        SI.get(SI.RESTORE_MAGICKA),
    },
    [SI.get(SI.COLUMBINE)] = {
        SI.get(SI.RESTORE_HEALTH),
        SI.get(SI.RESTORE_MAGICKA),
        SI.get(SI.RESTORE_STAMINA),
        SI.get(SI.UNSTOPPABLE),
    },
    [SI.get(SI.CORN_FLOWER)] = {
        SI.get(SI.DETECTION),
        SI.get(SI.INCREASE_SPELL_POWER),
        SI.get(SI.RAVAGE_HEALTH),
        SI.get(SI.RESTORE_MAGICKA),
    },
    [SI.get(SI.DRAGONTHORN)] = {
        SI.get(SI.INCREASE_WEAPON_POWER),
        SI.get(SI.LOWER_ARMOR),
        SI.get(SI.RESTORE_STAMINA),
        SI.get(SI.WEAPON_CRIT),
    },
    [SI.get(SI.EMETIC_RUSSULA)] = {
        SI.get(SI.RAVAGE_HEALTH),
        SI.get(SI.RAVAGE_MAGICKA),
        SI.get(SI.RAVAGE_STAMINA),
        SI.get(SI.STUN),
    },
    [SI.get(SI.IMP_STOOL)] = {
        SI.get(SI.INCREASE_ARMOR),
        SI.get(SI.LOWER_WEAPON_CRIT),
        SI.get(SI.LOWER_WEAPON_POWER),
        SI.get(SI.RAVAGE_STAMINA),
    },
    [SI.get(SI.LADYS_SMOCK)] = {
        SI.get(SI.INCREASE_SPELL_POWER),
        SI.get(SI.LOWER_SPELL_RESIST),
        SI.get(SI.RESTORE_MAGICKA),
        SI.get(SI.SPELL_CRIT),
    },
    [SI.get(SI.LUMINOUS_RUSSULA)] = {
        SI.get(SI.LOWER_WEAPON_POWER),
        SI.get(SI.RAVAGE_STAMINA),
        SI.get(SI.REDUCE_SPEED),
        SI.get(SI.RESTORE_HEALTH),
    },
    [SI.get(SI.MOUNTAIN_FLOWER)] = {
        SI.get(SI.INCREASE_ARMOR),
        SI.get(SI.LOWER_WEAPON_POWER),
        SI.get(SI.RESTORE_HEALTH),
        SI.get(SI.RESTORE_STAMINA),
    },
    [SI.get(SI.NAMIRAS_ROT)] = {
        SI.get(SI.INVISIBLE),
        SI.get(SI.SPEED),
        SI.get(SI.SPELL_CRIT),
        SI.get(SI.UNSTOPPABLE),
    },
    [SI.get(SI.NIRNROOT)] = {
        SI.get(SI.INVISIBLE),
        SI.get(SI.LOWER_SPELL_CRIT),
        SI.get(SI.LOWER_WEAPON_CRIT),
        SI.get(SI.RAVAGE_HEALTH),
    },
    [SI.get(SI.STINKHORN)] = {
        SI.get(SI.INCREASE_WEAPON_POWER),
        SI.get(SI.LOWER_ARMOR),
        SI.get(SI.RAVAGE_HEALTH),
        SI.get(SI.RAVAGE_STAMINA),
    },
    [SI.get(SI.VIOLET_COPRINUS)] = {
        SI.get(SI.INCREASE_SPELL_POWER),
        SI.get(SI.LOWER_SPELL_RESIST),
        SI.get(SI.RAVAGE_HEALTH),
        SI.get(SI.RAVAGE_MAGICKA),
    },
    [SI.get(SI.WATER_HYACINTH)] = {
        SI.get(SI.RESTORE_HEALTH),
        SI.get(SI.SPELL_CRIT),
        SI.get(SI.STUN),
        SI.get(SI.WEAPON_CRIT),
    },
    [SI.get(SI.WHITE_CAP)] = {
        SI.get(SI.INCREASE_SPELL_RESIST),
        SI.get(SI.LOWER_SPELL_CRIT),
        SI.get(SI.LOWER_SPELL_POWER),
        SI.get(SI.RAVAGE_MAGICKA),
    },
    [SI.get(SI.WORMWOOD)] = {
        SI.get(SI.DETECTION),
        SI.get(SI.REDUCE_SPEED),
        SI.get(SI.UNSTOPPABLE),
        SI.get(SI.WEAPON_CRIT),
    },

}
-- }}}

local Inventory = {}

function Inventory.new()
    local self = {
        reagents = {}
    }
    setmetatable(self, { __index = Inventory })
    
    return self
end

function Inventory:add_reagent(reagent_name, qty, known_traits, bag_id, slot_index)
    -- Adds a reagent to the current inventory. It will also add traits that we don't know about yet,
    -- and set them to "not discovered". This is indicated by the *value* in the `traits` table.
    local traits = {}

    local all_traits = all_reagents[reagent_name]
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
    -- populates self.reagents using GetAlchemyItemTraits().
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
