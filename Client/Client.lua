RegisterNetEvent('Zoxe:Radio-Use')
AddEventHandler('Zoxe:Radio-Use', function(frequency, volume, volumeicon)

    if frequency == 0 and volume == 0 then
        frequency = Radio.Lang["Frequency_Off"]
        volume = Radio.Lang["Volume_Off"]
        volumeicon = Radio.Lang["Icon_Volume_Off"]
    elseif volumeicon == nil then
        volumeicon = Radio.Lang["Icon_Volume_Low"]
    else
        frequency = frequency
        volume = volume
        volumeicon = volumeicon
    end

    RadioAnim(true)

    lib.registerContext({
        id = 'radio',
        title = Radio.Lang["Menu_Title"],
        onExit = function()
			RadioAnim(false)
		end,
        options = {
            {
                title = Radio.Lang["Title_Frequency"],
                description = Radio.Lang["Description_Frequency"]..frequency,
                icon = Radio.Lang["Icon_Frequency"],
                arrow = true,
                onSelect = function()

                    SelectFrequency()
                    
                end,
            },
            {
                title = Radio.Lang["Title_Volume"],
                description = Radio.Lang["Description_Volume"]..volume,
                icon = volumeicon,
                arrow = true,
                onSelect = function()

                    SelectVolume(frequency)
                    
                end,
            },
            {
                title = Radio.Lang["Title_Disconnect"],
                icon = Radio.Lang["Icon_Disconnect"],
                -- arrow = true,
                onSelect = function()

                    Disconnect_Or_TurnOff(true)
                    
                end,
            },
            {
                title = Radio.Lang["Title_PowerOff"],
                icon = Radio.Lang["Icon_PowerOff"],
                -- arrow = true,
                onSelect = function()

                    Disconnect_Or_TurnOff(false)
                    
                end,
            },
        }
    })

    lib.showContext('radio')

end)