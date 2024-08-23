local profile = {};
local sets = {
    ['Idle'] = {
        Main = 'Brass Xiphos +1',
        Range = 'Flute +1',
        Head = 'Ryl.Ftm. Bandana',
        Neck = 'Justice Badge',
        Ear1 = 'Cassie Earring',
        Ear2 = 'Optical Earring',
        Body = 'Lgn. Harness',
        Hands = 'Ryl.Ftm. Gloves',
        Ring1 = 'San d\'Orian Ring',
        Ring2 = 'Courage Ring',
        Back = 'Cape',
        Waist = 'Friar\'s Rope',
        Legs = 'Brass Subligar',
        Feet = 'Bounding Boots',
    },
    ['TP_Default'] = {
    },
    ['Resting'] = {
    },
    ['Movement'] = {
    },
    ['Wind'] = {
        Range = 'Flute +1',
    },
	['Requiem'] = {
        Range = 'Flute +1',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
    },
    ['Threnody'] = {
        Range = 'Piccolo +1',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
    },
    ['Horde'] = {
        Range = 'Flute +1',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
    },
    ['Foe'] = {
        Range = 'Mary\'s Horn',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
    },
    ['March'] = {
        Range = 'Flute +1',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
    },
    ['Madrigal'] = {
        Range = 'Flute +1',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
    },
    ['Ballad'] = {
        Range = 'Flute +1',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
    },
    ['Minne'] = {
        Range = 'Maple Harp +1',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
    },
    ['Minuet'] = {
        Range = 'Cornette +1',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
    },
    ['Town'] = {
    },
    ['Sandy'] = {
        Body = 'Kingdom Aketon',
    },
    ['Windy'] = {
        Body = 'Federation Aketon',
    },
    ['Bastok'] = {
        Body = 'Republic Aketon',
    },
    ['Fish'] = {
        Body = 'Fsh. Tunica',
        Hands = 'Fsh. Gloves',
        Legs = 'Fisherman\'s Hose',
        Feet = 'Fisherman\'s Boots',
        Range = 'Halcyon Rod',
        Ammo = 'Minnow',
    },
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

-- Windurst Zones
Zone.Windy = {
    ['Windurst*'] = true,
    ['Heavens*'] = true,
}

-- Bastok Zones
Zone.Bastok = {
    ['Bastok*'] = true,
    ['Metalworks'] = true,
    ['Port Bastok'] = true,
}

Zone.City = {
    ['Port Jeuno'] = true,
    ['Lower Jeuno'] = true,
    ['Upper Jeuno'] = true,
    ['Ru\'Lude Gardens'] = true,
    ['*Whitegate'] = true,
    ['Nashmau'] = true,
    ['Kazham'] = true,
    ['Norg'] = true,
    ['Rabao'] = true,
}

-----------------------------------------------
-- Global settings
-----------------------------------------------
local Settings = {
    IsRefreshOn = false,
    IsFishOn = false,
};

profile.OnLoad = function()
    -- Required
    gSettings.AllowAddSet = true;

    -- Grab the player info
	local player = gData.GetPlayer();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 10');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');

    -- Register keybinds
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 /lac fwd refresh');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 /lac fwd fish');

end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)

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

    -- Catch the "fish" command
    if (args[1] == "fish") then

        -- Check if the fish set is currently on
        if (Settings.IsFishOn == true) then
            Settings.IsFishOn = false;
            gFunc.Message('Fish Set: OFF');    
        else
            Settings.IsFishOn = true;
            gFunc.Message('Fish Set: ON');    
        end

    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();
    local sync = gData.GetPlayer(MainJobSync);
    local zone = gData.GetEnvironment('Area');

    gFunc.EquipSet(sets.Idle);

    -- Override with the refresh set
    if (Settings.IsRefreshOn == true) then
        gFunc.EquipSet(profile.Sets.Refresh);
    end

    -- Override with the fish set
    if (Settings.IsFishOn == true) then
        gFunc.EquipSet(profile.Sets.Fish);
    end

    if (Zone.Sandy[zone.Area]) then
	gFunc.EquipSet(sets.Sandy);
    elseif (Zone.Windy[zone.Area]) then
	gFunc.EquipSet(sets.Windy);
    elseif (Zone.Bastok[zone.Area]) then
	gFunc.EquipSet(sets.Bastok);
    elseif (Zone.City[zone.Area]) then
	gFunc.EquipSet(sets.Town);
    end
end

profile.HandleAbility = function()
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
        if (string.contains(spell.Name, 'Elegy')) or (string.contains(spell.Name, 'Finale')) then
            gFunc.EquipSet(sets.Wind);
        end
        if (string.contains(spell.Name, 'Requiem')) then
            gFunc.EquipSet(sets.Requiem);
        elseif (string.contains(spell.Name, 'Threnody')) then
            gFunc.EquipSet(sets.Threnody);
		elseif (string.contains(spell.Name, 'Horde Lullaby')) then
            gFunc.EquipSet(sets.Horde);
        elseif (string.contains(spell.Name, 'Foe Lullaby')) then
            gFunc.EquipSet(sets.Foe);
        elseif (string.contains(spell.Name, 'March')) then
            gFunc.EquipSet(sets.March);
        elseif (string.contains(spell.Name, 'Madrigal')) then
            gFunc.EquipSet(sets.Madrigal);
        elseif (string.contains(spell.Name, 'Ballad')) then
            gFunc.EquipSet(sets.Ballad);
        elseif (string.contains(spell.Name, 'Minne')) then
            gFunc.EquipSet(sets.Minne);
        elseif (string.contains(spell.Name, 'Minuet')) then
            gFunc.EquipSet(sets.Minuet);
        end
end

profile.HandleMidcast = function()
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
        if (string.contains(spell.Name, 'Elegy')) or (string.contains(spell.Name, 'Finale')) then
            gFunc.EquipSet(sets.Wind);
        end
        if (string.contains(spell.Name, 'Requiem')) then
            gFunc.EquipSet(sets.Requiem);
        elseif (string.contains(spell.Name, 'Threnody')) then
            gFunc.EquipSet(sets.Threnody);
		elseif (string.contains(spell.Name, 'Horde Lullaby')) then
            gFunc.EquipSet(sets.Horde);
        elseif (string.contains(spell.Name, 'Foe Lullaby')) then
            gFunc.EquipSet(sets.Foe);
        elseif (string.contains(spell.Name, 'March')) then
            gFunc.EquipSet(sets.March);
        elseif (string.contains(spell.Name, 'Madrigal')) then
            gFunc.EquipSet(sets.Madrigal);
        elseif (string.contains(spell.Name, 'Ballad')) then
            gFunc.EquipSet(sets.Ballad);
        elseif (string.contains(spell.Name, 'Minne')) then
            gFunc.EquipSet(sets.Minne);
        elseif (string.contains(spell.Name, 'Minuet')) then
            gFunc.EquipSet(sets.Minuet);
        end
		
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end

return profile;