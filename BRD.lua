local profile = {};
local sets = {
    ['Idle'] = {
        Main = 'Centurion\'s Sword',
	Sub = 'Varlet\'s Targe',
        Range = 'Ryl.Spr. Horn',
        Head = 'Mrc.Cpt. Headgear',
        Neck = 'Holy Phial',
        Ear1 = 'Cassie Earring',
        Ear2 = 'Optical Earring',
        Body = 'Mrc.Cpt. Doublet',
        Hands = 'Savage Gauntlets',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Stamina Ring',
        Back = 'Wolf Mantle +1',
        Waist = 'Warrior\'s Belt +1',
        Legs = 'Kingdom Trousers',
        Feet = 'Savage Gaiters',
    },
    ['TP_Default'] = {
    },
    ['Resting'] = {
        Legs = 'Baron\'s Slops',
    },
    ['Movement'] = {
    },
    ['Wind'] = {
        Range = 'Ryl.Spr. Horn',
    },
    ['Requiem'] = {
        Range = 'Siren Flute',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
        Neck = 'Bird Whistle',
    },
    ['Paeon'] = {
        Range = 'Harp +1',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
        Neck = 'Bird Whistle',
    },
    ['Threnody'] = {
        Range = 'Piccolo +1',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
        Neck = 'Bird Whistle',
    },
    ['Horde'] = {
        Range = 'Mary\'s Horn',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
        Neck = 'Bird Whistle',
    },
    ['Foe'] = {
        Range = 'Mary\'s Horn',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
        Neck = 'Bird Whistle',
    },
    ['March'] = {
        Range = 'Ryl.Spr. Horn',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
        Neck = 'Bird Whistle',
    },
    ['Madrigal'] = {
        Range = 'Ryl.Spr. Horn',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
        Neck = 'Bird Whistle',
    },
    ['Ballad'] = {
        Range = 'Ryl.Spr. Horn',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
        Neck = 'Bird Whistle',
    },
    ['Minne'] = {
        Range = 'Harp +1',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
        Neck = 'Bird Whistle',
    },
    ['Minuet'] = {
        Range = 'Cornette +1',
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
        Neck = 'Bird Whistle',
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
    ['Windurst Walls'] = true,
    ['Windurst Waters'] = true,
    ['Windurst Woods'] = true, 
    ['Port Windurst'] = true, 
    ['Heavens Tower'] = true,
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


    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default);
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
	gFunc.EquipSet(sets.Movement);
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



    -- Override with the refresh set
    if (Settings.IsRefreshOn == true) then
        gFunc.EquipSet(profile.Sets.Refresh);
    end

    -- Override with the fish set
    if (Settings.IsFishOn == true) then
        gFunc.EquipSet(profile.Sets.Fish);
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
        elseif (string.contains(spell.Name, 'Paeon')) then
            gFunc.EquipSet(sets.Paeon);
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
        elseif (string.contains(spell.Name, 'Paeon')) then
            gFunc.EquipSet(sets.Paeon);
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