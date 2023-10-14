-- Radio Item
if Radio.Item.UseItem then

    ESX.RegisterUsableItem(Radio.Item.ItemName, function(source)
        TriggerClientEvent('Zoxe:Radio-Use', source, Player(source).state.radioChannel, 0)
    end)

end

-- Radio Command
if Radio.Command.UseCommand then

    RegisterCommand(Radio.Command.CommandName, function(source)
        TriggerClientEvent('Zoxe:Radio-Use', source, Player(source).state.radioChannel, 0)
    end)

end

-- Radio Drop
RegisterServerEvent("Zoxe:Drop")
AddEventHandler("Zoxe:Drop", function (quest)
    DropPlayer(source, quest)
end)

-- Radio Channel
ESX.RegisterServerCallback('Zoxe:GetRadio', function(source, cb, id)
	local RadioChannel = Player(id).state.radioChannel
	cb(RadioChannel)
end)