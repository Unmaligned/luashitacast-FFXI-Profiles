local profile = {};

local sets = {
    Idle = {
        Main = 'Pluto\'s Staff',
        Ammo = 'Morion Tathlum',
        Neck = 'Black Neckerchief',
        Ear1 = 'Morion Earring +1',
        Ear2 = 'Moldavite Earring',
        Body = 'Shaman\'s Cloak',
        Hands = 'Wizard\'s Gloves',
        Ring1 = 'Genius Ring',
        Ring2 = 'Genius Ring',
        Back = 'Black Cape +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Seer\'s Slacks',
        Feet = 'Mountain Gaiters',
    },
    Resting = {
        Body = 'Royal Cloak',
        Legs = 'Baron\'s Slops',
    },
    Enfeeb = {
	Head = 'Wizard\'s Petasos',
        Body = 'Wizard\'s Coat',
	Legs = 'Wizard\'s Tonban'
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

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 3');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
gcinclude.HandleCommands(args);
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();

    gFunc.EquipSet(sets.Idle);
    if (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
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
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();

    gFunc.Equip('main', ElementalStaffTable[spell.Element]);



end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end

return profile;