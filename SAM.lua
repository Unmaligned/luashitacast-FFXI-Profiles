local profile = {};
local sets = {
    ['Idle'] = {
	Range = 'War Bow +1',
        Ammo = 'Horn Arrow',
        Head = 'Myochin Kabuto',
        Neck = 'Peacock Amulet',
--        Ear1 = 'Cassie Earring',
        Ear1 = 'Geist Earring',
        Ear2 = 'Spike Earring',
        Body = 'Haubergeon',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Sniper\'s Ring',
--        Ring2 = 'Sniper\'s Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Jaguar Mantle',
        Waist = 'Swift Belt',
        Legs = 'Ryl.Kgt. Breeches',
        Feet = 'Sarutobi Kyahan',
    },
    ['WS'] = {
        Ring1 = 'Victory Ring',
        Ring2 = 'Victory Ring',
    },
    ['Sandy'] = {
        Body = 'Kingdom Aketon',
    },
    ['WEAPON_Great Katana'] = {
        Main = 'Soboro Sukehiro',
    },
    ['WEAPON_Polearm'] = {
        Main = 'Battle Fork',
    },
    ['WEAPON_Warp Cudgel'] = {
        Main = 'Warp Cudgel',
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
-- Casting modes
-----------------------------------------------
local WeaponVariantTable = {
    [1] = 'Great Katana',
    [2] = 'Polearm',
    [3] = 'Warp Cudgel',
}

-----------------------------------------------
-- Global settings
-----------------------------------------------
local Settings = {
    WeaponVariant = 1,
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    -- Grab the player info
	local player = gData.GetPlayer();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 6');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');

    -- Register keybinds
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F12 /lac fwd weaponset');
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
--     Catch the "weaponset" command
    if (args[1] == "weaponset") then

        -- Increment the Casting mode index
       Settings.WeaponVariant = Settings.WeaponVariant + 1;

        -- Reset the melee mode index if it's out of bounds
        if (Settings.WeaponVariant > #WeaponVariantTable) then
            Settings.WeaponVariant = 1;
        end

        -- Output which set is currently enabled
        gFunc.Message('Weapon Set: ' .. WeaponVariantTable[Settings.WeaponVariant]);    

    end
end

profile.HandleDefault = function()
    -- Grab the player info
	local player = gData.GetPlayer();
        local zone = gData.GetEnvironment('Area');

        gFunc.EquipSet(sets.Idle);
	gFunc.EquipSet('WEAPON_' .. WeaponVariantTable[Settings.WeaponVariant]);


    if (zone.Area == 'Port San d\'Oria') or (zone.Area == 'Southern San d\'Oria') or (zone.Area == 'Northern San d\'Oria') or (zone.Area == 'Chateau*') then
        gFunc.EquipSet(sets.Sandy);
    end
end

profile.HandleAbility = function()
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
end

profile.HandleMidcast = function()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    -- Grab the action info
    local action = gData.GetAction();

    if (action.Name == 'Tachi: Enpi') then
        gFunc.EquipSet(sets.WS);
    elseif (action.Name == 'Tachi: Hobaku') then
        gFunc.EquipSet(sets.WS);
    elseif (action.Name == 'Tachi: Goten') then
        gFunc.EquipSet(sets.WS);
    elseif (action.Name == 'Tachi: Kagero') then
        gFunc.EquipSet(sets.WS);
    elseif (action.Name == 'Tachi: Jinpu') then
        gFunc.EquipSet(sets.WS);
    end
end

return profile;