--====================================
-- FayintxCode | EMPTY TEMPLATE
-- UI Only • Safe • Delta Android
--====================================

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Load WindUI
local success, WindUI = pcall(function()
    return loadstring(game:HttpGet(
        "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
    ))()
end)

if not success or not WindUI then
    warn("WindUI failed to load")
    return
end

-- Create Window
local Window = WindUI:CreateWindow({
    Title = "FayintxCode",
    Author = "Template",
    Folder = "FAYINTXCODE",
    Size = UDim2.fromOffset(260, 300),
    Theme = "Crimson",
    Transparent = true,
    SideBarWidth = 160,
})

-- Open Button (Mobile Friendly)
Window:EditOpenButton({
    Title = "FayintxCode",
    Icon = "bot-message-square",
    OnlyMobile = true,
    Enabled = true,
    Draggable = true,
})

-- Version Tag
Window:Tag({
    Title = "v0.0.1 TEMPLATE",
    Color = Color3.fromRGB(255,255,255),
    Radius = 15,
})

--========================
-- INFO TAB
--========================
local InfoTab = Window:Tab({
    Title = "Info",
    Icon = "info",
})

InfoTab:Paragraph({
    Title = "FayintxCode",
    Desc = "Template kosong\nSiap dikembangkan",
})

InfoTab:Paragraph({
    Title = "User",
    Desc = string.format(
        "Name: %s\nUserId: %s",
        LocalPlayer.Name,
        LocalPlayer.UserId
    )
})

InfoTab:Divider()

--========================
-- MAIN TAB (KOSONG)
--========================
local MainTab = Window:Tab({
    Title = "Main",
    Icon = "star",
})

MainTab:Paragraph({
    Title = "Main Features",
    Desc = "Belum ada fitur.\nTambahkan toggle / button di sini.",
})

-- CONTOH TOGGLE (TEST)
local exampleToggle = false

MainTab:Toggle({
    Title = "Example Toggle",
    Value = false,
    Callback = function(v)
        exampleToggle = v
        if v then
            WindUI:Notify({
                Title = "Toggle",
                Content = "Example Toggle ON",
                Duration = 2
            })
        else
            WindUI:Notify({
                Title = "Toggle",
                Content = "Example Toggle OFF",
                Duration = 2
            })
        end
    end
})

--========================
-- NOTIFY LOAD
--========================
WindUI:Notify({
    Title = "FayintxCode",
    Content = "Template loaded successfully!",
    Duration = 3,
    Icon = "check",
})
