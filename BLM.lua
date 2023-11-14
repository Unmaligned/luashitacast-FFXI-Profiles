local profile = {};

local sets = {
    ['Idle75'] = {
        Main = 'Pluto\'s Staff',
        Ammo = 'Phtm. Tathlum',
	Head = 'Src. Petasos +1',
        Body = 'Sorcerer\'s Coat',
        Neck = 'Elemental Torque',
        Ear1 = 'Morion Earring +1',
        Ear2 = 'Moldavite Earring',
        Hands = 'Wizard\'s Gloves',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Rainbow Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Rostrum Pumps',
    },
    ['Idle68'] = {
        Main = 'Pluto\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Neck = 'Elemental Torque',
        Ear1 = 'Morion Earring +1',
        Ear2 = 'Moldavite Earring',
        Hands = 'Wizard\'s Gloves',
        Ring1 = 'Genius Ring',
        Ring2 = 'Genius Ring',
        Back = 'Black Cape +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Druid\'s Slops',
        Feet = 'Mountain Gaiters',
    },
    ['Idle67'] = {
        Main = 'Pluto\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Neck = 'Elemental Torque',
        Ear1 = 'Morion Earring +1',
        Ear2 = 'Moldavite Earring',
        Hands = 'Wizard\'s Gloves',
        Ring1 = 'Genius Ring',
        Ring2 = 'Genius Ring',
        Back = 'Black Cape +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Druid\'s Slops',
        Feet = 'Mountain Gaiters',
    },
    ['Idle60'] = {
        Main = 'Pluto\'s Staff',
        Ammo = 'Morion Tathlum',
        Body = 'Shaman\'s Cloak',
        Neck = 'Black Neckerchief',
        Ear1 = 'Morion Earring +1',
        Ear2 = 'Moldavite Earring',
        Hands = 'Wizard\'s Gloves',
        Ring1 = 'Genius Ring',
        Ring2 = 'Genius Ring',
        Back = 'Black Cape +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Seer\'s Slacks',
        Feet = 'Mountain Gaiters',
    },
    ['Idle50'] = {
        Main = 'Rose Wand +1',
	Sub = 'Yew Wand +1',
        Ammo = 'Morion Tathlum',
        Head = 'Seer\'s Crown +1',
        Neck = 'Black Neckerchief',
        Ear1 = 'Morion Earring +1',
        Ear2 = 'Moldavite Earring',
        Body = 'Ryl.Sqr. Robe',
        Hands = 'Seer\'s Mitts +1',
        Ring1 = 'Wisdom Ring',
        Ring2 = 'Wisdom Ring',
        Back = 'Black Cape +1',
        Waist = 'Friar\'s Rope',
        Legs = 'Seer\'s Slacks',
        Feet = 'Mountain Gaiters',
    },
    ['Idle20'] = {
        Main = 'Yew Wand +1',
        Ammo = 'Fortune Egg',
        Head = 'Silver Hairpin +1',
        Neck = 'Black Neckerchief',
        Ear1 = 'Energy Earring',
        Ear2 = 'Energy Earring',
        Body = 'Trader\'s Saio',
        Hands = 'Chocobo Gloves',
        Ring1 = 'Tranquility Ring',
        Ring2 = 'Tranquility Ring',
        Back = 'Cape',
        Waist = 'Friar\'s Rope',
        Legs = 'Baron\'s Slops',
        Feet = 'Mage\'s Sandals',
    },
    ['Resting75'] = {
        Body = 'Errant Hpl.',
        Legs = 'Baron\'s Slops',
        Waist = 'Hierarch Belt',
    },
    ['Resting68'] = {
        Body = 'Royal Cloak',
        Legs = 'Baron\'s Slops',
    },
    ['Resting67'] = {
        Body = 'Royal Cloak',
        Legs = 'Baron\'s Slops',
    },
    ['Resting50'] = {
        Body = 'Seer\'s Tunic',
        Legs = 'Baron\'s Slops',
    },
    ['Enfeeb'] = {
	Head = 'Wizard\'s Petasos',
        Body = 'Wizard\'s Coat',
    },
    ['Nuke75'] = {
	Head = 'Demon Helm',
        Body = 'Igqira Weskit',
        Feet = 'Sorcerer\'s Sabots',
    },
    ['Nuke68'] = {
        Body = 'Black Cloak',
    },
    ['Nuke67'] = {
        Body = 'Shaman\'s Cloak',
    },
    ['Nuke60'] = {
        Body = 'Shaman\'s Cloak',
    },
    ['Dark'] = {
        Legs = 'Wizard\'s Tonban',
    },
    ['Town'] = {
 	Head = 'Src. Petasos +1',
        Body = 'Sorcerer\'s Coat',
    },
    ['Sandy'] = {
        Head = 'Src. Petasos +1',
        Body = 'Kingdom Aketon',
    },
    ['Refresh'] = {
        Head = '',
        Body = 'Black Cloak',
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
    ['Water'] = 'Neptune\'s Staff',
    ['Wind'] = 'Auster\'s Staff',
    ['Ice'] = 'Aquilo\'s Staff',
    ['Thunder'] = 'Jupiter\'s Staff',
    ['Light'] = 'Apollo\'s Staff',
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

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 3');
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


    if (sync.MainJobSync == 75) then
   	gFunc.EquipSet(sets.Idle75);
   	if (player.Status == 'Resting') then
	       	gFunc.EquipSet(sets.Resting75);
   	end
    elseif -(sync.MainJobSync >= 68) and (sync.MainJobSync <= 74) then
    	gFunc.EquipSet(sets.Idle68);
    	if (player.Status == 'Resting') then
        	gFunc.EquipSet(sets.Resting68);
    	end
   elseif (sync.MainJobSync == 67) then
   	gFunc.EquipSet(sets.Idle67);
   	if (player.Status == 'Resting') then
       	gFunc.EquipSet(sets.Resting67);
   	end
   elseif (sync.MainJobSync >= 65) and (sync.MainJobSync <= 66) then
   	gFunc.EquipSet(sets.Idle65);
   	if (player.Status == 'Resting') then
	       	gFunc.EquipSet(sets.Resting65);
   	end
   elseif (sync.MainJobSync == 60) then
   	gFunc.EquipSet(sets.Idle60);
   	if (player.Status == 'Resting') then
		gFunc.EquipSet(sets.Resting50);
   	end
   elseif (sync.MainJobSync == 50) then
   	gFunc.EquipSet(sets.Idle50);
   	if (player.Status == 'Resting') then
       		gFunc.EquipSet(sets.Resting50);
   	end
   elseif (sync.MainJobSync == 20) then
   	gFunc.EquipSet(sets.Idle20);
   end

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
    local player = gData.GetPlayer();
    local sync = gData.GetPlayer(MainJobSync);
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();

    if (sync.MainJobSync == 75) then
   	 if (spell.Skill == 'Divine Magic') then
    	     gFunc.EquipSet(sets.Nuke75);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
  	 elseif (spell.Skill == 'Elemental Magic') then
   	     gFunc.EquipSet(sets.Nuke75);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
  	 elseif (spell.Skill == 'Enfeebling Magic') then
  	     gFunc.EquipSet(sets.Enfeeb);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
  	 elseif (spell.Skill == 'Dark Magic') then
 	     gFunc.EquipSet(sets.Dark);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
 	 end
    elseif (sync.MainJobSync >= 68) and (sync.MainJobSync <= 74) then
   	 if (spell.Skill == 'Divine Magic') then
    	     gFunc.EquipSet(sets.Nuke68);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
  	 elseif (spell.Skill == 'Elemental Magic') then
   	     gFunc.EquipSet(sets.Nuke68);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
  	 elseif (spell.Skill == 'Enfeebling Magic') then
  	     gFunc.EquipSet(sets.Enfeeb);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
  	 elseif (spell.Skill == 'Dark Magic') then
 	     gFunc.EquipSet(sets.Dark);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
 	 end
    elseif (sync.MainJobSync == 67) then
   	 if (spell.Skill == 'Divine Magic') then
    	     gFunc.EquipSet(sets.Nuke67);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
  	 elseif (spell.Skill == 'Elemental Magic') then
   	     gFunc.EquipSet(sets.Nuke67);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
  	 elseif (spell.Skill == 'Enfeebling Magic') then
  	     gFunc.EquipSet(sets.Enfeeb);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
  	 elseif (spell.Skill == 'Dark Magic') then
 	     gFunc.EquipSet(sets.Dark);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
 	 end
    elseif (sync.MainJobSync >= 65) and (sync.MainJobSync <= 66) then
   	 if (spell.Skill == 'Divine Magic') then
    	     gFunc.EquipSet(sets.Nuke65);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
  	 elseif (spell.Skill == 'Elemental Magic') then
   	     gFunc.EquipSet(sets.Nuke65);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
  	 elseif (spell.Skill == 'Enfeebling Magic') then
  	     gFunc.EquipSet(sets.Enfeeb);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
  	 elseif (spell.Skill == 'Dark Magic') then
 	     gFunc.EquipSet(sets.Dark);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
 	 end
    elseif (sync.MainJobSync == 60) then
   	 if (spell.Skill == 'Divine Magic') then
    	     gFunc.EquipSet(sets.Nuke60);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
  	 elseif (spell.Skill == 'Elemental Magic') then
   	     gFunc.EquipSet(sets.Nuke60);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
  	 elseif (spell.Skill == 'Enfeebling Magic') then
  	     gFunc.EquipSet(sets.Enfeeb);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
  	 elseif (spell.Skill == 'Dark Magic') then
 	     gFunc.EquipSet(sets.Dark);
	     gFunc.Equip('main', ElementalStaffTable[spell.Element]);
 	 end
    end


end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end

return profile;