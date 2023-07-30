local profile = {};
local sets = {
    ['Idle'] = {
        Main = 'Nodachi',
        Ammo = 'Happy Egg',
        Head = 'Ryl.Ftm. Bandana',
        Neck = 'Justice Badge',
        Ear1 = 'Cassie Earring',
        Ear2 = 'Optical Earring',
        Body = 'Lgn. Harness',
        Hands = 'Ryl.Ftm. Gloves',
        Ring1 = 'Courage Ring',
        Ring2 = 'Courage Ring',
        Back = 'Rabbit Mantle',
        Waist = 'Warrior\'s Belt +1',
        Legs = 'Bone Subligar',
        Feet = 'Bounding Boots',
    },
};
profile.Sets = sets;

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
    -- Grab the player info
	local player = gData.GetPlayer();
        local zone = gData.GetEnvironment('Area');

          gFunc.EquipSet(sets.Idle);


    if (zone.Area == 'Port San d\'Oria') or (zone.Area == 'Southern San d\'Oria') or (zone.Area == 'Northern San d\'Oria') or (zone.Area == 'Chateau*') then
        gFunc.Equip('Body', 'Kingdom Aketon');
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