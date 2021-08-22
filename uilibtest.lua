local lib = {}

for _, gui in pairs(game:GetService("CoreGui"):GetChildren()) do
   if gui:IsA("ScreenGui") and string.match(gui.Name, "_SovwUILibrary") then
      gui:Destroy() 
   end
end

local LibName = tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100).."_SovwUILibrary")
local TweenService = game:GetService("TweenService")

local Tween = {}

function Tween:Create(name, duration, properties)
    duration = duration or .3
    local TI = TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
    
    local Tweening = TweenService:Create(name, TI, properties)
    Tweening:Play()
end

function lib:UI()
    game.CoreGui[LibName].Enabled = not game.CoreGui[LibName].Enabled
end

local Tween = loadstring(game:HttpGet("https://raw.githubusercontent.com/Cryptweb/modules/main/TweenModule.lua"))()

function lib:Window(title)
    local Test = Instance.new("ScreenGui")
    local Dragify = Instance.new("Frame")
    local Main = Instance.new("Frame")
    local TopBar = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Arrow = Instance.new("TextButton")
    local SecondMain = Instance.new("Frame")
    local MainScroll = Instance.new("ScrollingFrame")
    
    local ContainerLayout = Instance.new("UIListLayout")

    Test.Name = LibName
    Test.Parent = game.CoreGui
    Test.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Test.ResetOnSpawn = false
    
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
    Dragify.Parent = Test
    Dragify.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Dragify.BackgroundTransparency = 1.000
    Dragify.BorderSizePixel = 0
    Dragify.Position = UDim2.new(0.0148975793, 0, 0.0276422761, 0)
    Dragify.Size = UDim2.new(0, 181, 0, 442)
    
    dragify(Dragify)

    Main.Name = "Main"
    Main.Parent = Dragify
    Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Main.Size = UDim2.new(0, 181, 0, 26)

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

    Arrow.Name = "Arrow"
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
    
    local guiIsDropped = true
    local debounce = false
    Arrow.MouseButton1Click:Connect(function()
        guiIsDropped = not guiIsDropped
        
        if debounce == false then
            debounce = true
            if guiIsDropped == true then
                Tween:Create(SecondMain, .2, {Size = UDim2.new(0, 181, 0, 233)})
                Tween:Create(Arrow, .2, {Rotation = 0})
                guiIsDropped = true
            else
                Tween:Create(SecondMain, .2, {Size = UDim2.new(0, 181, 0, 0)})
                Tween:Create(Arrow, .2, {Rotation = 180})
                guiIsDropped = false
            end
            
            wait(0.3)
            debounce = false
        end
    end)

    SecondMain.Name = "SecondMain"
    SecondMain.Parent = Main
    SecondMain.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    SecondMain.BorderSizePixel = 0
    SecondMain.Position = UDim2.new(0, 0, 0.991710961, 0)
    SecondMain.Size = UDim2.new(0, 181, 0, 233)
    SecondMain.ClipsDescendants = true

    MainScroll.Name = "MainScroll"
    MainScroll.Parent = SecondMain
    MainScroll.Active = true
    MainScroll.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    MainScroll.BorderSizePixel = 0
    MainScroll.Position = UDim2.new(0.0525027104, 0, 0.0414285958, 0)
    MainScroll.Size = UDim2.new(0, 181, 0, 211)
    MainScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    MainScroll.ClipsDescendants = true
    MainScroll.ScrollBarThickness = 4
    MainScroll.ScrollBarImageColor3 = Color3.fromRGB(42, 44, 50)

    ContainerLayout.Name = "ContainerLayout"
    ContainerLayout.Parent = MainScroll
    ContainerLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ContainerLayout.Padding = UDim.new(0, 4)

    MainScroll.ChildAdded:Connect(function()
		local ab = ContainerLayout.AbsoluteContentSize
		MainScroll.CanvasSize = UDim2.new(0,0,0,ab.Y)
	end)

    local InnerLib = {}

    function InnerLib:Button(text, callback)
        text = text or "Button"
        callback = callback or function() end

        local Button = Instance.new("TextButton")
        local buttonCorner = Instance.new("UICorner")

        Button.Name = "Button"
        Button.Parent = MainScroll
        Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        Button.BorderSizePixel = 0
        Button.Size = UDim2.new(0, 164, 0, 31)
        Button.Font = Enum.Font.GothamSemibold
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 14.000
        Button.TextWrapped = true
        Button.Text = text
        Button.MouseButton1Click:Connect(function()
            callback()

            Button.TextSize = 0
            TweenService:Create(Button, TweenInfo.new(.2, Enum.EasingStyle.Quad), {TextSize = 17}):Play()
            wait(.2)
            TweenService:Create(Button, TweenInfo.new(.2, Enum.EasingStyle.Quad), {TextSize = 14}):Play()
        end)

        buttonCorner.CornerRadius = UDim.new(0, 4)
        buttonCorner.Name = "buttonCorner"
        buttonCorner.Parent = Button
    end

    function InnerLib:Toggle(text, callback)
        text = text or "Toggle"
        callback = callback or function() end

        local Toggle = Instance.new("TextButton")
        local toggleCorner = Instance.new("UICorner")

        Toggle.Name = "Toggle"
        Toggle.Parent = MainScroll
        Toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        Toggle.BorderSizePixel = 0
        Toggle.Size = UDim2.new(0, 164, 0, 31)
        Toggle.Font = Enum.Font.GothamSemibold
        Toggle.Text = text
        Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
        Toggle.TextSize = 14.000
        Toggle.TextWrapped = true

        toggleCorner.CornerRadius = UDim.new(0, 4)
        toggleCorner.Name = "toggleCorner"
        toggleCorner.Parent = Toggle

        local togglexd = false
        
        Toggle.MouseButton1Click:Connect(function()
            togglexd = not togglexd
            callback(togglexd)

            if togglexd == true then
                Toggle.TextSize = 0
                TweenService:Create(Toggle, TweenInfo.new(.2, Enum.EasingStyle.Quad), {TextSize = 17}):Play()
                TweenService:Create(Toggle, TweenInfo.new(.2, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(26, 179, 0)}):Play()
                wait(.2)
                TweenService:Create(Toggle, TweenInfo.new(.2, Enum.EasingStyle.Quad), {TextSize = 14}):Play()
            else
                Toggle.TextSize = 0
                TweenService:Create(Toggle, TweenInfo.new(.2, Enum.EasingStyle.Quad), {TextSize = 17}):Play()
                TweenService:Create(Toggle, TweenInfo.new(.2, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
                wait(.2)
                TweenService:Create(Toggle, TweenInfo.new(.2, Enum.EasingStyle.Quad), {TextSize = 14}):Play()
            end
        end)
    end

    function InnerLib:Dropdown(text, list, callback)
        text = text or "New Dropdown"
        list = list or {}
        callback = callback or function() end

        local DropYSize = 0
        local dropdownSizes = {}

        local Dropdown = Instance.new("Frame")
        local dropdownCorner = Instance.new("UICorner")
        local dropdownLabel = Instance.new("TextLabel")
        local dropdownButton = Instance.new("TextButton")
        local dropdownItems = Instance.new("Frame")
        local dropdownItemsCorner = Instance.new("UICorner")
        local UIListLayout = Instance.new("UIListLayout")

        Dropdown.Name = "Dropdown"
        Dropdown.Parent = MainScroll
        Dropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        Dropdown.Position = UDim2.new(0, 0, 0.369668245, 0)
        Dropdown.Size = UDim2.new(0, 164, 0, 31)

        dropdownCorner.CornerRadius = UDim.new(0, 4)
        dropdownCorner.Name = "dropdownCorner"
        dropdownCorner.Parent = Dropdown

        dropdownLabel.Name = "dropdownLabel"
        dropdownLabel.Parent = Dropdown
        dropdownLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        dropdownLabel.BackgroundTransparency = 1.000
        dropdownLabel.BorderSizePixel = 0
        dropdownLabel.Size = UDim2.new(0, 132, 0, 31)
        dropdownLabel.Font = Enum.Font.Gotham
        dropdownLabel.Text = "  " .. text
        dropdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        dropdownLabel.TextSize = 14.000
        dropdownLabel.TextWrapped = true
        dropdownLabel.TextXAlignment = Enum.TextXAlignment.Left

        dropdownButton.Name = "dropdownButton"
        dropdownButton.Parent = Dropdown
        dropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        dropdownButton.BackgroundTransparency = 1.000
        dropdownButton.BorderSizePixel = 0
        dropdownButton.Position = UDim2.new(0.810975492, 0, 0, 0)
        dropdownButton.Size = UDim2.new(0, 31, 0, 31)
        dropdownButton.Font = Enum.Font.Gotham
        dropdownButton.Text = "+"
        dropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        dropdownButton.TextSize = 18.000
        dropdownButton.TextWrapped = true

        table.insert(dropdownSizes, #dropdownSizes + 1, dropdownItems.Size)
        dropdownItems.Active = false
        dropdownItems.Name = #dropdownSizes
        dropdownItems.Parent = MainScroll
        dropdownItems.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        dropdownItems.BorderSizePixel = 0
        dropdownItems.Position = UDim2.new(0, 0, 0.850000203, 0)
        dropdownItems.Size = UDim2.new(0, 164, 0, DropYSize)
        dropdownItems.ClipsDescendants = true

        dropdownItemsCorner.CornerRadius = UDim.new(0, 4)
        dropdownItemsCorner.Name = "dropdownItemsCorner"
        dropdownItemsCorner.Parent = dropdownItems

        UIListLayout.Parent = dropdownItems
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        local tI = TweenInfo.new(.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        local savedOffset;
        local tween;
        local tween2;
        local tween3;

        local isDropped = false
        local debounce = false

        dropdownButton.MouseButton1Click:Connect(function()
            if debounce == false then
                debounce = true
                if isDropped == true then
                    savedOffset = dropdownSizes[tonumber(dropdownItems.Name)] or dropdownItems.Size
                    tween = TweenService:Create(dropdownItems, tI, {Size = dropdownItems.Size - UDim2.new(0, 0, 0, DropYSize)})
                    tween:Play()

                    tween2 = TweenService:Create(MainScroll, tI, {Size = UDim2.new(0, 164, 0, MainScroll.Size.Y.Offset - savedOffset.Y.Offset)})
                    tween2:Play()

                    dropdownButton.Text = "+"
                    isDropped = false
                else
                    savedOffset = dropdownSizes[tonumber(dropdownItems.Name)] or dropdownItems.Size
                    tween = TweenService:Create(dropdownItems, tI, {Size = dropdownItems.Size + UDim2.new(0, 0, 0, DropYSize)})
                    tween:Play()

                    tween2 = TweenService:Create(MainScroll, tI, {Size = UDim2.new(0, 164, 0, MainScroll.Size.Y.Offset + savedOffset.Y.Offset)})
                    tween2:Play()

                    dropdownButton.Text = "-"
                    isDropped = true
                end

                wait(0.2)
                debounce = false
            end
        end)

        for i,v in next, list do
            DropYSize += 31

            local dropdownItemButton = Instance.new("TextButton")

            dropdownItemButton.Name = "dropdownItemButton"
            dropdownItemButton.Parent = dropdownItems
            dropdownItemButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            dropdownItemButton.BackgroundTransparency = 1.000
            dropdownItemButton.BorderSizePixel = 0
            dropdownItemButton.Size = UDim2.new(0, 164, 0, 31)
            dropdownItemButton.Font = Enum.Font.Gotham
            dropdownItemButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            dropdownItemButton.TextSize = 14.000
	        dropdownItemButton.TextWrapped = true
            dropdownItemButton.Text = v

            dropdownItemButton.MouseButton1Click:Connect(function()
                callback(v)
                dropdownItemButton.TextSize = 0
                dropdownLabel.Text = "  "..text..": "..v
                TweenService:Create(dropdownItemButton, TweenInfo.new(.2, Enum.EasingStyle.Quad), {TextSize = 17}):Play()
                wait(.2)
                TweenService:Create(dropdownItemButton, TweenInfo.new(.2, Enum.EasingStyle.Quad), {TextSize = 14}):Play()
            end)
        end
    end

    function InnerLib:Slider(text, min, max, callback)
        local Slider = Instance.new("Frame")
        local sliderCorner = Instance.new("UICorner")
        local sliderFrame = Instance.new("Frame")
        local sliderThing = Instance.new("Frame")
        local sliderCircle = Instance.new("Frame")
        local circleCorner = Instance.new("UICorner")
        local Description = Instance.new("TextLabel")
        local RunService = game.GetService(game, "RunService")
        local RenderStepped = RunService.RenderStepped
        local Mouse = game.Players.LocalPlayer:GetMouse()

        Slider.Name = "Slider"
        Slider.Parent = MainScroll
        Slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        Slider.BorderSizePixel = 0
        Slider.Position = UDim2.new(0, 0, 0.554502368, 0)
        Slider.Size = UDim2.new(0, 164, 0, 31)

        sliderCorner.CornerRadius = UDim.new(0, 4)
        sliderCorner.Name = "sliderCorner"
        sliderCorner.Parent = Slider

        sliderFrame.Name = "sliderFrame"
        sliderFrame.Parent = Slider
        sliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        sliderFrame.BackgroundTransparency = 1.000
        sliderFrame.BorderSizePixel = 0
        sliderFrame.Position = UDim2.new(0.063000001, 0, 0.430000007, 0)
        sliderFrame.Size = UDim2.new(0, 144, 0, 5)

        sliderThing.Name = "sliderThing"
        sliderThing.Parent = sliderFrame
        sliderThing.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        sliderThing.BorderSizePixel = 0
        sliderThing.Size = UDim2.new(0, 0, 0, 5)

        sliderCircle.Name = "sliderCircle"
        sliderCircle.Parent = sliderThing
        sliderCircle.AnchorPoint = Vector2.new(0.5, 0.5)
        sliderCircle.BackgroundColor3 = Color3.fromRGB(125, 125, 125)
        sliderCircle.BorderSizePixel = 0
        sliderCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
        sliderCircle.Size = UDim2.new(0, 10, 0, 10)

        circleCorner.CornerRadius = UDim.new(0, 50)
        circleCorner.Name = "circleCorner"
        circleCorner.Parent = sliderCircle

        Description.Name = "Description"
        Description.Parent = Test
        Description.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        Description.BorderColor3 = Color3.fromRGB(255, 255, 255)
        Description.Position = UDim2.new(0.26999867, 0, 0.591712713, 0)
        Description.Size = UDim2.new(0, 108, 0, 21)
        Description.Font = Enum.Font.Gotham
        Description.Text = text
        Description.TextColor3 = Color3.fromRGB(255, 255, 255)
        Description.TextScaled = true
        Description.TextSize = 14.000
        Description.Visible = false
        Description.TextWrapped = true

        function makeVisible()
            Description.Visible = true
        end

        function makeInvisible()
            Description.Visible = false
        end

        function updateDescriptionPosition()
            Description.Position = UDim2.new(0, Mouse.X + 15, 0, Mouse.Y + 15)
        end

        Slider.MouseEnter:Connect(makeVisible)

        Slider.MouseLeave:Connect(makeInvisible)

        Slider.MouseMoved:Connect(updateDescriptionPosition)
    end

    return InnerLib
end

return lib
