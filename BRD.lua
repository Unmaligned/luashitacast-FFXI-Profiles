local profile = {};
local sets = {
    ['Idle'] = {
        Main = 'Ryl.Arc. Sword',
        Range = 'Flute +1',
        Head = 'Ryl.Ftm. Bandana',
        Neck = 'Justice Badge',
        Ear1 = 'Energy Earring',
        Ear2 = 'Energy Earring',
        Body = 'Lgn. Harness',
        Hands = 'Ryl.Ftm. Gloves',
        Ring1 = 'San d\'Orian Ring',
        Ring2 = 'Windurstian Ring',
        Back = 'Cape',
        Waist = 'Leather Belt',
        Legs = 'Slacks +1',
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
    },
    ['Threnody'] = {
        Range = 'Piccolo +1',
    },
    ['Horde'] = {
        Range = 'Flute +1',
    },
    ['Foe'] = {
        Range = 'Mary\'s Horn',
    },
    ['March'] = {
        Range = 'Flute +1',
    },
    ['Madrigal'] = {
        Range = 'Flute +1',
    },
    ['Ballad'] = {
        Range = 'Flute +1',
    },
    ['Minne'] = {
        Range = 'Maple Harp +1',
    },
    ['Minuet'] = {
        Range = 'Cornette +1',
    },
};
profile.Sets = sets;

profile.Packer = {
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
end

profile.HandleDefault = function()
    gFunc.EquipSet(sets.Idle);
	
	local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
			gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet')) end
		if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
        if (gcdisplay.GetToggle('Fight') == false) then AshitaCore:GetChatManager():QueueCommand(1, '/fight') end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
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