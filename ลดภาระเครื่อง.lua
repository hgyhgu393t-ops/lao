--[========================================================--
    Potato Graphics EX (Thai UI Edition) - Mobile Optimizer
    [FIXED VERSION]
--========================================================--

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- เธเนเธญเธเธเธฑเธเธฃเธฑเธเธเนเธณ
if CoreGui:FindFirstChild("PotatoOptimizerUI") then
    CoreGui.PotatoOptimizerUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PotatoOptimizerUI"
ScreenGui.ResetOnSpawn = false
pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not ScreenGui.Parent then
    ScreenGui.Parent = PlayerGui
end

-- 1. เธเนเธฒเธขเนเธชเธ”เธ FPS เธเธเธซเธเนเธฒเธเธญ (Top Center FPS Counter)
local FPSDisplay = Instance.new("TextLabel")
FPSDisplay.Name = "FPSDisplay"
FPSDisplay.Size = UDim2.new(0, 90, 0, 28)
FPSDisplay.Position = UDim2.new(0.5, -45, 0, 8)
FPSDisplay.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
FPSDisplay.BackgroundTransparency = 0.3
FPSDisplay.Text = "FPS: --"
FPSDisplay.TextColor3 = Color3.fromRGB(80, 255, 120)
FPSDisplay.TextSize = 13
FPSDisplay.Font = Enum.Font.GothamBold
FPSDisplay.Visible = false
FPSDisplay.Parent = ScreenGui

local FPSDisplayCorner = Instance.new("UICorner")
FPSDisplayCorner.CornerRadius = UDim.new(1, 0)
FPSDisplayCorner.Parent = FPSDisplay

local FPSDisplayStroke = Instance.new("UIStroke")
FPSDisplayStroke.Color = Color3.fromRGB(50, 50, 50)
FPSDisplayStroke.Thickness = 1
FPSDisplayStroke.Parent = FPSDisplay

-- เธเธณเธเธงเธ“เธเนเธฒ FPS เนเธเธเน€เธฃเธตเธขเธฅเนเธ—เธกเน
local frameCount = 0
local elapsed = 0
RunService.RenderStepped:Connect(function(dt)
    if FPSDisplay.Visible then
        frameCount = frameCount + 1
        elapsed = elapsed + dt
        if elapsed >= 0.5 then
            local currentFPS = math.floor(frameCount / elapsed + 0.5)
            FPSDisplay.Text = "FPS: " .. currentFPS
            if currentFPS >= 50 then
                FPSDisplay.TextColor3 = Color3.fromRGB(80, 255, 120)
            elseif currentFPS >= 25 then
                FPSDisplay.TextColor3 = Color3.fromRGB(255, 200, 50)
            else
                FPSDisplay.TextColor3 = Color3.fromRGB(255, 80, 80)
            end
            frameCount = 0
            elapsed = 0
        end
    end
end)

-- 2. เธเธธเนเธกเธฅเธญเธขเธงเธเธเธฅเธก (Draggable Floating Button)
local FloatingBtn = Instance.new("TextButton")
FloatingBtn.Name = "FloatingBtn"
FloatingBtn.Size = UDim2.new(0, 52, 0, 52)
FloatingBtn.Position = UDim2.new(0.88, 0, 0.2, 0)
FloatingBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
FloatingBtn.Text = "๐ฅ”"
FloatingBtn.TextSize = 22
FloatingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FloatingBtn.Parent = ScreenGui

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(1, 0)
BtnCorner.Parent = FloatingBtn

local BtnStroke = Instance.new("UIStroke")
BtnStroke.Color = Color3.fromRGB(80, 220, 120)
BtnStroke.Thickness = 2
BtnStroke.Parent = FloatingBtn

-- 3. เธซเธเนเธฒเธ•เนเธฒเธเน€เธกเธเธนเธซเธฅเธฑเธ (Main Frame) - เธเธขเธฒเธขเธเธงเธฒเธกเธชเธนเธเนเธซเนเธเธญเธ”เธตเธเธฑเธเน€เธกเธเธนเนเธซเธกเน
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 370)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -185)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(45, 45, 45)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

-- เธซเธฑเธงเธเนเธญเน€เธกเธเธน
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -40, 0, 50)
TitleLabel.Position = UDim2.new(0, 16, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "๐ฅ” เธฃเธฐเธเธเน€เธฃเนเธเธเธงเธฒเธกเธฅเธทเนเธ (Potato EX)"
TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
TitleLabel.TextSize = 15
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = MainFrame

-- เธเธธเนเธกเธเธดเธ”เน€เธกเธเธน (โ•)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -40, 0, 9)
CloseBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CloseBtn.Text = "โ•"
CloseBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseBtn

-- เน€เธชเนเธเธเธฑเนเธ
local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(1, -24, 0, 1)
Divider.Position = UDim2.new(0, 12, 0, 50)
Divider.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Divider.BorderSizePixel = 0
Divider.Parent = MainFrame

-- เธชเนเธงเธเธ—เธตเน 1: เนเธซเธกเธ”เธ”เธดเธเธเนเธณเธกเธฑเธ (Toggle Container)
local ToggleContainer = Instance.new("Frame")
ToggleContainer.Size = UDim2.new(1, -24, 0, 52)
ToggleContainer.Position = UDim2.new(0, 12, 0, 60)
ToggleContainer.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
ToggleContainer.Parent = MainFrame

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 10)
ToggleCorner.Parent = ToggleContainer

local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.Size = UDim2.new(0.7, 0, 1, 0)
ToggleLabel.Position = UDim2.new(0, 14, 0, 0)
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Text = "เนเธซเธกเธ”เธ เธฒเธเธ”เธดเธเธเนเธณเธกเธฑเธเธชเธนเธเธชเธธเธ”\n<font size='10' color='#888888'>เธฅเธเน€เธเธฒ/เน€เธ—เนเธเธเนเน€เธเธญเธฃเน/เน€เธญเธเน€เธเธเธ•เนเธซเธเธฑเธเน€เธเธฃเธทเนเธญเธ</font>"
ToggleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
ToggleLabel.TextSize = 12
ToggleLabel.RichText = true
ToggleLabel.Font = Enum.Font.GothamMedium
ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
ToggleLabel.Parent = ToggleContainer

local SwitchBtn = Instance.new("TextButton")
SwitchBtn.Size = UDim2.new(0, 48, 0, 26)
SwitchBtn.Position = UDim2.new(1, -58, 0.5, -13)
SwitchBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
SwitchBtn.Text = ""
SwitchBtn.Parent = ToggleContainer

local SwitchCorner = Instance.new("UICorner")
SwitchCorner.CornerRadius = UDim.new(1, 0)
SwitchCorner.Parent = SwitchBtn

local SwitchCircle = Instance.new("Frame")
SwitchCircle.Size = UDim2.new(0, 20, 0, 20)
SwitchCircle.Position = UDim2.new(0, 3, 0.5, -10)
SwitchCircle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
SwitchCircle.Parent = SwitchBtn

local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = SwitchCircle

-- เธชเนเธงเธเธ—เธตเน 2: เธฃเธฐเธเธเธเธณเธเธฑเธ”เน€เธเธฃเธกเน€เธฃเธ• (FPS Limit Container)
local FPSContainer = Instance.new("Frame")
FPSContainer.Size = UDim2.new(1, -24, 0, 88)
FPSContainer.Position = UDim2.new(0, 12, 0, 118)
FPSContainer.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
FPSContainer.Parent = MainFrame

local FPSCorner = Instance.new("UICorner")
FPSCorner.CornerRadius = UDim.new(0, 10)
FPSCorner.Parent = FPSContainer

local FPSLabel = Instance.new("TextLabel")
FPSLabel.Size = UDim2.new(1, -20, 0, 25)
FPSLabel.Position = UDim2.new(0, 14, 0, 6)
FPSLabel.BackgroundTransparency = 1
FPSLabel.Text = "เธเธณเธเธฑเธ”เน€เธเธฃเธกเน€เธฃเธ• (เธฅเธ”เธเธงเธฒเธกเธฃเนเธญเธ/เธเธฃเธฐเธซเธขเธฑเธ”เนเธเธ•)"
FPSLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
FPSLabel.TextSize = 12
FPSLabel.Font = Enum.Font.GothamMedium
FPSLabel.TextXAlignment = Enum.TextXAlignment.Left
FPSLabel.Parent = FPSContainer

-- เธเธธเนเธกเน€เธฅเธทเธญเธ FPS (Uncapped, 30 FPS, 60 FPS)
local btnWidth = 78
local btnY = 36
local btnHeight = 38

local fpsOffBtn = Instance.new("TextButton")
fpsOffBtn.Size = UDim2.new(0, btnWidth, 0, btnHeight)
fpsOffBtn.Position = UDim2.new(0, 14, 0, btnY)
fpsOffBtn.BackgroundColor3 = Color3.fromRGB(45, 180, 95)
fpsOffBtn.Text = "เนเธกเนเธเธณเธเธฑเธ”"
fpsOffBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsOffBtn.TextSize = 12
fpsOffBtn.Font = Enum.Font.GothamBold
fpsOffBtn.Parent = FPSContainer
local b1c = Instance.new("UICorner") b1c.CornerRadius = UDim.new(0, 8) b1c.Parent = fpsOffBtn

local fps30Btn = Instance.new("TextButton")
fps30Btn.Size = UDim2.new(0, btnWidth, 0, btnHeight)
fps30Btn.Position = UDim2.new(0, 98, 0, btnY)
fps30Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
fps30Btn.Text = "30 FPS"
fps30Btn.TextColor3 = Color3.fromRGB(180, 180, 180)
fps30Btn.TextSize = 12
fps30Btn.Font = Enum.Font.GothamBold
fps30Btn.Parent = FPSContainer
local b2c = Instance.new("UICorner") b2c.CornerRadius = UDim.new(0, 8) b2c.Parent = fps30Btn

local fps60Btn = Instance.new("TextButton")
fps60Btn.Size = UDim2.new(0, btnWidth, 0, btnHeight)
fps60Btn.Position = UDim2.new(0, 182, 0, btnY)
fps60Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
fps60Btn.Text = "60 FPS"
fps60Btn.TextColor3 = Color3.fromRGB(180, 180, 180)
fps60Btn.TextSize = 12
fps60Btn.Font = Enum.Font.GothamBold
fps60Btn.Parent = FPSContainer
local b3c = Instance.new("UICorner") b3c.CornerRadius = UDim.new(0, 8) b3c.Parent = fps60Btn

-- เธชเนเธงเธเธ—เธตเน 3: เน€เธกเธเธนเน€เธเธดเธ”/เธเธดเธ” เนเธชเธ”เธเธ•เธฑเธงเน€เธฅเธ FPS เธเธเธซเธเนเธฒเธเธญ
local ShowFPSContainer = Instance.new("Frame")
ShowFPSContainer.Size = UDim2.new(1, -24, 0, 52)
ShowFPSContainer.Position = UDim2.new(0, 12, 0, 212)
ShowFPSContainer.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
ShowFPSContainer.Parent = MainFrame

local ShowFPSCorner = Instance.new("UICorner")
ShowFPSCorner.CornerRadius = UDim.new(0, 10)
ShowFPSCorner.Parent = ShowFPSContainer

local ShowFPSLabel = Instance.new("TextLabel")
ShowFPSLabel.Size = UDim2.new(0.7, 0, 1, 0)
ShowFPSLabel.Position = UDim2.new(0, 14, 0, 0)
ShowFPSLabel.BackgroundTransparency = 1
ShowFPSLabel.Text = "เนเธชเธ”เธเธ•เธฑเธงเน€เธฅเธ FPS เธเธเธเธญ\n<font size='10' color='#888888'>เธเธญเธเน€เธเธฃเธกเน€เธฃเธ•เนเธเธเน€เธฃเธตเธขเธฅเนเธ—เธกเนเธ”เนเธฒเธเธเธเธเธญ</font>"
ShowFPSLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
ShowFPSLabel.TextSize = 12
ShowFPSLabel.RichText = true
ShowFPSLabel.Font = Enum.Font.GothamMedium
ShowFPSLabel.TextXAlignment = Enum.TextXAlignment.Left
ShowFPSLabel.Parent = ShowFPSContainer

local ShowFPSSwitchBtn = Instance.new("TextButton")
ShowFPSSwitchBtn.Size = UDim2.new(0, 48, 0, 26)
ShowFPSSwitchBtn.Position = UDim2.new(1, -58, 0.5, -13)
ShowFPSSwitchBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ShowFPSSwitchBtn.Text = ""
ShowFPSSwitchBtn.Parent = ShowFPSContainer

local ShowFPSSwitchCorner = Instance.new("UICorner")
ShowFPSSwitchCorner.CornerRadius = UDim.new(1, 0)
ShowFPSSwitchCorner.Parent = ShowFPSSwitchBtn

local ShowFPSSwitchCircle = Instance.new("Frame")
ShowFPSSwitchCircle.Size = UDim2.new(0, 20, 0, 20)
ShowFPSSwitchCircle.Position = UDim2.new(0, 3, 0.5, -10)
ShowFPSSwitchCircle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
ShowFPSSwitchCircle.Parent = ShowFPSSwitchBtn

local ShowFPSCircleCorner = Instance.new("UICorner")
ShowFPSCircleCorner.CornerRadius = UDim.new(1, 0)
ShowFPSCircleCorner.Parent = ShowFPSSwitchCircle

-- เธเนเธฒเธขเนเธชเธ”เธเธชเธ–เธฒเธเธฐ (Status Bar)
local StatusContainer = Instance.new("Frame")
StatusContainer.Size = UDim2.new(1, -24, 0, 42)
StatusContainer.Position = UDim2.new(0, 12, 0, 270)
StatusContainer.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
StatusContainer.Parent = MainFrame

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 8)
StatusCorner.Parent = StatusContainer

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -20, 1, 0)
StatusLabel.Position = UDim2.new(0, 10, 0, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "เธชเธ–เธฒเธเธฐ: เธเธฃเนเธญเธกเนเธเนเธเธฒเธ (เธเธ”เน€เธเธดเธ”เนเธเนเธเธฒเธเนเธ”เนเน€เธฅเธข)"
StatusLabel.TextColor3 = Color3.fromRGB(140, 140, 140)
StatusLabel.TextSize = 11
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = StatusContainer

-- ===================== [FIX 2 + 3] เธฃเธฐเธเธเธฅเธฒเธเธเธธเนเธกเธฅเธญเธข =====================
-- เนเธเนเธเธฑเนเธ: (2) เธฅเธฒเธเธเธธเนเธกเนเธฅเนเธงเน€เธกเธเธนเน€เธเธดเธ”เน€เธญเธเน€เธเธฃเธฒเธฐเนเธกเนเน€เธเนเธเธฃเธฐเธขเธฐเธฅเธฒเธ
--         (3) เธชเธฃเนเธฒเธ input.Changed connection เนเธซเธกเนเธ—เธธเธเธเธฃเธฑเนเธเนเธ”เธขเนเธกเน disconnect เธ•เธฑเธงเน€เธเนเธฒ (memory leak)
local dragging = false
local dragMoved = false
local dragStart, startPos
local dragInputChangedConn -- เน€เธเนเธ connection เนเธงเนเน€เธเธทเนเธญ disconnect เธเนเธญเธเธชเธฃเนเธฒเธเนเธซเธกเน
local DRAG_THRESHOLD = 5 -- เธเธดเธเน€เธเธฅ: เธ–เนเธฒเธเธขเธฑเธเน€เธเธดเธเธเธตเนเธ–เธทเธญเธงเนเธฒเน€เธเนเธเธเธฒเธฃเธฅเธฒเธ เนเธกเนเนเธเนเธเธฒเธฃเธเธ”

FloatingBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragMoved = false
        dragStart = input.Position
        startPos = FloatingBtn.Position

        -- [FIX 3] disconnect connection เน€เธเนเธฒเธเนเธญเธเธชเธฃเนเธฒเธเนเธซเธกเน เธเนเธญเธเธเธฑเธ connection เธเนเธฒเธ
        if dragInputChangedConn then
            dragInputChangedConn:Disconnect()
            dragInputChangedConn = nil
        end

        dragInputChangedConn = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                if dragInputChangedConn then
                    dragInputChangedConn:Disconnect()
                    dragInputChangedConn = nil
                end
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        if delta.Magnitude > DRAG_THRESHOLD then
            dragMoved = true
        end
        FloatingBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

FloatingBtn.MouseButton1Click:Connect(function()
    -- [FIX 2] เธ–เนเธฒเน€เธเธดเนเธเธฅเธฒเธเธกเธฒ (dragMoved = true) เธเธฐเนเธกเน toggle เน€เธกเธเธน
    if not dragMoved then
        MainFrame.Visible = not MainFrame.Visible
    end
    dragMoved = false
end)

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- เธเธฑเธเธเนเธเธฑเธเธเธณเธเธฑเธ” FPS
local function setFPS(limit)
    pcall(function()
        if setfpscap then
            setfpscap(limit)
        end
    end)
end

fpsOffBtn.MouseButton1Click:Connect(function()
    setFPS(999)
    fpsOffBtn.BackgroundColor3 = Color3.fromRGB(45, 180, 95)
    fpsOffBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    fps30Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    fps30Btn.TextColor3 = Color3.fromRGB(180, 180, 180)
    fps60Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    fps60Btn.TextColor3 = Color3.fromRGB(180, 180, 180)
end)

fps30Btn.MouseButton1Click:Connect(function()
    setFPS(30)
    fps30Btn.BackgroundColor3 = Color3.fromRGB(45, 180, 95)
    fps30Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    fpsOffBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    fpsOffBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    fps60Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    fps60Btn.TextColor3 = Color3.fromRGB(180, 180, 180)
end)

fps60Btn.MouseButton1Click:Connect(function()
    setFPS(60)
    fps60Btn.BackgroundColor3 = Color3.fromRGB(45, 180, 95)
    fps60Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    fpsOffBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    fpsOffBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    fps30Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    fps30Btn.TextColor3 = Color3.fromRGB(180, 180, 180)
end)

-- เธเธงเธเธเธธเธกเธชเธงเธดเธ•เธเนเน€เธเธดเธ”/เธเธดเธ” เนเธชเธ”เธเธ•เธฑเธงเน€เธฅเธ FPS
local showFPSState = false
ShowFPSSwitchBtn.MouseButton1Click:Connect(function()
    showFPSState = not showFPSState
    if showFPSState then
        ShowFPSSwitchBtn.BackgroundColor3 = Color3.fromRGB(45, 180, 95)
        ShowFPSSwitchCircle:TweenPosition(UDim2.new(1, -23, 0.5, -10), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
        FPSDisplay.Visible = true
        StatusLabel.Text = "เธชเธ–เธฒเธเธฐ: เน€เธเธดเธ”เนเธชเธ”เธเธ•เธฑเธงเน€เธฅเธ FPS เธเธเธซเธเนเธฒเธเธญเนเธฅเนเธง"
        StatusLabel.TextColor3 = Color3.fromRGB(100, 230, 130)
    else
        ShowFPSSwitchBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        ShowFPSSwitchCircle:TweenPosition(UDim2.new(0, 3, 0.5, -10), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
        FPSDisplay.Visible = false
        StatusLabel.Text = "เธชเธ–เธฒเธเธฐ: เธเธดเธ”เธเธฒเธฃเนเธชเธ”เธเธ•เธฑเธงเน€เธฅเธ FPS"
        StatusLabel.TextColor3 = Color3.fromRGB(140, 140, 140)
    end
end)

-- ===================== [FIX 1] เธเธฑเธเธเนเธเธฑเธเธเธฒเธฃเธ—เธณเธเธฒเธเธซเธฅเธฑเธ: เนเธซเธกเธ”เธ”เธดเธเธเนเธณเธกเธฑเธเธชเธนเธเธชเธธเธ” =====================
-- เนเธเนเธเธฑเนเธ: MeshPart:IsA("BasePart") เน€เธเนเธ true เน€เธชเธกเธญ เธ—เธณเนเธซเน branch elseif obj:IsA("MeshPart")
-- เนเธกเนเน€เธเธขเธ–เธนเธเน€เธฃเธตเธขเธ (TextureID เนเธกเนเน€เธเธขเธ–เธนเธเธฅเนเธฒเธ) -> เธ•เนเธญเธเน€เธเนเธ MeshPart เธเนเธญเธ BasePart
local isOptimizing = false
local connection

local function optimizePart(obj)
    if obj:IsA("MeshPart") then
        -- เธ•เนเธญเธเน€เธเนเธเธเนเธญเธ BasePart เน€เธเธฃเธฒเธฐ MeshPart เน€เธเนเธเธเธฑเธเธเธฅเธฒเธชเธเธญเธ BasePart
        obj.Material = Enum.Material.SmoothPlastic
        obj.TextureID = ""
        obj.Reflectance = 0
        obj.CastShadow = false
    elseif obj:IsA("BasePart") then
        obj.Material = Enum.Material.SmoothPlastic
        obj.Reflectance = 0
        obj.CastShadow = false
    elseif obj:IsA("Decal") or obj:IsA("Texture") then
        obj:Destroy()
    elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") or obj:IsA("Explosion") then
        obj:Destroy()
    end
end

local function applyOptimization()
    isOptimizing = true

    pcall(function()
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        Lighting.Brightness = 1
        for _, v in ipairs(Lighting:GetChildren()) do
            if v:IsA("PostEffect") or v:IsA("Atmosphere") or v:IsA("Sky") or v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("BloomEffect") then
                v:Destroy()
            end
        end
    end)

    pcall(function()
        if Terrain then
            Terrain.WaterWaveSize = 0
            Terrain.WaterWaveSpeed = 0
            Terrain.WaterTransparency = 0
            Terrain.WaterReflectance = 0
            Terrain.Decoration = false
        end
    end)

    for _, obj in ipairs(workspace:GetDescendants()) do
        pcall(function()
            optimizePart(obj)
        end)
    end

    -- [FIX] disconnect connection เน€เธเนเธฒเธเนเธญเธ (เธเธฑเธเธเธ”เน€เธเธดเธ”/เธเธดเธ”เธชเธฅเธฑเธเธเธฑเธเธซเธฅเธฒเธขเธฃเธญเธเนเธฅเนเธงเน€เธเธดเธ” connection เธเนเธญเธ)
    if connection then
        connection:Disconnect()
        connection = nil
    end

    connection = workspace.DescendantAdded:Connect(function(obj)
        if isOptimizing then
            pcall(function()
                optimizePart(obj)
            end)
        end
    end)
end

local function removeOptimization()
    isOptimizing = false
    if connection then
        connection:Disconnect()
        connection = nil
    end
end

-- เธเธงเธเธเธธเธกเธชเธงเธดเธ•เธเนเน€เธเธดเธ”/เธเธดเธ” เนเธซเธกเธ”เธ”เธดเธเธเนเธณเธกเธฑเธ
local switchState = false
SwitchBtn.MouseButton1Click:Connect(function()
    switchState = not switchState
    if switchState then
        SwitchBtn.BackgroundColor3 = Color3.fromRGB(45, 180, 95)
        SwitchCircle:TweenPosition(UDim2.new(1, -23, 0.5, -10), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
        StatusLabel.Text = "เธชเธ–เธฒเธเธฐ: เน€เธเธดเธ”เนเธซเธกเธ”เธ”เธดเธเธเนเธณเธกเธฑเธเธชเธนเธเธชเธธเธ”เนเธฅเนเธง (เธฅเธทเนเธเธชเธธเธ”เน)"
        StatusLabel.TextColor3 = Color3.fromRGB(100, 230, 130)
        applyOptimization()
    else
        SwitchBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        SwitchCircle:TweenPosition(UDim2.new(0, 3, 0.5, -10), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
        StatusLabel.Text = "เธชเธ–เธฒเธเธฐ: เธเธดเธ”เธเธฒเธฃเธ—เธณเธเธฒเธเนเธซเธกเธ”เธ”เธดเธเธเนเธณเธกเธฑเธ"
        StatusLabel.TextColor3 = Color3.fromRGB(140, 140, 140)
        removeOptimization()
    end
end)
