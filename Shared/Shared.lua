Radio = {}

Radio.Item = {

    UseItem = true, -- Choose true to enable the use of the item radio or false to disable it
    ItemName = 'radio', -- Enter the name of your item if you have enabled true above

}

Radio.Command = {

    UseCommand = false, -- Choose true to enable the use of the command radio or false to disable it
    CommandName = 'radio',  -- Enter the name of your command if you have enabled true above

}

Radio.Lang = {

    --Menu Main
    ["Menu_Title"] = 'Radio Menu',

    ["Title_Frequency"] = 'Frequency',
    ["Description_Frequency"] = 'Current Frequency: ',
    ["Icon_Frequency"] = 'walkie-talkie',

    ["Title_Volume"] = 'Volume',
    ["Description_Volume"] = 'Current Volume: ',
    ["Icon_Volume_Off"] = 'volume-off',

    ["Title_Disconnect"] = 'Disconnect Channel',
    ["Icon_Disconnect"] = 'right-from-bracket',

    ["Title_PowerOff"] = 'Power Off',
    ["Icon_PowerOff"] = 'power-off',

    --Menu Select Frequency
    ["Menu_SelectFrequency_Title"] = 'Select The Frequency',
    ["Menu_SelectFrequency_Description"] = '0 - 100 Hz',

    --Menu Select Volume
    ["Menu_SelectVolume_Title"] = 'Select The Volume',
    ["Menu_SelectVolume_Description"] = '0 - 100 %',

    --Icons Status Volume
    ["Icon_Volume_Low"] = 'volume-low',
    ["Icon_Volume_Up"] = 'volume-up',
    ["Icon_Volume_Mute"] = 'volume-xmark',

    --Notify 
    ["Radio"] = 'Radio',

    ["Crossed_Line"] = 'You\'ve crossed the line.',

    ["Number_Only"] = 'You\'ve can only enter numbers.',

    ["Radio_Mute"] = 'You\'ve muted the radio!',

    ["Not_Channel"] = 'You are not in any channel!',

    ["Disconnect_From_Channel"] = 'You have been disconnected from the channel.',

    ["Turn_Off"] = 'You turned off the radio.',

    --Off Volume And Frequency
    ["Frequency_Off"] = '0 (OFF)',
    ["Volume_Off"] = '0 (OFF)',

}