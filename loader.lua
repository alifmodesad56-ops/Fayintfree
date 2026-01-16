--====================================
-- FayintxCode | Template + Key System
--====================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")

-- ===============================
-- 🔑 KEY SYSTEM
-- ===============================
local VALID_KEYS = {
    "FAYINT-1234",
    "FAYINT-5678",
    "FAYINT-9999",
}

local function checkKey(userKey)
    for _, key in pairs(VALID_KEYS) do
        if key == userKey then
            return true
        end
    end
    return false
end

-- Simple input dialog for key
local userKey = nil
repeat
    if not game:GetService("Players").LocalPlayer then wait() end
    userKey = game:GetService("Players").LocalPlayer:PromptInput("Enter FayintxCode Key", "Type your key here")
    if userKey == nil then
        warn("User cancelled key input")
        return
    end
until checkKey(userKey)

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
    Author = "Template + Key System",
    Folder = "FAYINTXCODE",
    Size = UDim2.fromOffset(260, 300),
    Theme = "Crimson",
    Transparent = true,
    SideBarWidth = 160,
})

Window:EditOpenButton({
    Title = "FayintxCode",
    Icon = "bot-message-square",
    OnlyMobile = true,
    Enabled = true,
    Draggable = true,
})

Window:Tag({
    Title = "v0.0.1 TEMPLATE",
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
    Desc = "Template dengan Key System",
})

InfoTab:Paragraph({
    Title = "User",
    Desc = string.format(
        "Name: %s\nUserId: %s\nKey: %s",
        LocalPlayer.Name,
        LocalPlayer.UserId,
        userKey
    )
})

-- ===============================
-- MAIN TAB
-- ===============================
local MainTab = Window:Tab({
    Title = "Main",
    Icon = "star",
})

MainTab:Paragraph({
    Title = "Main Features",
    Desc = "Klik tombol di bawah untuk load script",
})

-- ===============================
-- LOAD EXTERNAL SCRIPT
-- ===============================
local SCRIPT_URL = "https://raw.githubusercontent.com/alifmodesad56-ops/Fayintfree/main/loader.lua"

MainTab:Button({
    Title = "Load External Script",
    Desc = "Load script dari GitHub",
    Callback = function()
        WindUI:Notify({
            Title = "FayintxCode",
            Content = "Loading script...",
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
    Content = "Template + Key System Loaded Successfully!",
    Duration = 3,
    Icon = "check",
})
