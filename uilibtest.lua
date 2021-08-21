local Library = {}

local LibName = tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100))

function Library:UI()
    game.CoreGui[LibName].Enabled = not game.CoreGui[LibName].Enabled
end

function Library:CreateWindow(title)
    title = title or "Library"
    
    local UILIB = Instance.new("ScreenGui")
    local Dragify = Instance.new("Frame")
    local Main = Instance.new("Frame")
    local TopBar = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Arrow = Instance.new("TextButton")
    local SecondMain = Instance.new("Frame")
    local MainScroll = Instance.new("ScrollingFrame")
    local ContainerLayout = Instance.new("UIListLayout")

    UILIB.Name = LibName
    UILIB.Parent = game.CoreGui
    UILIB.ResetOnSpawn = false
	
	function dragify(Frame)
		dragToggle = nil
		dragSpeed = .01
		dragInput = nil
		dragStart = nil
		dragPos = nil

		function updateInput(input)
			Delta = input.Position - dragStart
			Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(.25), {Position = Position}):Play()
		end

		Frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
				dragToggle = true
				dragStart = input.Position
				startPos = Frame.Position
				input.Changed:Connect(function()
					if (input.UserInputState == Enum.UserInputState.End) then
						dragToggle = false
					end
				end)
			end
		end)

		Frame.InputChanged:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				dragInput = input
			end
		end)

		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if (input == dragInput and dragToggle) then
				updateInput(input)
			end
		end)
	end

    Dragify.Name = "Dragify"
    Dragify.Parent = UILIB
    Dragify.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Dragify.BackgroundTransparency = 1
    Dragify.BorderSizePixel = 0
    Dragify.Position = UDim2.new(0.0148975793, 0, 0.0276422761, 0)
    Dragify.Size = UDim2.new(0, 181, 0, 442)
    
    dragify(Dragify)

    Main.Name = "Main"
    Main.Parent = Dragify
    Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Main.Size = UDim2.new(0, 181, 0, 26)
    Main.BorderSizePixel = 0

    TopBar.Name = "TopBar"
    TopBar.Parent = Main
    TopBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TopBar.BorderSizePixel = 0
    TopBar.Size = UDim2.new(0, 181, 0, 26)

    Title.Name = "Title"
    Title.Parent = TopBar
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderSizePixel = 0
    Title.Size = UDim2.new(0, 181, 0, 26)
    Title.Font = Enum.Font.Gotham
    Title.Text = "  " .. title
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 16.000
    Title.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Arrow.Parent = TopBar
    Arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Arrow.BackgroundTransparency = 1.000
    Arrow.BorderSizePixel = 0
    Arrow.Position = UDim2.new(0.856353581, 0, 0, 0)
    Arrow.Size = UDim2.new(0, 26, 0, 26)
    Arrow.Font = Enum.Font.Gotham
    Arrow.Text = "V"
    Arrow.TextColor3 = Color3.fromRGB(255, 255, 255)
    Arrow.TextSize = 15.000
    Arrow.TextWrapped = true

    SecondMain.Name = "SecondMain"
    SecondMain.Parent = Main
    SecondMain.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    SecondMain.BorderSizePixel = 0
    SecondMain.Position = UDim2.new(0, 0, 0.991710961, 0)
    SecondMain.Size = UDim2.new(0, 181, 0, 233)

    MainScroll.Name = "MainScroll"
    MainScroll.Parent = SecondMain
    MainScroll.Active = true
    MainScroll.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    MainScroll.BorderSizePixel = 0
    MainScroll.Position = UDim2.new(0, 0, 0, 0)
    MainScroll.Size = UDim2.new(0, 164, 0, 211)
    MainScroll.CanvasSize = UDim2.new(0, 0, 0, 0)

    ContainerLayout.Name = "ContainerLayout"
    ContainerLayout.Parent = MainScroll
    ContainerLayout.Padding = UDim2.new(0, 8)
    ContainerLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local Elements = {}

    function Elements:CreateButton(text, callback)
        text = text or "New Button"
        callback = callback or function() end

        local TextButton = Instance.new("TextButton")
        --local TextButtonCorner = Instance.new("UICorner")

        TextButton.Parent = MainScroll
        TextButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        TextButton.BorderSizePixel = 0
        TextButton.Size = UDim2.new(0, 164, 0, 31)
        TextButton.Font = Enum.Font.GothamSemibold
        TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton.TextSize = 14.000
        TextButton.Text = text
        TextButton.MouseButton1Click:Connect(function()
            callback()

            TextButton.TextSize = 0
            TweenService:Create(TextButton, TweenInfo.new(.2, Enum.EasingStyle.Quad), {TextSize = 17}):Play()
            wait(.2)
            TweenService:Create(TextButton, TweenInfo.new(.2, Enum.EasingStyle.Quad), {TextSize = 14}):Play()
        end)
        --[[
        TextButtonCorner.CornerRadius = UDim.new(0, 4)
        TextButtonCorner.Name = "TextButtonCorner"
        TextButtonCorner.Parent = TextButton]]
    end

    return Elements
end

return Library
