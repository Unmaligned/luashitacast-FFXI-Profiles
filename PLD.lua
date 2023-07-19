local profile = {};
local sets = {
    ['IdleOH'] = {
        Main = 'Joyeuse',
        Sub = 'Koenig Shield',
        Ammo = 'Fortune Egg',
        Head = 'Koenig Schaller',
        Neck = 'Parade Gorget',
        Ear1 = 'Knight\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Adaman Cuirass',
        Hands = 'Valor Gauntlets',
        Ring1 = 'Phalanx Ring',
        Ring2 = 'Jelly Ring',
        Back = 'Resentment Cape',
        Waist = 'Warwolf Belt',
	Legs = 'Adaman Cuisses',
        Feet = 'Gallant Leggings',
    },
    ['TP_Default'] = {
        Hands = 'Dusk Gloves',
    },
    ['TP_PDT'] = {
    },
    ['TP_MDT'] = {
    },
    ['WS'] = {
        Head = 'Aegishjalmr',
        Body = 'Haubergeon',
        Hands = 'Gallant Gauntlets',
        Legs = 'Valor Breeches',
    },
    ['Sentinel'] = {
        Head = 'Aegishjalmr',
        Feet = 'Valor Leggings',
    },
    ['Rampart'] = {
        Head = 'Valor Coronet',
    },
    ['HPUP'] = {
        Ammo = 'Happy Egg',
        Neck = 'Shield Torque',
        Body = 'Gallant Surcoat',
        Ear2 = 'Cassie Earring',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Bloodbead Ring',
        Waist = 'Warrior\'s Belt +1',
        Legs = 'Valor Breeches',
        Feet = 'Valor Leggings',
    },
    ['Refresh'] = {
        Head = '',
        Body = 'Royal Cloak',
    },
};

profile.Sets = sets;
profile.Packer = {};

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
-- TP modes
-----------------------------------------------
local TpVariantTable = {
    [1] = 'Default',
    [2] = 'PDT',
    [3] = 'MDT',
}

-----------------------------------------------
-- Global settings
-----------------------------------------------
local Settings = {
    TpVariant = 1,
    IsRefreshOn = false,
};

-----------------------------------------------
-- When the lua is loaded
-----------------------------------------------
profile.OnLoad = function()

    -- Required
    gSettings.AllowAddSet = true;

    -- Grab the player info
	local player = gData.GetPlayer();

    -- Check if we're sub Ninja
	if (player.SubJob == 'NIN') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro book 13');
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
        AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 11');

    -- Check if we're sub Thief, White Mage or Warrior
    elseif (player.SubJob == 'THF' or player.SubJob == 'WHM' or player.SubJob == 'WAR') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro book 11');
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');

	end

    -- Register keybinds
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 /lac fwd tpset');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 /lac fwd refresh');

    -- Output which set is currently enabled
    gFunc.Message('TP Set: ' .. TpVariantTable[Settings.TpVariant]);    

end

-----------------------------------------------
-- When the lua is unloaded
-----------------------------------------------
profile.OnUnload = function()

    -- Unregister keybinds
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F10');

end

-----------------------------------------------
-- When a command is caught
-----------------------------------------------
profile.HandleCommand = function(args)

    -- Catch the "tpset" command
    if (args[1] == "tpset") then

        -- Increment the melee mode index
        Settings.TpVariant = Settings.TpVariant + 1;

        -- Reset the melee mode index if it's out of bounds
        if (Settings.TpVariant > #TpVariantTable) then
            Settings.TpVariant = 1;
        end

        -- Output which set is currently enabled
        gFunc.Message('TP Set: ' .. TpVariantTable[Settings.TpVariant]);    

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

-----------------------------------------------
-- When an action ends
-----------------------------------------------
profile.HandleDefault = function()

    -- Grab the player info
	local player = gData.GetPlayer();
        local zone = gData.GetEnvironment('Area');

    -- Check if we're sub Ninja
	if (player.SubJob == 'NIN') then
          gFunc.EquipSet(sets.IdleOH);

    -- Check if we're sub Thief, White Mage or Warrior
        elseif (player.SubJob == 'THF' or player.SubJob == 'WHM' or player.SubJob == 'WAR') then
          gFunc.EquipSet(sets.IdleOH);

	end

    -- Check if we're engaged
    if (player.Status == 'Engaged') then
        gFunc.EquipSet('TP_' .. TpVariantTable[Settings.TpVariant]);
    end

    -- Override with the refresh set
    if (Settings.IsRefreshOn == true) then
        gFunc.EquipSet(profile.Sets.Refresh);
    end

    if (zone.Area == 'Port San d\'Oria') or (zone.Area == 'Southern San d\'Oria') or (zone.Area == 'Northern San d\'Oria') or (zone.Area == 'Chateau*') then
        gFunc.Equip('Body', 'Kingdom Aketon');
    end

end

-----------------------------------------------
-- When an ability is used
-----------------------------------------------
profile.HandleAbility = function()

    -- Grab the action info
    local action = gData.GetAction();
    
    -- Check if the action is Sentinel
	if (action.Type == "Sentinel") then
		gFunc.EquipSet(sets.Sentinel);

    -- Check if the action is Rampart
    	elseif (action.Type == "Rampart") then
		gFunc.EquipSet(sets.Rampart);

	end

end

-----------------------------------------------
-- When an item is used
-----------------------------------------------
profile.HandleItem = function()
end

-----------------------------------------------
-- Before a spell is cast
-----------------------------------------------
profile.HandlePrecast = function()
end

-----------------------------------------------
-- While a spell is cast
-----------------------------------------------
profile.HandleMidcast = function()

    -- Grab the action info
    local spell = gData.GetAction();

    -- If the spell is Healing Magic
    if (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.HPUP);
    end

end

-----------------------------------------------
-- Before a shot is taken
-----------------------------------------------
profile.HandlePreshot = function()
end

-----------------------------------------------
-- While a shot is taken
-----------------------------------------------
profile.HandleMidshot = function()
end

-----------------------------------------------
-- When an weapon skill is used
-----------------------------------------------
profile.HandleWeaponskill = function()

    -- Grab the action info
    local action = gData.GetAction();

    -- When Savage Blade is used
    if (action.Name == 'Savage Blade') then
        gFunc.EquipSet(sets.WS);
        
    -- When Swift Blade is used
    elseif (action.Name == 'Swift Blade') then
        gFunc.EquipSet(sets.WS);
    end

end

return profile;