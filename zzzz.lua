local Library = {
    Properties = {
        EasingStyle = Enum.EasingStyle.Quart,
        UIToggleKey = Enum.KeyCode.RightShift,
        MainColor = Color3.fromRGB(27, 29, 53),
        Toggled = Color3.fromRGB(90, 106, 211),
        MainSize = UDim2.new(0, 500, 0, 383),
        UIOpen = true
    }
}

for i,v in pairs(game.CoreGui:GetChildren()) do 
    if string.find(v.Name, "_MADEBYCRYPTWEB") then 
        v:Destroy()
    end
end

local TweenService = game:GetService("TweenService")
local NameOfLib = tostring(math.random(1,10))..tostring(math.random(1,50))..tostring(math.random(1,100))..tostring(math.random(1,150))..tostring(math.random(1,1000))..tostring(math.random(1,500)).."_MADEBYCRYPTWEB"
local ContentProvider = game:GetService("ContentProvider")

ContentProvider:PreloadAsync({"rbxassetid://170940873", "rbxassetid://2708891598", "rbxassetid://156579757", "rbxassetid://3926309567", "rbxassetid://6523286724"})

local Mouse = game.Players.LocalPlayer:GetMouse()

local function RippleEffect(object)
    spawn(function()
        object.ClipsDescendants = true

        local Ripple = Instance.new("ImageLabel")

        Ripple.Name = "Ripple"
        Ripple.Parent = object
        Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Ripple.BackgroundTransparency = 1.000
        Ripple.ZIndex = 35
        Ripple.Image = "rbxassetid://2708891598"
        Ripple.ImageTransparency = 0.5
        Ripple.ScaleType = Enum.ScaleType.Fit

        Ripple.Position = UDim2.new((Mouse.X - Ripple.AbsolutePosition.X) / object.AbsoluteSize.X, 0, (Mouse.Y - Ripple.AbsolutePosition.Y) / object.AbsoluteSize.Y, 0)
        TweenService:Create(Ripple, TweenInfo.new(.5, Library.Properties.EasingStyle, Enum.EasingDirection.Out), {Position = UDim2.new(-5.5, 0, -5.5, 0), Size = UDim2.new(12, 0, 12, 0)}):Play()

        wait(0.25)
        TweenService:Create(Ripple, TweenInfo.new(.5, Library.Properties.EasingStyle, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()

        wait(.5)
        Ripple:Destroy()
    end)
end

function dragify(Frame)
    dragToggle = nil
    dragSpeed = 0.01
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

function Library:Window(text)
    text = text or "universal.fun"

    local ScreenGui = Instance.new("ScreenGui")
    local Dragify = Instance.new("Frame")
    local Body = Instance.new("Frame")
    local Sidebar = Instance.new("Frame")
    local TabContainer = Instance.new("Frame")
    local elementListing = Instance.new("UIListLayout")
    local allPages = Instance.new("Frame")
    local pageFolder = Instance.new("Folder")

    local Topbar = Instance.new("Frame")
    local Title = Instance.new("TextLabel")

    ScreenGui.Name = NameOfLib
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ResetOnSpawn = false
    
    Dragify.Name = "Dragify"
    Dragify.Parent = ScreenGui
    Dragify.AnchorPoint = Vector2.new(0.5, 0.5)
    Dragify.BackgroundColor3 = Color3.fromRGB(20, 22, 43)
    Dragify.BackgroundTransparency = 1
    Dragify.BorderSizePixel = 0
    Dragify.Position = UDim2.new(0.5, 0, 0.5, 0)
    Dragify.Size = UDim2.new(0, 500, 0, 383)
    
    dragify(Dragify)

    Body.Name = "Body"
    Body.Parent = Dragify
    Body.AnchorPoint = Vector2.new(0.5, 0.5)
    Body.BackgroundColor3 = Color3.fromRGB(20, 22, 43)
    Body.BorderSizePixel = 0
    Body.Position = UDim2.new(0.5, 0, 0.5, 0)
    Body.Size = UDim2.new(0, 500, 0, 383)
    Body.ClipsDescendants = true
    
    function Library:Visible()
        Library.Properties.UIOpen = not Library.Properties.UIOpen

        if not Library.Properties.UIOpen then
            TweenService:Create(Body, TweenInfo.new(0.5, Library.Properties.EasingStyle, Enum.EasingDirection.Out), {Size = UDim2.new(0, 500, 0, 0)}):Play()
        elseif Library.Properties.UIOpen then
            TweenService:Create(Body, TweenInfo.new(0.5, Library.Properties.EasingStyle, Enum.EasingDirection.Out), {Size = Library.Properties.MainSize}):Play()
        end
    end

    Sidebar.Name = "Sidebar"
    Sidebar.Parent = Body
    Sidebar.BackgroundColor3 = Color3.fromRGB(27, 29, 53)
    Sidebar.BorderSizePixel = 0
    Sidebar.Size = UDim2.new(0, 52, 0, 383)

    TabContainer.Name = "TabContainer"
    TabContainer.Parent = Sidebar
    TabContainer.BackgroundColor3 = Color3.fromRGB(27, 29, 53)
    TabContainer.BackgroundTransparency = 1.000
    TabContainer.BorderSizePixel = 0
    TabContainer.Position = UDim2.new(0, 0, 0.0156657957, 0)
    TabContainer.Size = UDim2.new(0, 52, 0, 364)

    elementListing.Parent = TabContainer
    elementListing.HorizontalAlignment = Enum.HorizontalAlignment.Center
    elementListing.SortOrder = Enum.SortOrder.LayoutOrder
    elementListing.Padding = UDim.new(0, 3)

    allPages.Name = "allPages"
    allPages.Parent = Body
    allPages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    allPages.BackgroundTransparency = 1.000
    allPages.BorderSizePixel = 0
    allPages.Position = UDim2.new(0.104000002, 0, 0.127937332, 0)
    allPages.Size = UDim2.new(0, 448, 0, 334)

    Topbar.Name = "Topbar"
    Topbar.Parent = Body
    Topbar.BackgroundColor3 = Color3.fromRGB(24, 25, 49)
    Topbar.BorderSizePixel = 0
    Topbar.AnchorPoint = Vector2.new(0.5,0.5)
    Topbar.Position = UDim2.new(0.552, 0,0.065, 0)
    Topbar.Size = UDim2.new(0, 448, 0, 50)

    Title.Name = "Title"
    Title.Parent = Topbar
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0.191964284, 0, 0, 0)
    Title.Size = UDim2.new(0, 224, 0, 50)
    Title.Font = Enum.Font.GothamSemibold
    Title.Text = text
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 19.000

    local tabHandler = {}

    function tabHandler:Tab(image)
        image = image or "rbxassetid://170940873"

        local TabIcon = Instance.new("ImageButton")
        local newPage = Instance.new("ScrollingFrame")

        local pageElementListing = Instance.new("UIListLayout")

        TabIcon.Name = "TabIcon"
        TabIcon.Parent = TabContainer
        TabIcon.BackgroundColor3 = Color3.fromRGB(127, 23, 255)
        TabIcon.BackgroundTransparency = 1.000
        TabIcon.BorderColor3 = Color3.fromRGB(27, 42, 53)
        TabIcon.BorderSizePixel = 0
        TabIcon.Position = UDim2.new(0.173076928, 0, 0.0182767622, 0)
        TabIcon.Size = UDim2.new(0, 34, 0, 34)
        TabIcon.Image = image

        TabIcon.MouseButton1Click:Connect(function()
            for i,v in next, allPages:GetChildren() do
                v.Visible = false
            end
            newPage.Visible = true

            for i,v in next, TabContainer:GetChildren() do
                if v:IsA("ImageButton") then
                    TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        ImageColor3 = Color3.fromRGB(255, 255, 255)
                    }):Play()
                end
            end

            TweenService:Create(TabIcon, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                ImageColor3 = Color3.fromRGB(90, 106, 211)
            }):Play()
        end)
        
        newPage.Name = "newPage"
        newPage.Parent = allPages
        newPage.Active = true
        newPage.Visible = false
        newPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        newPage.BackgroundTransparency = 1.000
        newPage.BorderSizePixel = 0
        newPage.AnchorPoint = Vector2.new(0.5, 0.5)
        newPage.Position = UDim2.new(0.5, 0, 0.5, 0)
        newPage.Size = UDim2.new(0, 427, 0, 307)
        newPage.CanvasSize = UDim2.new(0, 0, 0, 0)
        newPage.ScrollBarThickness = 3
        pageElementListing:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            newPage.CanvasSize = UDim2.new(0,0,0,pageElementListing.AbsoluteContentSize.Y) 
        end)

        pageElementListing.Parent = newPage
        pageElementListing.HorizontalAlignment = Enum.HorizontalAlignment.Center
        pageElementListing.SortOrder = Enum.SortOrder.LayoutOrder
        pageElementListing.Padding = UDim.new(0,6)

        local elementHandler = {}

        function elementHandler:Button(text, callback)
            text = text or "New Button"
            callback = callback or function() end

            local Button = Instance.new("TextButton")
            local UICorner = Instance.new("UICorner")

            Button.Parent = newPage
            Button.BackgroundColor3 = Library.Properties.MainColor
            Button.BorderSizePixel = 0
            Button.Position = UDim2.new(0, 0, 0, 0)
            Button.Size = UDim2.new(0, 404, 0, 36)
            Button.Font = Enum.Font.Gotham
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 17.000
            Button.Text = text
            Button.AutoButtonColor = false

            Button.MouseButton1Click:Connect(function()
                RippleEffect(Button)
                callback(Button)
            end)

            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Parent = Button
        end

        function elementHandler:Toggle(text, callback)
            text = text or "New Toggle"
            callback = callback or function() end

            local State = false

            local toggleLabel = Instance.new("TextLabel")
            local toggleButton = Instance.new("ImageButton")
            local toggleCorner = Instance.new("UICorner")

            toggleLabel.Name = "toggleLabel"
            toggleLabel.Parent = newPage
            toggleLabel.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
            toggleLabel.BackgroundTransparency = 1.000
            toggleLabel.Position = UDim2.new(0.265807956, 0, 0.120521173, 0)
            toggleLabel.Size = UDim2.new(0, 404, 0, 34)
            toggleLabel.Font = Enum.Font.Gotham
            toggleLabel.Text = " " .. text
            toggleLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
            toggleLabel.TextSize = 17.000
            toggleLabel.TextXAlignment = Enum.TextXAlignment.Left

            toggleButton.Name = "toggleButton"
            toggleButton.Parent = toggleLabel
            toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            toggleButton.BackgroundTransparency = 1.000
            toggleButton.BorderSizePixel = 0
            toggleButton.Position = UDim2.new(0.928217828, 0, 0.117647067, 0)
            toggleButton.Size = UDim2.new(0, 25, 0, 25)
            toggleButton.Image = "rbxassetid://320613021"
            toggleButton.ImageColor3 = Color3.fromRGB(27, 29, 53)

            toggleButton.MouseButton1Click:Connect(function()
                State = not State

                if State then
                    TweenService:Create(toggleLabel, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                    TweenService:Create(toggleButton, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Library.Properties.Toggled}):Play()
                elseif not State then
                    TweenService:Create(toggleLabel, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
                    TweenService:Create(toggleButton, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Library.Properties.MainColor}):Play()
                end

                callback(State)
            end)

            toggleCorner.CornerRadius = UDim.new(0, 3)
            toggleCorner.Parent = toggleButton
        end

        function elementHandler:Slider(text, minvalue, maxvalue, callback)
            text = text or "New Slider"
            minvalue = minvalue or 0
            maxvalue = maxvalue or 100
            callback = callback or function() end

            local mouse = game.Players.LocalPlayer:GetMouse()
            local uis = game:GetService("UserInputService")
            local Value

            local Slider = Instance.new("Frame")
            local sliderCorner = Instance.new("UICorner")
            local sliderText = Instance.new("TextLabel")
            local sliderButton = Instance.new("TextButton")
            local sButtonCorner = Instance.new("UICorner")
            local sliderFrame = Instance.new("Frame")
            local sFrameCorner = Instance.new("UICorner")
            local sliderValue = Instance.new("TextLabel")

            Slider.Name = "Slider"
            Slider.Parent = newPage
            Slider.BackgroundColor3 = Color3.fromRGB(27, 29, 53)
            Slider.Position = UDim2.new(0.0269320849, 0, 0.241042346, 0)
            Slider.Size = UDim2.new(0, 404, 0, 75)

            sliderCorner.CornerRadius = UDim.new(0, 5)
            sliderCorner.Name = "sliderCorner"
            sliderCorner.Parent = Slider

            sliderText.Name = "sliderText"
            sliderText.Parent = Slider
            sliderText.AnchorPoint = Vector2.new(0.5, 0.5)
            sliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sliderText.BackgroundTransparency = 1.000
            sliderText.BorderSizePixel = 0
            sliderText.Position = UDim2.new(0.239999995, 0, 0.25999999, 0)
            sliderText.Size = UDim2.new(0, 186, 0, 30)
            sliderText.Font = Enum.Font.Gotham
            sliderText.Text = " " .. text
            sliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
            sliderText.TextSize = 17.000
            sliderText.TextXAlignment = Enum.TextXAlignment.Left

            sliderButton.Name = "sliderButton"
            sliderButton.Parent = Slider
            sliderButton.BackgroundColor3 = Color3.fromRGB(20, 22, 43)
            sliderButton.BorderSizePixel = 0
            sliderButton.Position = UDim2.new(0.0297029708, 0, 0.560000002, 0)
            sliderButton.Size = UDim2.new(0, 380, 0, 25)
            sliderButton.AutoButtonColor = false
            sliderButton.Font = Enum.Font.SourceSans
            sliderButton.Text = ""
            sliderButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            sliderButton.TextSize = 14.000

            sButtonCorner.CornerRadius = UDim.new(0, 5)
            sButtonCorner.Name = "sButtonCorner"
            sButtonCorner.Parent = sliderButton

            sliderFrame.Name = "sliderFrame"
            sliderFrame.Parent = sliderButton
            sliderFrame.BackgroundColor3 = Color3.fromRGB(90, 106, 211)
            sliderFrame.Size = UDim2.new(0, 0, 0, 25)

            sFrameCorner.CornerRadius = UDim.new(0, 5)
            sFrameCorner.Name = "sFrameCorner"
            sFrameCorner.Parent = sliderFrame

            sliderValue.Name = "sliderValue"
            sliderValue.Parent = Slider
            sliderValue.AnchorPoint = Vector2.new(0.5, 0.5)
            sliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sliderValue.BackgroundTransparency = 1.000
            sliderValue.BorderSizePixel = 0
            sliderValue.Position = UDim2.new(0.853861332, 0, 0.25999999, 0)
            sliderValue.Size = UDim2.new(0, 80, 0, 30)
            sliderValue.Font = Enum.Font.Gotham
            sliderValue.Text = minvalue
            sliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            sliderValue.TextSize = 17.000
            sliderValue.TextXAlignment = Enum.TextXAlignment.Right

            sliderButton.MouseButton1Down:Connect(function()
                Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 380) * sliderFrame.AbsoluteSize.X) + tonumber(minvalue)) or 0
                pcall(function()
                    callback(Value)
                end)
                sliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - sliderFrame.AbsolutePosition.X, 0, 380), 0, 25)
                moveconnection = mouse.Move:Connect(function()
                    sliderValue.Text = Value
                    Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 380) * sliderFrame.AbsoluteSize.X) + tonumber(minvalue))
                    pcall(function()
                        callback(Value)
                    end)
                    sliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - sliderFrame.AbsolutePosition.X, 0, 380), 0, 25)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 380) * sliderFrame.AbsoluteSize.X) + tonumber(minvalue))
                        pcall(function()
                            callback(Value)
                        end)
                        sliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - sliderFrame.AbsolutePosition.X, 0, 380), 0, 25)
                        moveconnection:Disconnect()
                        releaseconnection:Disconnect()
                    end
                end)
            end)
        end

        function elementHandler:Dropdown(text, list, callback)
            text = text or "New Dropdown"
            list = list or {}
            callback = callback or function() end

            local Dropped = false
            local DropYSize = 0

            local Dropdown = Instance.new("TextLabel")
            local dropdownButton = Instance.new("TextButton")
            local dropdownList = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local dropdownListing = Instance.new("UIListLayout")

            Dropdown.Name = "Dropdown"
            Dropdown.Parent = newPage
            Dropdown.BackgroundColor3 = Color3.fromRGB(27, 29, 53)
            Dropdown.BorderSizePixel = 0
            Dropdown.Size = UDim2.new(0, 404, 0, 34)
            Dropdown.Font = Enum.Font.Gotham
            Dropdown.Text = text
            Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
            Dropdown.TextSize = 17.000

            dropdownButton.Name = "dropdownButton"
            dropdownButton.Parent = Dropdown
            dropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            dropdownButton.BackgroundTransparency = 1.000
            dropdownButton.BorderSizePixel = 0
            dropdownButton.Position = UDim2.new(0.910891116, 0, 0, 0)
            dropdownButton.Size = UDim2.new(0, 36, 0, 34)
            dropdownButton.Font = Enum.Font.Gotham
            dropdownButton.Text = "V"
            dropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            dropdownButton.TextSize = 17.000
            dropdownButton.MouseButton1Click:Connect(function()
                Dropped = not Dropped

                if not Dropped then
                    TweenService:Create(dropdownButton, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Rotation = 0}):Play()
                    TweenService:Create(dropdownList, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0,401,0,0)}):Play()
                elseif Dropped then
                    TweenService:Create(dropdownButton, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Rotation = 180}):Play()
                    TweenService:Create(dropdownList, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0,401,0,DropYSize)}):Play()
                end
            end)

            dropdownList.Name = "dropdownList"
            dropdownList.Parent = newPage
            dropdownList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            dropdownList.BackgroundTransparency = 1.000
            dropdownList.BorderSizePixel = 0
            dropdownList.Position = UDim2.new(0, 0, 1, 0)
            dropdownList.Size = UDim2.new(0, 401, 0, 0)
            dropdownList.ClipsDescendants = true

            dropdownListing.Parent = dropdownList
            dropdownListing.HorizontalAlignment = Enum.HorizontalAlignment.Center
            dropdownListing.SortOrder = Enum.SortOrder.LayoutOrder
            dropdownListing.Padding = UDim.new(0, 0)

            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Parent = dropdownListButton

            for i,v in next, list do
                local dropdownListButton = Instance.new("TextButton")

                dropdownListButton.Name = "dropdownListButton"
                dropdownListButton.Parent = dropdownList
                dropdownListButton.BackgroundColor3 = Color3.fromRGB(27, 29, 53)
                dropdownListButton.BorderSizePixel = 0
                dropdownListButton.Position = UDim2.new(-0.00528316805, 0, 0, 0)
                dropdownListButton.Size = UDim2.new(0, 404, 0, 34)
                dropdownListButton.AutoButtonColor = false
                dropdownListButton.Font = Enum.Font.Gotham
                dropdownListButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                dropdownListButton.TextSize = 17.000
                dropdownListButton.Text = v
                DropYSize = DropYSize + 34

                dropdownListButton.MouseButton1Click:Connect(function()
                    Dropdown.Text = text .. " - " .. v
                    RippleEffect(dropdownListButton)
                    callback(v)
                end)
            end
        end

        function elementHandler:Colorpicker(text, callback)
            text = text or "New Colorpicker"
            color = color or Color3.fromRGB(255,255,255)
            callback = callback or function() end

            local DroppedC = false

            local Colorpicker = Instance.new("TextLabel")
            local colorpickerButton = Instance.new("TextButton")
            local colorpickerFrame = Instance.new("Frame")
            local RGB = Instance.new("ImageButton")
            local RGBCircle = Instance.new("ImageLabel")
            local Darkness = Instance.new("ImageButton")
            local DarknessCircle = Instance.new("TextLabel")
            local colorR = Instance.new("TextLabel")
            local colorG = Instance.new("TextLabel")
            local colorB = Instance.new("TextLabel")
            local ColorDisplay = Instance.new("TextLabel")

            Colorpicker.Name = "Colorpicker"
            Colorpicker.Parent = newPage
            Colorpicker.BackgroundColor3 = Color3.fromRGB(27, 29, 53)
            Colorpicker.BorderSizePixel = 0
            Colorpicker.Size = UDim2.new(0, 404, 0, 34)
            Colorpicker.Font = Enum.Font.Gotham
            Colorpicker.Text = text
            Colorpicker.TextColor3 = Color3.fromRGB(255, 255, 255)
            Colorpicker.TextSize = 17.000

            colorpickerButton.Name = "colorpickerButton"
            colorpickerButton.Parent = Colorpicker
            colorpickerButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            colorpickerButton.BackgroundTransparency = 1.000
            colorpickerButton.BorderSizePixel = 0
            colorpickerButton.Position = UDim2.new(0.910891116, 0, 0, 0)
            colorpickerButton.Size = UDim2.new(0, 36, 0, 34)
            colorpickerButton.Font = Enum.Font.Gotham
            colorpickerButton.Text = "V"
            colorpickerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            colorpickerButton.TextSize = 17.000
            colorpickerButton.MouseButton1Click:Connect(function()
                DroppedC = not DroppedC

                if not DroppedC then
                    TweenService:Create(colorpickerButton, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Rotation = 0}):Play()
                    TweenService:Create(colorpickerFrame, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0,401,0,0)}):Play()
                elseif DroppedC then
                    TweenService:Create(colorpickerButton, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Rotation = 180}):Play()
                    TweenService:Create(colorpickerFrame, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 401, 0, 196)}):Play()
                end
            end)

            colorpickerFrame.Name = "colorpickerFrame"
            colorpickerFrame.Parent = newPage
            colorpickerFrame.BackgroundColor3 = Color3.fromRGB(27, 29, 53)
            colorpickerFrame.BorderSizePixel = 0
            colorpickerFrame.Position = UDim2.new(0.0281030443, 0, 0.058631923, 0)
            colorpickerFrame.Size = UDim2.new(0, 401, 0, 0)
            colorpickerFrame.ClipsDescendants = true

            RGB.Name = "RGB"
            RGB.Parent = colorpickerFrame
            RGB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            RGB.Position = UDim2.new(0.054862842, 0, 0.0494890511, 0)
            RGB.Size = UDim2.new(0, 335, 0, 143)
            RGB.Image = "rbxassetid://6523286724"

            RGBCircle.Name = "RGBCircle"
            RGBCircle.Parent = RGB
            RGBCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            RGBCircle.BackgroundTransparency = 1.000
            RGBCircle.BorderSizePixel = 0
            RGBCircle.Position = UDim2.new(0.478513211, 0, 0.447552264, 0)
            RGBCircle.Size = UDim2.new(0, 14, 0, 14)
            RGBCircle.Image = "rbxassetid://3926309567"
            RGBCircle.ImageRectOffset = Vector2.new(628, 420)
            RGBCircle.ImageRectSize = Vector2.new(48, 48)

            Darkness.Name = "Darkness"
            Darkness.Parent = colorpickerFrame
            Darkness.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Darkness.Position = UDim2.new(0.92768079, 0, 0.0494889505, 0)
            Darkness.Size = UDim2.new(0, 18, 0, 97)
            Darkness.Image = "rbxassetid://156579757"
            Darkness.AutoButtonColor = false

            DarknessCircle.Name = "DarknessCircle"
            DarknessCircle.Parent = Darkness
            DarknessCircle.BackgroundColor3 = Color3.fromRGB(90, 106, 211)
            DarknessCircle.BorderSizePixel = 0
            DarknessCircle.Position = UDim2.new(0, 0, 0, 0)
            DarknessCircle.Size = UDim2.new(0, 18, 0, 4)
            DarknessCircle.Font = Enum.Font.SourceSans
            DarknessCircle.Text = ""
            DarknessCircle.TextColor3 = Color3.fromRGB(0, 0, 0)
            DarknessCircle.TextSize = 14.000

            colorR.Name = "colorR"
            colorR.Parent = colorpickerFrame
            colorR.BackgroundColor3 = Color3.fromRGB(20, 22, 43)
            colorR.BorderSizePixel = 0
            colorR.Position = UDim2.new(0.054862842, 0, 0.817650616, 0)
            colorR.Size = UDim2.new(0, 88, 0, 28)
            colorR.Font = Enum.Font.Gotham
            colorR.Text = "R: 255"
            colorR.TextColor3 = Color3.fromRGB(255, 255, 255)
            colorR.TextSize = 16.000

            colorG.Name = "colorG"
            colorG.Parent = colorpickerFrame
            colorG.BackgroundColor3 = Color3.fromRGB(20, 22, 43)
            colorG.BorderSizePixel = 0
            colorG.Position = UDim2.new(0.361596018, 0, 0.817650616, 0)
            colorG.Size = UDim2.new(0, 88, 0, 28)
            colorG.Font = Enum.Font.Gotham
            colorG.Text = "G: 255"
            colorG.TextColor3 = Color3.fromRGB(255, 255, 255)
            colorG.TextSize = 16.000

            colorB.Name = "colorB"
            colorB.Parent = colorpickerFrame
            colorB.BackgroundColor3 = Color3.fromRGB(20, 22, 43)
            colorB.BorderSizePixel = 0
            colorB.Position = UDim2.new(0.670822978, 0, 0.817650616, 0)
            colorB.Size = UDim2.new(0, 88, 0, 28)
            colorB.Font = Enum.Font.Gotham
            colorB.Text = "B: 255"
            colorB.TextColor3 = Color3.fromRGB(255, 255, 255)
            colorB.TextSize = 16.000

            ColorDisplay.Parent = colorpickerFrame
            ColorDisplay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorDisplay.BorderSizePixel = 0
            ColorDisplay.Position = UDim2.new(0.923551083, 0, 0.604000509, 0)
            ColorDisplay.Size = UDim2.new(0, 18, 0, 69)
            ColorDisplay.Font = Enum.Font.SourceSans
            ColorDisplay.Text = ""
            ColorDisplay.TextColor3 = Color3.fromRGB(0, 0, 0)
            ColorDisplay.TextSize = 14.000

            local ceil,clamp,atan2,pi	= math.ceil,math.clamp,math.atan2,math.pi
            local tostr,sub				= tostring,string.sub
            local fromHSV				= Color3.fromHSV
            local v2,udim2				= Vector2.new,UDim2.new

            local UserInputService	= game:GetService("UserInputService")
            local Mouse				= game.Players.LocalPlayer:GetMouse()

            local WheelDown			= false
            local SlideDown			= false

            local function toPolar(v)
                return atan2(v.y, v.x), v.magnitude;
            end

            local function radToDeg(x)
                return ((x + pi) / (2 * pi)) * 360;
            end
            local hue, saturation, value = 0, 0, 1;
            local color = {1,1,1}

            local function update()
                local r = color[1];
                local g = color[2];
                local b = color[3];

                local c = fromHSV(r, g, b);
                
                ColorDisplay.BackgroundColor3 = c
                colorR.Text	= "R: "..sub(tostr(ceil(clamp(c.r*255,0,255))),1,3)
                colorG.Text = "G: " ..sub(tostr(ceil(clamp(c.g*255,0,255))),1,3)
                colorB.Text = "B: "..sub(tostr(ceil(clamp(c.b*255,0,255))),1,3)
            end
            local function mouseLocation()
                return game.Players.LocalPlayer:GetMouse()
            end
            local function UpdateSlide(iX,iY)	
                local ml = mouseLocation()
                local y = ml.Y - Darkness.AbsolutePosition.Y
                local maxY = Darkness.AbsoluteSize.Y
                if y<0 then y=0 end
                if y>maxY then y=maxY end
                y = y/maxY
                local cy = DarknessCircle.AbsoluteSize.Y/2
                DarknessCircle.Position = UDim2.new(0,0,y,-cy)
                color = {color[1],color[2],1-y}
                local realcolor = Color3.fromHSV(color[1],color[2],color[3])
                DarknessCircle.BackgroundColor3 = realcolor
                callback(realcolor)
                
                update();
            end
            local function UpdateRing(iX,iY)
                local ml = mouseLocation()
                local x,y = ml.X - RGB.AbsolutePosition.X,ml.Y - RGB.AbsolutePosition.Y
                local maxX,maxY = RGB.AbsoluteSize.X,RGB.AbsoluteSize.Y
                if x<0 then 
                    x=0 
                end
                if x>maxX then 
                    x=maxX 
                end
                if y<0 then 
                    y=0 
                end
                if y>maxY then 
                    y=maxY
                end
                x = x/maxX
                y = y/maxY

                local cx = RGBCircle.AbsoluteSize.X/2
                local cy = RGBCircle.AbsoluteSize.Y/2
                
                RGBCircle.Position = udim2(x,-cx,y,-cy)
                
                color = {1-x,1-y,color[3]}
                local realcolor = Color3.fromHSV(color[1],color[2],color[3])
                Darkness.BackgroundColor3 = realcolor
                callback(realcolor)
                update();
            end


            RGB.MouseButton1Down:Connect(function()
                WheelDown = true
                UpdateRing(Mouse.X,Mouse.Y)
            end)
            Darkness.MouseButton1Down:Connect(function()
                SlideDown = true
                UpdateSlide(Mouse.X,Mouse.Y)
            end)


            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    WheelDown = false
                    SlideDown = false
                end
            end)

            RGB.MouseMoved:Connect(function()
                if WheelDown then
                    UpdateRing(Mouse.X,Mouse.Y)
                end
            end)
            Darkness.MouseMoved:Connect(function()
                if SlideDown then
                    UpdateSlide(Mouse.X,Mouse.Y)
                end
            end)
        end

        function elementHandler:Keybind(text, old, callback)
            text = text or "New Keybind"
            callback = callback or function() end

            local oldKey = old.Name
            local Keybind = Instance.new("TextButton")
            local keybindCorner = Instance.new("UICorner")
            local keybindLabel = Instance.new("TextLabel")

            Keybind.Name = "Keybind"
            Keybind.Parent = newPage
            Keybind.BackgroundColor3 = Color3.fromRGB(27, 29, 53)
            Keybind.BorderSizePixel = 0
            Keybind.Position = UDim2.new(0.0269320849, 0, 0, 0)
            Keybind.Size = UDim2.new(0, 404, 0, 34)
            Keybind.AutoButtonColor = false
            Keybind.Font = Enum.Font.Gotham
            Keybind.Text = text
            Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
            Keybind.TextSize = 17.000
            Keybind.MouseButton1Click:Connect(function()
                RippleEffect(Keybind)
                keybindLabel.Text = "..."
                local ib,ib2 = game:GetService("UserInputService").InputBegan:wait()
                if ib.KeyCode.Name ~= "Unknown" then 
                    keybindLabel.Text = ib.KeyCode.Name
                    oldKey = ib.KeyCode.Name
                end
            end)

            game:GetService("UserInputService").InputBegan:connect(function(key, focused)
                if not focused then
                    if key.KeyCode.Name == oldKey then
                        callback(oldKey)
                    end
                end
            end)

            keybindCorner.CornerRadius = UDim.new(0, 5)
            keybindCorner.Name = "keybindCorner"
            keybindCorner.Parent = Keybind

            keybindLabel.Parent = Keybind
            keybindLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            keybindLabel.BackgroundTransparency = 1.000
            keybindLabel.BorderSizePixel = 0
            keybindLabel.Position = UDim2.new(0.669554472, 0, 0, 0)
            keybindLabel.Size = UDim2.new(0, 121, 0, 34)
            keybindLabel.Font = Enum.Font.Gotham
            keybindLabel.Text = oldKey
            keybindLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            keybindLabel.TextSize = 16.000
            keybindLabel.TextXAlignment = Enum.TextXAlignment.Right
        end

        function elementHandler:TextBox(text, callback)
            text = text or "New Textbox"
            callback = callback or function() end

            local textboxLabel = Instance.new("TextLabel")
            local tbCorner = Instance.new("UICorner")
            local textBox = Instance.new("TextBox")

            textboxLabel.Name = "textboxLabel"
            textboxLabel.Parent = newPage
            textboxLabel.BackgroundColor3 = Color3.fromRGB(27, 29, 53)
            textboxLabel.BorderSizePixel = 0
            textboxLabel.Position = UDim2.new(0.265807956, 0, 0.120521173, 0)
            textboxLabel.Size = UDim2.new(0, 404, 0, 34)
            textboxLabel.Font = Enum.Font.Gotham
            textboxLabel.Text = "  "..text
            textboxLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
            textboxLabel.TextSize = 17.000
            textboxLabel.TextXAlignment = Enum.TextXAlignment.Left

            tbCorner.CornerRadius = UDim.new(0, 5)
            tbCorner.Name = "tbCorner"
            tbCorner.Parent = textboxLabel

            textBox.Parent = textboxLabel
            textBox.BackgroundColor3 = Color3.fromRGB(20, 22, 43)
            textBox.BorderSizePixel = 0
            textBox.Position = UDim2.new(0.465346545, 0, 0.205882356, 0)
            textBox.Size = UDim2.new(0, 200, 0, 20)
            textBox.Font = Enum.Font.Gotham
            textBox.PlaceholderText = "Type here"
            textBox.Text = ""
            textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            textBox.TextSize = 14.000

            textBox.Focused:Connect(function()
                TweenService:Create(textboxLabel, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            end)

            textBox.FocusLost:Connect(function(Enter)
                TweenService:Create(textboxLabel, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
                if Enter then
                    if textBox.Text ~= nil and textBox.Text ~= "" then
                        callback(textBox.Text)
                        local oldText = textBox.Text
                        textBox.Text = "Success!"
                        wait(1.2)
                        textBox.Text = oldText
                    end
                end
            end)
        end

        function elementHandler:Section(text, textsize)
            text = text or "New Section"
            textsize = textsize or tonumber(19)
            local sectionLabel = Instance.new("TextLabel")

            sectionLabel.Name = "sectionLabel"
            sectionLabel.Parent = newPage
            sectionLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sectionLabel.BackgroundTransparency = 1.000
            sectionLabel.Size = UDim2.new(0, 404, 0, 34)
            sectionLabel.Font = Enum.Font.Gotham
            sectionLabel.Text = " " .. text
            sectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            sectionLabel.TextSize = tonumber(textsize)
            sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
        end

        return elementHandler
    end

    return tabHandler
end

game:GetService('UserInputService').InputBegan:Connect(function(key, focused)
    if (not focused) then
        if (key.KeyCode == Library.Properties.UIToggleKey) then
            Library:Visible()
        end
    end
end)

return Library
