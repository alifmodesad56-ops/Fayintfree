print("FAYINTXCODE HUB LOADED")

game.StarterGui:SetCore("SendNotification", {
    Title = "FayintxCode Hub";
    Text = "Script aktif!";
    Duration = 5;
})
-- FayintxCode UI Loader (Delta Android Safe)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FayintxCodeLoader"
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 300, 0, 180)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 12)

-- Title
local Title = Instance.new("TextLabel", Frame)
Title.Text = "FayintxCode Loader"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

-- Button
local Button = Instance.new("TextButton", Frame)
Button.Position = UDim2.new(0.1, 0, 0.5, 0)
Button.Size = UDim2.new(0.8, 0, 0, 45)
Button.Text = "LOAD SCRIPT"
Button.Font = Enum.Font.GothamBold
Button.TextSize = 16
Button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)

local BtnCorner = Instance.new("UICorner", Button)
BtnCorner.CornerRadius = UDim.new(0, 10)

-- Script Link (EDIT INI)
local SCRIPT_URL = "https://raw.githubusercontent.com/alifmodesad56-ops/Fayintfree/main/main.lua"

Button.MouseButton1Click:Connect(function()
    Button.Text = "LOADING..."
    pcall(function()
        loadstring(game:HttpGet(SCRIPT_URL))()
    end)
    ScreenGui:Destroy()
end)
