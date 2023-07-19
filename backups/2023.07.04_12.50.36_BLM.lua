local profile = {};

local sets = {
    Idle = {
        Main = 'Pluto\'s Staff',
        Ammo = 'Morion Tathlum',
        Neck = 'Black Neckerchief',
        Ear1 = 'Morion Earring +1',
        Ear2 = 'Moldavite Earring',
        Body = 'Royal Cloak',
        Hands = 'Wizard\'s Gloves',
        Ring1 = 'Genius Ring',
        Ring2 = 'Genius Ring',
        Back = 'Black Cape +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Druid\'s Slops',
        Feet = 'Mountain Gaiters',
    },
    Resting = {
        Body = 'Royal Cloak',
        Legs = 'Baron\'s Slops',
    },
    Enfeeb = {
	Head = 'Wizard\'s Petasos',
        Body = 'Wizard\'s Coat',
    },
    Nuke = {
        Body = 'Shaman\'s Cloak',
    },
    Dark = {
        Legs = 'Wizard\'s Tonban',
    },
    Town = {
        Body = 'Royal Cloak',
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

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 3');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();
    local environment = gData.GetEnvironment();

    gFunc.EquipSet(sets.Idle);
    if (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    end

    if (string.match(environment.Area, 'Port*')) or (string.match(environment.Area, 'Lower Jeuno')) or (string.match(environment.Area, 'Upper Jeuno')) or (string.match(environment.Area, 'Ru\'Lude*')) or (string.match(environment.Area, '*Whitegate')) or (string.match(environment.Area, 'Nashmau')) or (string.match(environment.Area, 'Bastok*')) or (string.match(environment.Area, 'Metalworks')) or (string.match(environment.Area, 'Windurst*')) or (string.match(environment.Area, 'Heavens*')) or (string.match(environment.Area, 'Kazham')) or (string.match(environment.Area, 'Norg')) or (string.match(environment.Area, 'Rabao')) or (string.match(environment.Area, 'Southern San d\'Oria')) or (string.match(environment.Area, 'Northern San d\'Oria')) or (string.match(environment.Area, 'Port San d\'Oria')) or (string.match(environment.Area, 'Chateau*')) then
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