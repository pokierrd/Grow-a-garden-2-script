-- Grow a Garden 2 HUB | Made by Astral Server
-- Key System GUI

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local KEY_LINK = "[https://bloxlink.cl/verify?server=7909350808985517]"
local VALID_KEYS = {"Buttercupsquishy"} -- you can replace with your own key list or webhook check

if player.PlayerGui:FindFirstChild("AstralKeyUI") then
    player.PlayerGui.AstralKeyUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AstralKeyUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 420, 0, 230)
Main.Position = UDim2.new(0.5, -210, 0.5, -115)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(80, 200, 120)
Stroke.Thickness = 1.5
Stroke.Parent = Main

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "GROW A GARDEN 2 HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.Parent = Main

local SubTitle = Instance.new("TextLabel")
SubTitle.Name = "SubTitle"
SubTitle.Size = UDim2.new(1, 0, 0, 20)
SubTitle.Position = UDim2.new(0, 0, 0, 32)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "made by Astral Server"
SubTitle.TextColor3 = Color3.fromRGB(150, 150, 150)
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextSize = 13
SubTitle.Parent = Main

local KeyBox = Instance.new("TextBox")
KeyBox.Name = "KeyBox"
KeyBox.Size = UDim2.new(1, -40, 0, 40)
KeyBox.Position = UDim2.new(0, 20, 0, 70)
KeyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.PlaceholderText = "Enter your key here..."
KeyBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 14
KeyBox.ClearTextOnFocus = false
KeyBox.Parent = Main

local KeyBoxCorner = Instance.new("UICorner")
KeyBoxCorner.CornerRadius = UDim.new(0, 8)
KeyBoxCorner.Parent = KeyBox

local Status = Instance.new("TextLabel")
Status.Name = "Status"
Status.Size = UDim2.new(1, -40, 0, 20)
Status.Position = UDim2.new(0, 20, 0, 115)
Status.BackgroundTransparency = 1
Status.Text = ""
Status.TextColor3 = Color3.fromRGB(255, 80, 80)
Status.Font = Enum.Font.Gotham
Status.TextSize = 13
Status.Parent = Main

local CheckKeyBtn = Instance.new("TextButton")
CheckKeyBtn.Name = "CheckKeyBtn"
CheckKeyBtn.Size = UDim2.new(0.46, 0, 0, 45)
CheckKeyBtn.Position = UDim2.new(0, 20, 0, 150)
CheckKeyBtn.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
CheckKeyBtn.Text = "Check Key"
CheckKeyBtn.TextColor3 = Color3.fromRGB(15, 15, 15)
CheckKeyBtn.Font = Enum.Font.GothamBold
CheckKeyBtn.TextSize = 15
CheckKeyBtn.AutoButtonColor = false
CheckKeyBtn.Parent = Main

local CheckCorner = Instance.new("UICorner")
CheckCorner.CornerRadius = UDim.new(0, 8)
CheckCorner.Parent = CheckKeyBtn

local CopyLinkBtn = Instance.new("TextButton")
CopyLinkBtn.Name = "CopyLinkBtn"
CopyLinkBtn.Size = UDim2.new(0.46, 0, 0, 45)
CopyLinkBtn.Position = UDim2.new(0.54, 0, 0, 150)
CopyLinkBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
CopyLinkBtn.Text = "Copy Link"
CopyLinkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyLinkBtn.Font = Enum.Font.GothamBold
CopyLinkBtn.TextSize = 15
CopyLinkBtn.AutoButtonColor = false
CopyLinkBtn.Parent = Main

local CopyCorner = Instance.new("UICorner")
CopyCorner.CornerRadius = UDim.new(0, 8)
CopyCorner.Parent = CopyLinkBtn

local CopyStroke = Instance.new("UIStroke")
CopyStroke.Color = Color3.fromRGB(80, 200, 120)
CopyStroke.Thickness = 1
CopyStroke.Parent = CopyLinkBtn

local function hoverEffect(button, hoverColor, normalColor)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = normalColor}):Play()
    end)
end

hoverEffect(CheckKeyBtn, Color3.fromRGB(100, 220, 140), Color3.fromRGB(80, 200, 120))
hoverEffect(CopyLinkBtn, Color3.fromRGB(55, 55, 60), Color3.fromRGB(40, 40, 45))

local function isValidKey(inputKey)
    for _, validKey in ipairs(VALID_KEYS) do
        if inputKey == validKey then
            return true
        end
    end
    return false
end

CheckKeyBtn.MouseButton1Click:Connect(function()
    local enteredKey = KeyBox.Text

    if enteredKey == "" then
        Status.Text = "Please enter a key first."
        Status.TextColor3 = Color3.fromRGB(255, 80, 80)
        return
    end

    if isValidKey(enteredKey) then
        Status.Text = "Key valid! Loading hub..."
        Status.TextColor3 = Color3.fromRGB(80, 220, 120)

        task.wait(1)
        ScreenGui:Destroy()

        -- >> Put your main hub script / loadstring call here <<
        -- loadstring(game:HttpGet("YOUR_MAIN_SCRIPT_LINK"))()
    else
        Status.Text = "Invalid key. Try again."
        Status.TextColor3 = Color3.fromRGB(255, 80, 80)
    end
end)

CopyLinkBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(KEY_LINK)
        Status.Text = "Link copied to clipboard!"
        Status.TextColor3 = Color3.fromRGB(80, 220, 120)
    else
        Status.Text = "Clipboard not supported on this executor."
        Status.TextColor3 = Color3.fromRGB(255, 80, 80)
    end
end)

local dragging, dragInput, dragStart, startPos

Main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Main.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
