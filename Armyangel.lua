local profile = {}

local sets = {
    Idle = {
        Ammo = "",
        Head = "Errant hat",
        Neck = "Ajari bead necklace",
        Ear1 = "Abyssal Earring",
        Ear2 = "Magnetic Earring",
        Body = "Noble\'s Tunic",
        Hands = "Hlr. Mitts +1",
        Ring1 = "Tamas Ring",
        Ring2 = "Peace ring",
        Back = "Rainbow Cape",
        Waist = "Cleric\'s Belt",
        Legs = "Blessed Trousers",
        Feet = "Rostrum pumps",
    },
    Resting = {
        Body = "Errant Hpl.",
	Waist = "Cleric\'s Belt",
    },
    Precast = {
        Hands = "",
    },
    Divine = {
        Neck = "",
        Legs = "Healer\'s Pantaln",
    },
    Enfeebling = {
        Neck = "Enfeebling Torque",
        Body = "Healer\'s Bliaut",
	Hands = "Cleric\'s Mitts",
    },
    Enhancing = {
        Neck = "",
	Feet = "Cleric\'s Duckbills",
    },
    Healing = {
        Neck = "Ajari bead necklace",
        Body = "Noble\'s Tunic",
        Hands = "Hlr. Mitts +1",
        Legs = "Cleric's Pantaln.",
        Feet = "Cure Clogs",
    },
    MND = {
        Neck = "Ajari bead necklace",
        Body = "Errant Hpl.",
        Hands = "Hlr. Mitts +1",
	Feet = "Cleric\'s Duckbills",
        Ring1 = "Tamas Ring",
    },
    Melee = {
        Main = "Darksteel Maul",
	Body = "Reverend Mail",
	Hands = "Hlr. Mitts +1",
        Legs = "Blessed Trousers",
    },
    Regen = {
        Body = "Cleric\'s Bliaut",
    },
};

local ElementalStaffTable = {
    ['Fire'] = 'Vulcan\'s Staff',
    ['Earth'] = 'Terra\'s Staff',
    ['Water'] = 'Neptune\'s Staff',
    ['Wind'] = 'Auster\'s Staff',
    ['Ice'] = 'Aquilo\'s Staff',
    ['Thunder'] = 'Jupiter\'s Staff',
    ['Light'] = 'Apollo\'s Staff',
    ['Dark'] = 'Dark Staff'
};

profile.Sets = sets;

profile.OnLoad = function()
    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 1")
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 3")
end

-- profile.OnUnload = function() end
-- profile.HandleCommand = function (args) end

profile.HandleDefault = function()
    local player = gData.GetPlayer()

    if (player.Status == "Engaged") then
        -- Melee set w/o staff change, keep that tp
        gFunc.EquipSet(sets.Melee)
    elseif (player.Status == "Resting") then
        -- Resting set + Dark Staff
        gFunc.EquipSet(sets.Resting)
        gFunc.Equip('main', ElementalStaffTable['Dark'])
    else
        -- Idle set + Apollo's Staff
        gFunc.EquipSet(sets.Idle)
        gFunc.Equip('main', ElementalStaffTable['Light'])
    end

end

-- profile.HandleAbility = function() end
-- profile.HandleItem = function() end

profile.HandlePrecast = function()
    gFunc.EquipSet(sets.Precast)
end

profile.HandleMidcast = function()
    local spell = gData.GetAction()
    if (spell.Skill == "Divine Magic") then
        gFunc.EquipSet(sets.Divine)
    elseif (spell.Skill == "Enfeebling Magic") then
        gFunc.EquipSet(sets.Enfeebling)
    elseif (spell.Skill == "Enhancing Magic") then
        if (spell.Name == "Stoneskin") then
            gFunc.EquipSet(sets.MND)
	elseif (spell.Name == "Regen" or "Regen II" or "Regen III") then
            gFunc.EquipSet(sets.Regen)
        else
            gFunc.EquipSet(sets.Enhancing)
        end
    elseif (spell.Skill == "Healing Magic") then
        gFunc.EquipSet(sets.Healing)
    end

end

-- profile.HandlePreshot = function() end
-- profile.HandleMidshot = function() end
-- profile.HandleWeaponskill = function() end

return profile;
