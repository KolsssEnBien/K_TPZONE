local ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('myteleport:checkAndTeleport')
AddEventHandler('myteleport:checkAndTeleport', function(zoneName)
    local src = source
    local zone = nil

    for _, z in ipairs(Config.Zones) do
        if z.name == zoneName then
            zone = z
            break
        end
    end

    if not zone then
        print(("[myteleport] Zone '%s' non trouvée."):format(zoneName))
        return
    end

    local ped = GetPlayerPed(src)
    if not ped then return end

    local pedCoords = GetEntityCoords(ped)
    if #(pedCoords - zone.center) < zone.radius + 1.0 then
        TriggerClientEvent('myteleport:doTeleport', src, zone.destination, zone.heading)
    else
        print(("[myteleport] %s a tenté de se TP hors zone."):format(GetPlayerName(src)))
    end
end)
