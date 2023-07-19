local profile = {};
profile.Sets = {
    WHM = {
        Main = 'Solid Wand',
        Sub = 'Fish Scale Shield',
        Ammo = 'Fortune Egg',
        Head = 'Electrum Hairpin',
        Neck = 'Holy Phial',
        Ear1 = 'Energy Earring',
        Ear2 = 'Energy Earring',
        Body = 'Seer\'s Tunic',
        Hands = 'Savage Gauntlets',
        Ring1 = 'Tranquility Ring',
        Ring2 = 'Tranquility Ring',
        Waist = 'Friar\'s Rope',
        Legs = 'Savage Loincloth',
        Feet = 'Seer\'s Pumps +1',
    },
};

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