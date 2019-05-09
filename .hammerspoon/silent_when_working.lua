wifiWatcher = nil
workSSID = "MY-WORK-WIFI"
lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if newSSID == workSSID and lastSSID ~= workSSID and not hs.audiodevice.defaultOutputDevice():jackConnected() then
        -- We just joined our work WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(0)
    elseif newSSID ~= homeSSID and lastSSID == homeSSID and not hs.audiodevice.defaultOutputDevice():jackConnected() then
        -- We just departed our work WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(25)
    end

    lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()
