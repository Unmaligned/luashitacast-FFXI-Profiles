local profile = {};

local sets = {
    ['Idle'] = {
        Main = 'Pluto\'s Staff',
        Ammo = 'Phtm. Tathlum',
		Head = 'Wizard\'s Petasos',
        Body = 'Igqira Weskit',
        Neck = 'Elemental Torque',
        Ear1 = 'Morion Earring +1',
        Ear2 = 'Moldavite Earring',
        Hands = 'Wizard\'s Gloves',
        Ring1 = 'Diamond Ring',
        Ring2 = 'Diamond Ring',
        Back = 'Rainbow Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Mountain Gaiters',
    },
    ['Resting'] = {
        Body = 'Errant Hpl.',
        Legs = 'Baron\'s Slops',
        Waist = 'Hierarch Belt',
    },
    ['Enfeeb'] = {
	    Head = 'Wizard\'s Petasos',
        Body = 'Wizard\'s Coat',
    },
    ['Nuke'] = {
	    Head = 'Demon Helm',
        Body = 'Igqira Weskit',
    },
    ['Dark'] = {
        Legs = 'Wizard\'s Tonban',
    },
    ['Town'] = {
 --       Body = 'Royal Cloak',
 		Head = 'Wizard\'s Petasos',
        Body = 'Igqira Weskit',
    },
    ['Sandy'] = {
        Head = 'Wizard\'s Petasos',
        Body = 'Kingdom Aketon',
    },
    ['Refresh'] = {
        Head = '',
        Body = 'Royal Cloak',
    },
    ['CAST_SOLO'] = {

        Body = 'Igqira Weskit',
        Main = 'Pluto\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Neck = 'Elemental Torque',
        Ear1 = 'Morion Earring +1',
        Ear2 = 'Moldavite Earring',
        Hands = 'Wizard\'s Gloves',
        Ring1 = 'Diamond Ring',
        Ring2 = 'Diamond Ring',
        Back = 'Rainbow Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Mountain Gaiters',
    },
    ['CAST_PARTY'] = {
        Head = 'Wizard\'s Petasos',
        Body = 'Igqira Weskit',
        Neck = 'Black Neckerchief',
        Main = 'Pluto\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Ear1 = 'Morion Earring +1',
        Ear2 = 'Moldavite Earring',
        Hands = 'Wizard\'s Gloves',
        Ring1 = 'Diamond Ring',
        Ring2 = 'Diamond Ring',
        Back = 'Rainbow Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Mountain Gaiters',
    },
};

local ObiTable = {
    ['Fire'] = 'Karin Obi',
    ['Earth'] = 'Dorin Obi',
    ['Water'] = 'Suirin Obi',
    ['Wind'] = 'Furin Obi',
    ['Ice'] = 'Hyorin Obi',
    ['Thunder'] = 'Rairin Obi',
    ['Light'] = 'Korin Obi',
    ['Dark'] = 'Anrin Obi'
};

local ElementalStaffTable = {
    ['Fire'] = 'Aquilo\'s Staff',
    ['Earth'] = 'Aquilo\'s Staff',
    ['Water'] = 'Aquilo\'s Staff',
    ['Wind'] = 'Auster\'s Staff',
    ['Ice'] = 'Aquilo\'s Staff',
    ['Thunder'] = 'Aquilo\'s Staff',
    ['Light'] = 'Appollo\'s Staff',
    ['Dark'] = 'Pluto\'s Staff'
};
profile.Sets = sets;

profile.Packer = {
};

-- Zone table(s)
local Zone = {};

-- San d'Oria Zones
Zone.Sandy = {
    ['Port San d\'Oria'] = true,
    ['Southern San d\'Oria'] = true,
    ['Northern San d\'Oria'] = true,
    ['Chateau d\'Oraguille'] = true,
}

Zone.City = {
    ['Port Jeuno'] = true,
    ['Port Bastok'] = true,
    ['Lower Jeuno'] = true,
    ['Upper Jeuno'] = true,
    ['Ru\'Lude Gardens'] = true,
    ['*Whitegate'] = true,
    ['Nashmau'] = true,
    ['Bastok*'] = true,
    ['Metalworks'] = true,
    ['Windurst*'] = true,
    ['Heavens*'] = true,
    ['Kazham'] = true,
    ['Norg'] = true,
    ['Rabao'] = true,
}

-----------------------------------------------
-- Casting modes
-----------------------------------------------
local CastingVariantTable = {
    [1] = 'Solo',
    [2] = 'Party',
}

-----------------------------------------------
-- Global settings
-----------------------------------------------
local Settings = {
    CastingVariant = 1,
    IsRefreshOn = false,
};

profile.OnLoad = function()

    -- Required
    gSettings.AllowAddSet = true;

    -- Grab the player info
	local player = gData.GetPlayer();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 3');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');

    -- Register keybinds
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 /lac fwd castingset');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 /lac fwd refresh');

    -- Output which set is currently enabled
    gFunc.Message('Casting Mode: ' .. CastingVariantTable[Settings.CastingVariant]); 
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
    -- Catch the "castingset" command
    if (args[1] == "castingset") then

        -- Increment the Casting mode index
        Settings.CastingVariant = Settings.CastingVariant + 1;

        -- Reset the melee mode index if it's out of bounds
        if (Settings.CastingVariant > #CastingVariantTable) then
            Settings.CastingVariant = 1;
        end

        -- Output which set is currently enabled
        gFunc.Message('Casting Set: ' .. CastingVariantTable[Settings.CastingVariant]);    

    end

    -- Catch the "refresh" command
    if (args[1] == "refresh") then

        -- Check if the refresh set is currently on
        if (Settings.IsRefreshOn == true) then
            Settings.IsRefreshOn = false;
            gFunc.Message('Refresh Set: OFF');    
        else
            Settings.IsRefreshOn = true;
            gFunc.Message('Refresh Set: ON');    
        end

    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();
    local zone = gData.GetEnvironment('Area');

--    gFunc.EquipSet(sets.Idle);

    gFunc.EquipSet('CAST_' .. CastingVariantTable[Settings.CastingVariant]);

    if (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    end

    -- Override with the refresh set
    if (Settings.IsRefreshOn == true) then
        gFunc.EquipSet(profile.Sets.Refresh);
    end

    if (Zone.Sandy[zone.Area]) then
	gFunc.EquipSet(sets.Sandy);
    elseif (Zone.City[zone.Area]) then
	gFunc.EquipSet(sets.Town);
    end

end

profile.HandleAbility = function()
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()


end

profile.HandleMidcast = function()
    local spell = gData.GetAction();

    if (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.Enfeeb);
	gFunc.Equip('main', ElementalStaffTable[spell.Element]);
    elseif (spell.Skill == 'Dark Magic') then
    	gFunc.EquipSet(sets.Dark);
	gFunc.Equip('main', ElementalStaffTable[spell.Element]);
    elseif (spell.Skill == 'Elemental Magic') then
        gFunc.EquipSet(sets.Nuke);
	gFunc.Equip('main', ElementalStaffTable[spell.Element]);
    end

end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end

return profile;