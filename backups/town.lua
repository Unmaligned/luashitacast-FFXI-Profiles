profile.HandleDefault = function()
    local environment = gData.GetEnvironment();
    if (string.match(environment.Area, 'Port*')) or (string.match(environment.Area, 'Lower Jeuno')) or (string.match(environment.Area, 'Upper Jeuno')) or (string.match(environment.Area, 'Ru\'Lude*')) or (string.match(environment.Area, '*Whitegate')) or (string.match(environment.Area, 'Nashmau')) or (string.match(environment.Area, 'Bastok*')) or (string.match(environment.Area, 'Metalworks')) or (string.match(environment.Area, 'Windurst*')) or (string.match(environment.Area, 'Heavens*')) or (string.match(environment.Area, 'Kazham')) or (string.match(environment.Area, 'Norg')) or (string.match(environment.Area, 'Rabao')) or (string.match(environment.Area, 'Southern San d\'Oria')) or (string.match(environment.Area, 'Northern San d\'Oria')) or (string.match(environment.Area, 'Port San d\'Oria')) or (string.match(environment.Area, 'Chateau*')) then
	gFunc.EquipSet(sets.Town);
    end
end