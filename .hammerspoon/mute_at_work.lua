wifiWatcher = nil
workSSID = "WORK-SSID"
lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if newSSID == workSSID and lastSSID ~= workSSID and not hs.audiodevice.findOutputByName("External Headphones") then
        -- We just joined work WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(0)
    elseif newSSID ~= workSSID and lastSSID == workSSID then
        -- We just departed work WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(25)
    end

    lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()
