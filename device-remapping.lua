-- minimize this lua script to tray as it runs
lmc.minimizeToTray = true
lmc_minimize()

-- set the device name and id
lmc_device_set_name('streamdeck','2265F452')

sendToAHK = function (key)
    print('It was assigned string:    ' .. key)

    -- change the Users folder to the current user.
    local file = io.open("C:\\Users\\anaro\\Documents\\keypressed.txt", "w")

    file:write(key)
    file:flush()
    file:close()

    -- use the F24 key to trigger AutoHotkey
    lmc_send_keys('{F24}')
end

-- set keypad button names via their event id
local config = {
    [27] = "escape",
    [183] = "calc",
    [9] = "tab",
    [187] = "equals",
    -- [144] = "numLock",
    [111] = "slash",
    [106] = "asterisk",
    [8] = "backspace",
    [103] = "num7",
    [104] = "num8",
    [105] = "num9",
    [109] = "minus",
    [100] = "num4",
    [101] = "num5",
    [102] = "num6",
    [107] = "plus",
    [97]  = "num1",
    [98]  = "num2",
    [99]  = "num3",
    [13] = "enter",
    [96] = "num0",
    [110] = "period",
}

-- define callback for whole device
lmc_set_handler('streamdeck', function(button, direction)
    if (direction == 1) then return end

    if type(config[button]) == "string" then
        print(' ')
        print('Your key ID number is:   ' .. button)
        sendToAHK(config[button])
    else
        print(' ')
        print('Not yet assigned: ' .. button)
    end
end)
