function getLocalPlrKnife()
    if game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool") then
        return game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
    
    elseif game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
        
        return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    else
        return false
    end
end


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()


local Window = Library.CreateLib("Knife Strife | Hack | Dreamer#5114", "Ocean")

local PlayerTab = Window:NewTab("Player")
local TrollTab = Window:NewTab("Troll")
local KnifeTab = Window:NewTab("Knife")
local CreditTab = Window:NewTab("Credits")


local PlayerTabSection = PlayerTab:NewSection("Player")
local TrollTabSection = TrollTab:NewSection("Trolls lul")
local KnifeTabSection = KnifeTab:NewSection("Knife Hax")
CreditTab:NewSection("Discord: Dreamer#5114")
CreditTab:NewSection("By: vroom12345678910")
CreditTab:NewSection("UI Used: Kavo-UI-Library")

PlayerTabSection:NewTextBox("WalkSpeed", "", function(speed)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(speed)
end)

PlayerTabSection:NewTextBox("JumpPower", "", function(power)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(power)
end)

PlayerTabSection:NewTextBox("Teleport", "", function(player)
    for _, v in pairs(game.Players:GetChildren()) do
        if string.find(string.lower(v.Name), string.lower(player)) or string.find(string.lower(v.DisplayName), string.lower(player))  then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[tostring(v.Name)].Character.HumanoidRootPart.CFrame
        end
    end
end)
PlayerTabSection:NewButton("Teleport to Spawn", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8, 291, 41)
end)

PlayerTabSection:NewButton("Inf Jump", "", function()
    game:GetService("UserInputService").JumpRequest:connect(function()
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end)
end)

TrollTabSection:NewToggle("Kill-Aura", "", function(boolean)
    getgenv().killaura = boolean
    while getgenv().killaura and wait() do
    	for i,v in pairs(game.Players:GetChildren()) do
    		if v ~= game.Players.LocalPlayer and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.Character.HumanoidRootPart.Position).magnitude <= 7 then
                while game.Players[tostring(v.Name)].Character.Humanoid.Health ~= 0 and wait() do
                    getLocalPlrKnife().Knife.Remote:FireServer("Hit", game.Workspace[tostring(v)].Humanoid);
                end
    		end
    	end
    end
end)
TrollTabSection:NewToggle("Loop-Kill All/Autofarm Slash", "", function(boolean)
    getgenv().kill = boolean
    
    if not getLocalPlrKnife() then
        game:GetService("Workspace")[game.Players.LocalPlayer.Name].clientMain.Remote:FireServer("Teleport")
    end
    wait()
    while getgenv().kill do
        for i,v in pairs(game.Players:GetChildren()) do
            if v ~= game.Players.LocalPlayer then
                while v.Character.Humanoid.Health ~= 0 do
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                    getLocalPlrKnife().Knife.Remote:FireServer("Hit", game.Workspace[tostring(v)].Humanoid);
                    wait()
                end
            end
        end
    end
end)

TrollTabSection:NewTextBox("Kill", "", function(player)
    if not getLocalPlrKnife() then
        game:GetService("Workspace")[game.Players.LocalPlayer.Name].clientMain.Remote:FireServer("Teleport")
    end
    wait()
    for _, v in pairs(game.Players:GetChildren()) do
        if string.find(string.lower(v.Name), string.lower(player)) or string.find(string.lower(v.DisplayName), string.lower(player)) then
            local cframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            while game.Players[tostring(v.Name)].Character.Humanoid.Health ~= 0 do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                getLocalPlrKnife().Knife.Remote:FireServer("Hit", game.Workspace[tostring(v)].Humanoid);
                wait()
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
        end
    end
end)
TrollTabSection:NewButton("Anti-Admin", "", function()
    local poopooheads = {81334428, 1719370220, 1996279003, 265927338, 406518318, 1181002466, 3189375549, 312022172, 1657843102, 364689597, 3826346538, 3022217106, 2265072978}
    for i, player in pairs(game.Players:GetChildren()) do
        if table.find(poopooheads, player.UserId) then
            game.Players.LocalPlayer:Kick("Anti-Admin.\nUser Id:" ..tostring(player.UserId) .."\nUsername: " ..tostring(player.Name) .."\nDisplay Name: " ..tostring(player.DisplayName))
        end
    end
    
    game.Players.PlayerAdded:Connect(function(player) 
        if table.find(poopooheads, player.UserId) then
            game.Players.LocalPlayer:Kick("Anti-Admin.\nUser Id:" ..tostring(player.UserId) .."\nUsername: " ..tostring(player.Name) .."\nDisplay Name: " ..tostring(player.DisplayName))
        end
    end)
end)

KnifeTabSection:NewToggle("No Knife Swing Cool-Down (ONLY W/ ONE)", "", function(boolean)
    getgenv().noswingcooldown = boolean
    
    local knifeScript = getsenv(getLocalPlrKnife().Knife)
    local knifeSwing  = debug.getupvalues(knifeScript["swing"])[1]
    
    while getgenv().noswingcooldown and wait() do
        knifeSwing["CanSwing"] = true
    end
end)

KnifeTabSection:NewToggle("No Ability Cool-Down (PRESS E TO WORK)", "i like to use this with sniper knife", function(boolean) --basically it just switches to a duped knife that has it's ability ready to use.
    getgenv().noabilitycooldown = boolean
    local keybindConnection
    if getgenv().noabilitycooldown then
        for i=0, 500 do
            game:GetService("Workspace")[game.Players.LocalPlayer.Name].clientMain.Remote:FireServer("Teleport")
        end
        wait()
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
    end
    keybindConnection = game:GetService("UserInputService").InputBegan:Connect(function(InputObject, GameProcessedEvent)
        
        if getgenv().noabilitycooldown and not GameProcessedEvent and InputObject.KeyCode == Enum.KeyCode.E then
            wait(0.5)
            game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:GetChildren()[math.random(1, #game.Players.LocalPlayer.Backpack:GetChildren())])
        elseif not getgenv().noabilitycooldown then
            keybindConnection:Disconnect()
        end
    end)
end)

KnifeTabSection:NewTextBox("Dupe Knives, Amount:", "", function(amount)
    for i=1, amount do
        game:GetService("Workspace")[game.Players.LocalPlayer.Name].clientMain.Remote:FireServer("Teleport")
    end
end)

KnifeTabSection:NewButton("Equip All Knives", "", function()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        v.Parent = game.Players.LocalPlayer.Character
    end
end)

KnifeTabSection:NewButton("Remove All Knives", "", function()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        v:Destroy()
    end
end)
--gig
