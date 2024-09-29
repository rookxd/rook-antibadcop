QBCore = exports['qb-core']:GetCoreObject()



CreateThread(function()
    while true do
        if IsPedArmed(PlayerPedId(), 4) then
            local _, silah = GetCurrentPedWeapon(PlayerPedId())
            local silahaq = false
            local meslekaq = false
            local PlayerData = QBCore.Functions.GetPlayerData()
            for i = 1, #Config.Weapons do
                if silah == Config.Weapons[i] then
                    silahaq = true
                    break
                end
            end
            for i = 1, #Config.Jobs do
                if PlayerData.job.name == Config.Jobs[i] then
                    meslekaq = true
                    break
                end
            end
            if silahaq and not meslekaq then
                QBCore.Functions.Notify(Config.Locale['notify'], "error")
                if Config.Inventory == 'ox' then
                    TriggerEvent('ox_inventory:disarm', true)
                elseif Config.Inventory == 'qb' then
                    SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
                end
            end
        end
        Wait(1000)
    end
end)
