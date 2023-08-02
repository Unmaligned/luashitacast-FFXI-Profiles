local profile = {};
local sets = {
    ['Idle'] = {
        Main = 'Yew Wand +1',
        Ammo = 'Fortune Egg',
        Head = 'Silver Hairpin +1',
        Neck = 'Rep.Bronze Medal',
        Ear1 = 'Energy Earring',
        Ear2 = 'Energy Earring',
        Body = 'Trader\'s Saio',
        Hands = 'Carbuncle Mitts',
        Ring1 = 'Astral Ring',
        Ring2 = 'Astral Ring',
        Back = 'Cape',
        Waist = 'Friar\'s Rope',
        Legs = 'Baron\'s Slops',
        Feet = 'Mage\'s Sandals',
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
-- Pet tables(s)
local Pet = {};

-- Summon pets
Pet.Summon = {
    ['Carbuncle'] = 'Light',
    ['Diabolos'] = 'Dark',
    ['Fenrir'] = 'Dark',
    ['Garuda'] = 'Wind',
    ['Titan'] = 'Earth',
    ['Ifrit'] = 'Fire',
    ['Shiva'] = 'Ice',
    ['Ramuh'] = 'Thunder',
    ['Leviathan'] = 'Water',
}
    
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
    CastingVariant = 1,
    IsRefreshOn = false,
    IsFishOn = false,
};

profile.OnLoad = function()
    -- Required
    gSettings.AllowAddSet = true;

    -- Grab the player info
	local player = gData.GetPlayer();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 7');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');

    -- Register keybinds
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 /lac fwd fish');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 /lac fwd refresh');
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();
    local zone = gData.GetEnvironment('Area');
    local pet = gData.GetPet('Name')

    if (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
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

    if (pet.Name ~= nil) then
	gFunc.EquipSet(sets.Idle);
    elseif (Pet.Summon[pet.Name]) then
	gFunc.Equip('main', ElementalStaffTable[Pet.Summon]);
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
end

return profile;