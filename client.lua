ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function openItemMenu()
    local elements = {}

    for _, item in ipairs(Config.Item) do
        table.insert(elements, {label = item.name, value = item})
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'item_menu', {
        title = 'Select Item',
        align = 'center',
        elements = elements
    }, function(data, menu)
        local selectedItem = data.current.value
        
        TriggerServerEvent('addItemToInventory', selectedItem.item, selectedItem.item)
        menu.close()
    end, function(data, menu)
        menu.close()
    end)

    SetMenuWidth('item_menu', 0.5)
    SetMenuHeight('item_menu', 0.4)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(1, 167) then -- F6
            openItemMenu()
        end
    end
end)

function SetMenuWidth(menu, width)

end

function SetMenuHeight(menu, height)

end

