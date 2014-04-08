local Reagent = {}

function Reagent:new(name, qty, traits, bag_id, slot_index)
    self = {
        name = name,
        qty = qty,
        traits = traits,
        bag_id = bag_id,
        slot_index = slot_index,
    }
    setmetatable(self, {__index = Reagent})

    return self
end

function Reagent:discover(trait)
    assert(self.traits[trait] == false)
    self.traits[trait] = true
end

Alchemist.Reagent = Reagent
