local ESX = exports["es_extended"]:getSharedObject()
local alreadyInZone = {}

CreateThread(function()
    while true do
        Wait(0) 

        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for i, zone in ipairs(Config.Zones) do
            local pos = zone.center
            local dist2D = #(vector2(playerCoords.x, playerCoords.y) - vector2(pos.x, pos.y))
            local dz = math.abs(playerCoords.z - pos.z)
            -- hauteur de detection "dz < 10.0 then" vout pouvez modifier pour 1,2,3 etc  
            if dist2D < zone.radius and dz < 10.0 then
                if not alreadyInZone[zone.name] then
                    alreadyInZone[zone.name] = true
                    TriggerServerEvent('myteleport:checkAndTeleport', zone.name)
                end
            else
                alreadyInZone[zone.name] = false
            end
        end
    end
end)

RegisterNetEvent('myteleport:doTeleport', function(dest, heading)
    local playerPed = PlayerPedId()

    DoScreenFadeOut(200)
    while not IsScreenFadedOut() do Wait(10) end

    RequestCollisionAtCoord(dest.x, dest.y, dest.z)
    while not HasCollisionLoadedAroundEntity(playerPed) do Wait(50) end

    FreezeEntityPosition(playerPed, true)
    SetEntityCoordsNoOffset(playerPed, dest.x, dest.y, dest.z, false, false, false)
    if heading then
        SetEntityHeading(playerPed, heading)
    end
    Wait(300)
    FreezeEntityPosition(playerPed, false)

    DoScreenFadeIn(300)
    ESX.ShowNotification("Tu es passé sous une entité que tu n'as pas chargé, tu es donc TP zone safe.")
end)


if Config.Debug then
    CreateThread(function()
        while true do
            Wait(0)
            for _, zone in pairs(Config.Zones) do
                DrawMarker(
                    1,
                    zone.center.x, zone.center.y, zone.center.z - 1.0,
                    0, 0, 0, 0, 0, 0,
                    zone.radius * 2.0, zone.radius * 2.0, 1.0,
                    255, 0, 255, 100,
                    false, false, 2, nil, nil, false
                )
            end
        end
    end)
end
