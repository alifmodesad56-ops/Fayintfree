--====================================
-- FayintxCode | Ronix Ready Template
--====================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")

-- 🔑 VALID KEYS
local VALID_KEYS = {
    "FAYINT-1234",
    "FAYINT-5678",
    "FAYINT-9999",
}

-- FUNCTION CHECK KEY
local function checkKey(userKey)
    for _, key in pairs(VALID_KEYS) do
        if key == userKey then
            return true
        end
    end
    return false
end

-- ===============================
-- INPUT KEY VIA PROMPT
-- ===============================
local userKey = nil
repeat
    userKey = LocalPlayer:PromptInput("Enter FayintxCode Key", "Type your key here")
    if not userKey then
        warn("User cancelled key input")
        return
    end
until checkKey(userKey)

print("Key valid! Loading script...")

-- ===============================
-- LOAD WindUI
-- ===============================
local success, WindUI = pcall(function()
    return loadstring(game:HttpGet(
        "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
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
    Author = "Ronix Template",
    Folder = "FAYINTXCODE",
    Size = UDim2.fromOffset(260, 300),
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
    Title = "v0.0.3 RONIX",
    Color = Color3.fromRGB(255,255,255),
    Radius = 15,
})

-- ===============================
-- MAIN TAB (Load External Script)
-- ===============================
local MainTab = Window:Tab({
    Title = "Main",
    Icon = "star",
})

local SCRIPT_URL = "https://raw.githubusercontent.com/alifmodesad56-ops/Fayintfree/main/loader.lua"

MainTab:Button({
    Title = "Load External Script",
    Desc = "Load script from GitHub",
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
-- NOTIFY LOAD
-- ===============================
WindUI:Notify({
    Title = "FayintxCode",
    Content = "Ronix template loaded successfully!",
    Duration = 3,
    Icon = "check",
})
