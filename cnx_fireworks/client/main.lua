-- Fireworks Random Event --
RegisterNetEvent('fwr')
AddEventHandler('fwr',function() 
    -- Request the particle dictionary.
    RequestNamedPtfxAsset(Config.Fireworks[1].dict)
    -- Wait for the particle dictionary to load.
    while not HasNamedPtfxAssetLoaded(Config.Fireworks[1].dict) do
        Citizen.Wait(0)
    end

    -- Request the particle dictionary.
    RequestNamedPtfxAsset(Config.Fireworks[5].dict)
    -- Wait for the particle dictionary to load.
    while not HasNamedPtfxAssetLoaded(Config.Fireworks[5].dict) do
        Citizen.Wait(0)
    end

    -- Request the particle dictionary.
    RequestNamedPtfxAsset(Config.Fireworks[11].dict)
    -- Wait for the particle dictionary to load.
    while not HasNamedPtfxAssetLoaded(Config.Fireworks[11].dict) do
        Citizen.Wait(0)
    end

    -- Request the particle dictionary.
    RequestNamedPtfxAsset(Config.Fireworks[16].dict)
    -- Wait for the particle dictionary to load.
    while not HasNamedPtfxAssetLoaded(Config.Fireworks[16].dict) do
        Citizen.Wait(0)
    end

    local showComplete = 0
    while showComplete < Config.ShowDuration do

        if showComplete == (Config.ShowDuration - 1) then

            local val = math.floor(math.random(1,23))
            UseParticleFxAssetNextCall(Config.Fireworks[val].dict)
            StartParticleFxNonLoopedAtCoord(Config.Fireworks[val].asset, Config.Coords.x, Config.Coords.y, Config.Coords.z, 0.0, 0.0, 0.0, 0.5, false, false, false)

            UseParticleFxAssetNextCall(Config.Fireworks[val].dict)
            StartParticleFxNonLoopedAtCoord(Config.Fireworks[val].asset, Config.Coords.x, Config.Coords.y, Config.Coords.z, 0.0, -22.5, 0.0, 0.5, false, false, false)
            Citizen.Wait(math.random(250,1000))

            val = math.floor(math.random(1,23))
            UseParticleFxAssetNextCall(Config.Fireworks[val].dict)
            StartParticleFxNonLoopedAtCoord(Config.Fireworks[val].asset, Config.Coords.x, Config.Coords.y, Config.Coords.z, 0.0, -22.5, 0.0, 0.5, false, false, false)

            UseParticleFxAssetNextCall(Config.Fireworks[val].dict)
            StartParticleFxNonLoopedAtCoord(Config.Fireworks[val].asset, Config.Coords.x, Config.Coords.y, Config.Coords.z, 0.0, 22.5, 0.0, 0.5, false, false, false)
            Citizen.Wait(math.random(250,1000))

            val = math.floor(math.random(1,23))
            UseParticleFxAssetNextCall(Config.Fireworks[val].dict)
            StartParticleFxNonLoopedAtCoord(Config.Fireworks[val].asset, Config.Coords.x, Config.Coords.y, Config.Coords.z, 0.0, 22.5, 0.0, 0.5, false, false, false)

            UseParticleFxAssetNextCall(Config.Fireworks[val].dict)
            StartParticleFxNonLoopedAtCoord(Config.Fireworks[val].asset, Config.Coords.x, Config.Coords.y, Config.Coords.z, 0.0, -45.0, 0.0, 0.5, false, false, false)
            Citizen.Wait(math.random(250,1000))

            val = math.floor(math.random(1,23))
            UseParticleFxAssetNextCall(Config.Fireworks[val].dict)
            StartParticleFxNonLoopedAtCoord(Config.Fireworks[val].asset, Config.Coords.x, Config.Coords.y, Config.Coords.z, 0.0, -45.0, 0.0, 0.5, false, false, false)

            UseParticleFxAssetNextCall(Config.Fireworks[val].dict)
            StartParticleFxNonLoopedAtCoord(Config.Fireworks[val].asset, Config.Coords.x, Config.Coords.y, Config.Coords.z, 0.0, 45.0, 0.0, 0.5, false, false, false)
            Citizen.Wait(math.random(250,1000))

            val = math.floor(math.random(1,23))
            UseParticleFxAssetNextCall(Config.Fireworks[val].dict)
            StartParticleFxNonLoopedAtCoord(Config.Fireworks[val].asset, Config.Coords.x, Config.Coords.y, Config.Coords.z, 0.0, 45.0, 0.0, 0.5, false, false, false)

            UseParticleFxAssetNextCall(Config.Fireworks[val].dict)
            StartParticleFxNonLoopedAtCoord(Config.Fireworks[val].asset, Config.Coords.x, Config.Coords.y, Config.Coords.z, 0.0, 0.0, 0.0, 0.5, false, false, false)
    
        else

            local val = math.floor(math.random(1,23))
            UseParticleFxAssetNextCall(Config.Fireworks[val].dict)
            StartParticleFxNonLoopedAtCoord(Config.Fireworks[val].asset, Config.Coords.x, Config.Coords.y, Config.Coords.z, 0.0, 0.0, 0.0, 0.5, false, false, false)
            Citizen.Wait(math.random(250,1000))

            val = math.floor(math.random(1,23))
            UseParticleFxAssetNextCall(Config.Fireworks[val].dict)
            StartParticleFxNonLoopedAtCoord(Config.Fireworks[val].asset, Config.Coords.x, Config.Coords.y, Config.Coords.z, 0.0, -22.5, 0.0, 0.5, false, false, false)
            Citizen.Wait(math.random(250,1000))

            val = math.floor(math.random(1,23))
            UseParticleFxAssetNextCall(Config.Fireworks[val].dict)
            StartParticleFxNonLoopedAtCoord(Config.Fireworks[val].asset, Config.Coords.x, Config.Coords.y, Config.Coords.z, 0.0, 22.5, 0.0, 0.5, false, false, false)
            Citizen.Wait(math.random(250,1000))

            val = math.floor(math.random(1,23))
            UseParticleFxAssetNextCall(Config.Fireworks[val].dict)
            StartParticleFxNonLoopedAtCoord(Config.Fireworks[val].asset, Config.Coords.x, Config.Coords.y, Config.Coords.z, 0.0, -45.0, 0.0, 0.5, false, false, false)
            Citizen.Wait(math.random(250,1000))

            val = math.floor(math.random(1,23))
            UseParticleFxAssetNextCall(Config.Fireworks[val].dict)
            StartParticleFxNonLoopedAtCoord(Config.Fireworks[val].asset, Config.Coords.x, Config.Coords.y, Config.Coords.z, 0.0, 45.0, 0.0, 0.5, false, false, false)

        end

        showComplete = showComplete + 1
        
        Citizen.Wait(math.random(250,1000))
    end
end)

RegisterNetEvent('fw')
AddEventHandler('fw',function(dict, asset) 
    -- Request the particle dictionary.
    RequestNamedPtfxAsset(dict)
    -- Wait for the particle dictionary to load.
    while not HasNamedPtfxAssetLoaded(dict) do
        Citizen.Wait(0)
    end

    local showComplete = 0
    while showComplete < Config.ShowDuration do
        
        UseParticleFxAssetNextCall(dict)
        StartParticleFxNonLoopedAtCoord(asset, Config.Coords.x, Config.Coords.y, Config.Coords.z, 0.0, 0.0, 0.0, 0.5, false, false, false)
        
        showComplete = showComplete + 1
        
        Citizen.Wait(math.random(250,1000))
    end
end)