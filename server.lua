ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('addItemToInventory')
AddEventHandler('addItemToInventory', function(item, item)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.canCarryItem(item, 1) then
        xPlayer.addInventoryItem(item, 100) -- VALUE ITEM 100
        TriggerClientEvent('esx:showNotification', source, 'Otrzymałeś: ' .. item)
    else
        TriggerClientEvent('esx:showNotification', source, 'Nie masz miejsca w ekwipunku!')
    end
end)
