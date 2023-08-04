local profile = {};

local sets = {
    Idle = {
        Main = 'Apollo\'s Staff',
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
    Resting = {
	Main = 'Pluto\'s Staff',
        Body = 'Seer\'s tunic',
        Legs = 'Baron\'s Slops',
    },
};
profile.Sets = sets;

profile.Packer = {
    
};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 2');
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
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end

return profile;