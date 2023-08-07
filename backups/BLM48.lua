local profile = {};
local sets = {
    ['Idle'] = {
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
    ['Resting'] = {
        Body = 'Seer\'s Tunic',
        Legs = 'Baron\'s Slops',
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

end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end

return profile;