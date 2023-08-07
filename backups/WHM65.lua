local profile = {};

local sets = {
    Idle = {
        Main = 'Apollo\'s Staff',
        Ammo = 'Holy Ampulla',
        Neck = 'Ajari Necklace',
        Ear1 = 'Geist Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Royal Cloak',
        Hands = 'Savage Gauntlets',
        Ring1 = 'Serenity Ring',
        Ring2 = 'Serenity Ring',
        Waist = 'Penitent\'s Rope',
        Legs = 'Healer\'s Pantaln.',
        Feet = 'Seer\'s Pumps +1',
        Back = 'White Cape +1',
    },
    Resting = {
	Main = 'Pluto\'s Staff',
        Legs = 'Baron\'s Slops',
    },

    Casting = {
        Head = 'Healer\'s Cap',
        Body = 'Healer\'s Bliaut',
    },
    Cure = {
	Feet = 'Cure Clogs',
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
    local player = gData.GetPlayer();
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();

    if (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure);
    end
end

profile.HandleMidcast = function()
    local player = gData.GetPlayer();
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();

    if (spell.Skill == 'Divine Magic') then
        gFunc.EquipSet(sets.Casting);
    elseif (spell.Skill == 'Elemental Magic') then
        gFunc.EquipSet(sets.Casting);
    elseif (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.Casting);
    elseif (spell.Skill == 'Dark Magic') then
        gFunc.EquipSet(sets.Casting);
    end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end

return profile;