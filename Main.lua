if game.PlaceId == 155615604 then
	local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
	local Window = Library.CreateLib("Prison Life [BETA]", "Sentinel")
	local Main = Window:NewTab("Main")
	local Playerlol = Window:NewTab("Other")
	local player = game:GetService("Players").LocalPlayer
	local character = player.Character

	--MainScripts
	local Section1 = Main:NewSection("Main")
	-- Script generated by SimpleSpy - credits to exx#9394

	local Settings = {
		['Material'] = Enum.Material.Neon, -- Material
		['Color'] = Color3.fromRGB(50, 164, 168), -- Color
		['Transparency'] = 0.7 -- 0 to 1 Transparency
	}

	local ScreenGui = Instance.new('ScreenGui', game.CoreGui) -- Create screengui
	ScreenGui.IgnoreGuiInset = true

	local ViewportFrame = Instance.new('ViewportFrame', ScreenGui) -- Create viewport and define properties
	ViewportFrame.CurrentCamera = workspace.CurrentCamera
	ViewportFrame.Size = UDim2.new(1,0,1,0)
	ViewportFrame.BackgroundTransparency = 1
	ViewportFrame.ImageTransparency = Settings.Transparency

	local Chasms = {} -- Array for storing parts

	function generateChasm(player) -- functions that generates chasms for the player specififed
		local Character = workspace:FindFirstChild(player.Name)
		
		if Character then
			for _,Part in pairs(Character:GetChildren()) do
				if Part:IsA('Part') or Part:IsA('MeshPart') then
					local Chasm = Part:Clone()
					
					for _,Child in pairs(Chasm:GetChildren()) do
						if Child:IsA('Decal') then
							Child:Destroy()
						end
					end
					
					Chasm.Parent = ViewportFrame
					Chasm.Material = Settings.Material
					Chasm.Color = Settings.Color
					Chasm.Anchored = true
					
					table.insert(Chasms, Chasm)
				end
			end
		end
	end

	function clearChasms() -- remove all chasms
		for _,Chasm in pairs(Chasms) do
			Chasm:Destroy()
		end
		
		Chasms = {}
	end




	Section1:NewDropdown("Gun Giver", "Gives the selected gun", {"AK-47", "M9", "Remington-870"}, function(currentOption)
		local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver[currentOption].ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
	end)

    Section1:NewDropdown("Gun Mod", "Makes the gun op", {"M9", "Remington 870", "AK-47", "Tazer"}, function(weapon)
        local module = nil
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(weapon) then
            module = require(game:GetService("Players").LocalPlayer.Backpack[weapon].GunStates)
        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(weapon) then
            module = require(game:GetService("Players").LocalPlayer.Character[weapon].GunStates)
        end
        if module ~= nil then
            module["MaxAmmo"] = 100000000
            module["CurrentAmmo"] = 100000000
            module["StoredAmmo"] = 100000000
            module["FireRate"] = 0.3
            module["Spread"] = 0
            module["Range"] = math.huge
            module["Bullets"] = 10
            module["ReloadTime"] = 0.000001
            module["AutoFire"] = true
        end
    end)

	enabled = false
	Section1:NewButton("EnableESP", "ESP", function()
		if enabled == false then
			enabled = true
			while game:GetService('RunService').RenderStepped:Wait() do -- loop this process
				clearChasms()
				
				for _,Player in pairs(game:GetService('Players'):GetPlayers()) do
					if Player ~= game:GetService('Players').LocalPlayer then
						generateChasm(Player)
					end
				end
			end
		elseif enabled == true then
			print("Esp Already activated")
		end
	end)

	Section1:NewButton("Destroy all Doors", "DestroyDoors", function()
		game.Workspace.Doors:Destroy()
	end)

	Section1:NewButton("TP To Base", "TPToBase", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-943.981506, 100.1523933, 2058.73462)
	end)

	--Player things
	local Section2 = Playerlol:NewSection("Player")

	Section2:NewSlider("Walkspeed", "Changes your walk speed to a set amount.", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
	end)

	Section2:NewSlider("Jumppower", "Changes your jump power to a set amount.", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    	game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
	end)

end
