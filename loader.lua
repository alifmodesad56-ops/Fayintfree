--====================================
-- FayintxCode | Ronix Ready (No Key)
-- Features lengkap
--====================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- ===============================
-- LOAD WindUI (RAW link)
-- ===============================
local success, WindUI = pcall(function()
    return loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/Footagesus/WindUI/main/main.lua"
    ))()
end)

if not success or not WindUI then
    warn("WindUI failed to load")
    return
end

-- ===============================
-- CREATE WINDOW
-- ===============================
local Window = WindUI:CreateWindow({
    Title = "FayintxCode",
    Author = "Ronix Ready",
    Folder = "FAYINTXCODE",
    Size = UDim2.fromOffset(280, 350),
    Theme = "Crimson",
    Transparent = true,
    SideBarWidth = 160,
})

Window:EditOpenButton({
    Title = "FayintxCode",
    Icon = "bot-message-square",
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

Window:Tag({
    Title = "v0.0.4 RONIX",
    Color = Color3.fromRGB(255,255,255),
    Radius = 15,
})

-- ===============================
-- INFO TAB
-- ===============================
local InfoTab = Window:Tab({
    Title = "Info",
    Icon = "info",
})

InfoTab:Paragraph({
    Title = "FayintxCode",
    Desc = "No Key | Ronix-ready template",
})

InfoTab:Paragraph({
    Title = "User Info",
    Desc = string.format(
        "Name: %s\nUserId: %s",
        LocalPlayer.Name,
        LocalPlayer.UserId
    )
})

-- ===============================
-- MAIN TAB (Fitur Fishing / etc)
-- ===============================
local MainTab = Window:Tab({
    Title = "Main",
    Icon = "star",
})

MainTab:Paragraph({
    Title = "Features",
    Desc = "- Fish Spawner\n- Fish Caught\n- Fish Notifications\n- Blatant X7 Mode\n- Auto Perfection",
    TextSize = 15,
})

-- Dummy config / state
local config = {blatant=false, cancelDelay=1.6, completeDelay=0.37, autoPerfect=false}

-- ===============================
-- Toggle Blatant X7
-- ===============================
MainTab:Toggle({
    Title = "Blatant X7",
    Value = config.blatant,
    Callback = function(v)
        config.blatant = v
        print("Blatant X7: "..tostring(v))
    end
})

-- ===============================
-- Cancel Delay input
-- ===============================
MainTab:Input({
    Title = "Cancel Delay",
    Placeholder = "1.6",
    Default = tostring(config.cancelDelay),
    Callback = function(v)
        local n = tonumber(v)
        if n then config.cancelDelay = n end
    end
})

-- ===============================
-- Complete Delay input
-- ===============================
MainTab:Input({
    Title = "Complete Delay",
    Placeholder = "0.37",
    Default = tostring(config.completeDelay),
    Callback = function(v)
        local n = tonumber(v)
        if n then config.completeDelay = n end
    end
})

-- ===============================
-- Toggle Auto Perfection
-- ===============================
MainTab:Toggle({
    Title = "Auto Perfection",
    Value = config.autoPerfect,
    Callback = function(v)
        config.autoPerfect = v
        print("Auto Perfection: "..tostring(v))
    end
})

-- ===============================
-- Load External Script (loader.lua)
-- ===============================
local SCRIPT_URL = "https://raw.githubusercontent.com/alifmodesad56-ops/Fayintfree/main/loader.lua"

MainTab:Button({
    Title = "Load External Script",
    Desc = "Load loader.lua from GitHub",
    Callback = function()
        WindUI:Notify({
            Title = "Loading",
            Content = "Loading external script...",
            Duration = 2
        })

        local ok, err = pcall(function()
            loadstring(game:HttpGet(SCRIPT_URL))()
        end)

        if not ok then
            WindUI:Notify({
                Title = "Error",
                Content = tostring(err),
                Duration = 4
            })
        end
    end
})

-- ===============================
-- Notify Loaded
-- ===============================
WindUI:Notify({
    Title = "FayintxCode",
    Content = "Ronix-ready No Key Template loaded successfully!",
    Duration = 3,
    Icon = "check",
})
