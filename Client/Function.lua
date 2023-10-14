function RadioAnim(state)

    lib.requestAnimDict('cellphone@')

	if state then

		TriggerEvent("attachItemRadio","radio01")
		TaskPlayAnim(PlayerPedId(), "cellphone@", "cellphone_text_read_base", 2.0, 3.0, -1, 49, 0, 0, 0, 0)
		radioProp = CreateObject(`prop_cs_hand_radio`, 1.0, 1.0, 1.0, 1, 1, 0)
		AttachEntityToEntity(radioProp, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.14, 0.01, -0.02, 110.0, 120.0, -15.0, 1, 0, 0, 0, 2, 1)

	else

		StopAnimTask(PlayerPedId(), "cellphone@", "cellphone_text_read_base", 1.0)
		ClearPedTasks(PlayerPedId())
		DeleteObject(radioProp)
		radioProp = 0

	end

end

function SelectFrequency()

    local input = lib.inputDialog(Radio.Lang["Menu_SelectFrequency_Title"], {Radio.Lang["Menu_SelectFrequency_Description"]})
 
    if not input then RadioAnim(false) end

    if tonumber(input[1]) then

        if tonumber(input[1]) > 100 then

            RadioAnim(false)

            lib.notify({
                title = Radio.Lang["Radio"],
                description = Radio.Lang["Crossed_Line"],
                type = 'warning'
            })

        else

            exports['pma-voice']:setVoiceProperty('radioEnabled', true)
            exports['pma-voice']:setVoiceProperty('micClicks', true)
            exports['pma-voice']:setRadioChannel(tonumber(input[1]))

            RadioAnim(false)

            TriggerEvent('Zoxe:Radio-Use', input[1], 0, Radio.Lang["Icon_Volume_Low"])

        end

    else

        RadioAnim(false)

        exports['pma-voice']:setVoiceProperty('radioEnabled', false)
        exports['pma-voice']:setVoiceProperty('micClicks', false)
        exports["pma-voice"]:SetRadioChannel(0)
        exports["pma-voice"]:removePlayerFromRadio()

        lib.notify({
            title = Radio.Lang["Radio"],
            description = Radio.Lang["Number_Only"],
            type = 'warning'
        })

    end  

end

function SelectVolume(frequency)

    local input = lib.inputDialog(Radio.Lang["Menu_SelectVolume_Title"], {Radio.Lang["Menu_SelectVolume_Description"]})
 
    if not input then RadioAnim(false) end

    if tonumber(input[1]) then

        if tonumber(input[1]) > 50 then

            exports['pma-voice']:setRadioVolume(tonumber(input[1]))

            RadioAnim(false)

            TriggerEvent('Zoxe:Radio-Use', frequency, input[1], Radio.Lang["Icon_Volume_Up"])

        elseif tonumber(input[1]) < 1 then

            exports['pma-voice']:setRadioVolume(tonumber(input[1]))

            RadioAnim(false)

            lib.notify({
                title = Radio.Lang["Radio"],
                description = Radio.Lang["Radio_Mute"],
                type = 'info'
            })

            TriggerEvent('Zoxe:Radio-Use', frequency, input[1], Radio.Lang["Icon_Volume_Mute"])

        else

            exports['pma-voice']:setRadioVolume(tonumber(input[1]))

            RadioAnim(false)
            
            TriggerEvent('Zoxe:Radio-Use', frequency, input[1], Radio.Lang["Icon_Volume_Low"])

        end

    else

        RadioAnim(false)

        lib.notify({
            title = Radio.Lang["Radio"],
            description = Radio.Lang["Number_Only"],
            type = 'warning'
        })

    end  

end

function Disconnect_Or_TurnOff(state)

    RadioAnim(false)

	if state then

		local id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))

		ESX.TriggerServerCallback('Zoxe:GetRadio', function(RadioChannel)
			if RadioChannel == 0 then
				lib.notify({
					title = Radio.Lang["Radio"],
					description = Radio.Lang["Not_Channel"],
					type = 'warning'
				})
			else
				lib.notify({
					title = Radio.Lang["Radio"],
					description = Radio.Lang["Disconnect_From_Channel"],
					type = 'warning'
				})
			end
		end, id)
	
	else

		lib.notify({
			title = Radio.Lang["Radio"],
			description = Radio.Lang["Turn_Off"],
			type = 'warning'
		})

	end

    exports['pma-voice']:setVoiceProperty('radioEnabled', false)
    exports['pma-voice']:setVoiceProperty('micClicks', false)
    exports["pma-voice"]:SetRadioChannel(0)
    exports["pma-voice"]:removePlayerFromRadio()

end