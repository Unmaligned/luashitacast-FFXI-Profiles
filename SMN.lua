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
};
profile.Sets = sets;

profile.Packer = {
};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 7');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
end

profile.HandleDefault = function()
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