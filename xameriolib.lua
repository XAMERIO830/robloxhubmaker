𝘽𝙤𝙤𝙨𝙩𝙞𝙣𝙜 𝙩𝙝𝙚 𝙡𝙞𝙗𝙖𝙧𝙮
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/XAMERIO830/robloxhubmaker/main/mylib.lua"))()
𝘾𝙧𝙚𝙖𝙩𝙚𝙞𝙣𝙜 𝙒𝙞𝙣𝙙𝙤𝙬
local library = {}

function library:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")

    -- GUI Properties
    ScreenGui.Name = "XamerioHubUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    Frame.Name = "MainFrame"
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.3, 0, 0.2, 0)
    Frame.Size = UDim2.new(0, 400, 0, 300)
    Frame.Active = true

    Title.Name = "Title"
    Title.Parent = Frame
    Title.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Title.BorderSizePixel = 0
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Font = Enum.Font.SourceSansBold
    Title.Text = title or "Xamerio Hub"
    Title.TextColor3 = Color3.fromRGB(255, 0, 0)
    Title.TextSize = 20

    -- Dragging
    local UIS = game:GetService("UserInputService")
    local dragging = false
    local dragInput, dragStart, startPos

    Title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    return Frame
end

return library
