local profile = {};

local sets = {
    Idle75 = {
        Main = 'Apollo\'s Staff',
        Ammo = 'Holy Ampulla',
        Neck = 'Ajari Necklace',
        Ear1 = 'Geist Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Royal Cloak',
        Hands = 'Blessed Mitts',
        Ring1 = 'Serenity Ring',
        Ring2 = 'Serenity Ring',
        Waist = 'Penitent\'s Rope',
        Legs = 'Blessed Trousers',
        Feet = 'Blessed Pumps',
        Back = 'Rainbow Cape',
    },
    Idle65 = {
        Main = 'Apollo\'s Staff',
        Ammo = 'Holy Ampulla',
        Neck = 'Ajari Necklace',
        Ear1 = 'Geist Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Royal Cloak',
        Hands = 'Savage Gauntlets',
        Ring1 = 'Serenity Ring',
        Ring2 = 'Serenity Ring',
        Waist = 'Penitent\'s Rope',
        Legs = 'Healer\'s Pantaln.',
        Feet = 'Seer\'s Pumps +1',
        Back = 'White Cape +1',
    },
    Idle50 = {
        Main = 'Rose Wand +1',
        Ammo = 'Holy Ampulla',
        Head = 'Gold Hairpin +1',
        Neck = 'Holy Phial',
        Ear1 = 'Geist Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Ryl.Sqr. Robe',
        Hands = 'Savage Gauntlets',
        Ring1 = 'Tranquility Ring',
        Ring2 = 'Tranquility Ring',
        Waist = 'Friar\'s Rope',
        Legs = 'Savage Loincloth',
        Feet = 'Seer\'s Pumps +1',
        Back = 'White Cape +1',
    },
    Resting75 = {
	Main = 'Pluto\'s Staff',
        Body = 'Errant Houppelande',
        Legs = 'Baron\'s Slops',
        Waist = 'Hierarch Belt',
    },
    Resting65 = {
	Main = 'Pluto\'s Staff',
        Legs = 'Baron\'s Slops',
    },
    Resting50 = {
	Main = 'Blessed Hammer',
        Body = 'Seer\'s tunic',
        Legs = 'Baron\'s Slops',
    },
    Casting75 = {
        Head = 'Healer\'s Cap',
        Body = 'Healer\'s Bliaut',
    },
    Casting65 = {
        Head = 'Healer\'s Cap',
        Body = 'Healer\'s Bliaut',
    },
    Cure = {
	Feet = 'Cure Clogs',
    },
    ['Choco'] = {
        Head = 'Healer\'s Cap',
        Body = 'Choc. Jack Coat',
        Hands = 'Chocobo Gloves',
        Legs = 'Chocobo Hose',
        Feet = 'Chocobo Boots',
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
    IsChocoOn = false,
};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 2');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');

    -- Register keybinds
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 /lac fwd choco');
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)


    -- Catch the "choco" command
    if (args[1] == "choco") then

        -- Check if the choco set is currently on
        if (Settings.IsChocoOn == true) then
            Settings.IsChocoOn = false;
            gFunc.Message('Choco Set: OFF');    
        else
            Settings.IsChocoOn = true;
            gFunc.Message('Choco Set: ON');    
        end
    end

end

profile.HandleDefault = function()
    -- Grab the player info
	local player = gData.GetPlayer();
	local sync = gData.GetPlayer(MainJobSync);
        local zone = gData.GetEnvironment('Area');

    if (sync.MainJobSync == 75) then
    	gFunc.EquipSet(sets.Idle75);
    	if (player.Status == 'Resting') then
        	gFunc.EquipSet(sets.Resting75);
    	end
    elseif (sync.MainJobSync >= 65) and (sync.MainJobSync <= 74) then
    	gFunc.EquipSet(sets.Idle65);
    	if (player.Status == 'Resting') then
        	gFunc.EquipSet(sets.Resting65);
    	end
    elseif (sync.MainJobSync == 50) then
    	gFunc.EquipSet(sets.Idle50);
    	if (player.Status == 'Resting') then
        	gFunc.EquipSet(sets.Resting50);
    	end
    end

    -- Override with the fish set
    if (Settings.IsChocoOn == true) then
        gFunc.EquipSet(profile.Sets.Choco);
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
    local player = gData.GetPlayer();
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();

    if (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure);
    end
end

profile.HandleMidcast = function()
    local player = gData.GetPlayer();
    local sync = gData.GetPlayer(MainJobSync);
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();

    if (sync.MainJobSync == 75) then
   	 if (spell.Skill == 'Divine Magic') then
    	    gFunc.EquipSet(sets.Casting75);
  	  elseif (spell.Skill == 'Elemental Magic') then
   	     gFunc.EquipSet(sets.Casting75);
  	  elseif (spell.Skill == 'Enfeebling Magic') then
  	      gFunc.EquipSet(sets.Casting75);
  	  elseif (spell.Skill == 'Dark Magic') then
 	       gFunc.EquipSet(sets.Casting75);
 	   end
    elseif (sync.MainJobSync >= 65) and (sync.MainJobSync <= 74) then
   	 if (spell.Skill == 'Divine Magic') then
    	    gFunc.EquipSet(sets.Casting65);
  	  elseif (spell.Skill == 'Elemental Magic') then
   	     gFunc.EquipSet(sets.Casting65);
  	  elseif (spell.Skill == 'Enfeebling Magic') then
  	      gFunc.EquipSet(sets.Casting65);
  	  elseif (spell.Skill == 'Dark Magic') then
 	       gFunc.EquipSet(sets.Casting65);
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