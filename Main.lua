if game.PlaceId == 155615604 then local r = loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\120\72\101\112\116\99\47\75\97\118\111\45\85\73\45\76\105\98\114\97\114\121\47\109\97\105\110\47\115\111\117\114\99\101\46\108\117\97"))() local f = r.CreateLib("\80\114\105\115\111\110\32\76\105\102\101\32\91\66\69\84\65\93", "\83\101\110\116\105\110\101\108") local p = f:NewTab("\77\97\105\110") local j = f:NewTab("\79\116\104\101\114") local o = game:GetService("\80\108\97\121\101\114\115").LocalPlayer local h = o.Character local m = p:NewSection("\77\97\105\110") local d = { ['Material'] = Enum.Material.Neon,  ['Color'] = Color3.fromRGB(50, 164, 168),  ['Transparency'] = 0.7  } local l = Instance.new('l', game.CoreGui)  l.IgnoreGuiInset = true local b = Instance.new('b', l)  b.CurrentCamera = workspace.CurrentCamera b.Size = UDim2.new(1,0,1,0) b.BackgroundTransparency = 1 b.ImageTransparency = d.Transparency local a = {}  function n(o)  local k = workspace:FindFirstChild(o.Name) if k then for _,Part in pairs(k:GetChildren()) do if Part:IsA('Part') or Part:IsA('MeshPart') then local _ = Part:Clone() for _,Child in pairs(_:GetChildren()) do if Child:IsA('Decal') then Child:Destroy() end end _.Parent = b _.Material = d.Material _.Color = d.Color _.Anchored = true table.insert(a, _) end end end end function i()  for _,_ in pairs(a) do _:Destroy() end a = {} end m:NewDropdown("\71\117\110\32\71\105\118\101\114", "\71\105\118\101\115\32\116\104\101\32\115\101\108\101\99\116\101\100\32\103\117\110", {"\65\75\45\52\55", "\77\57", "\82\101\109\105\110\103\116\111\110\45\56\55\48"}, function(q) local n_ = game:GetService("\87\111\114\107\115\112\97\99\101")["\80\114\105\115\111\110\95\73\84\69\77\83"].giver[q].ITEMPICKUP local c = game:GetService("\87\111\114\107\115\112\97\99\101").Remote.ItemHandler c:InvokeServer(n_) end) m:NewDropdown("\71\117\110\32\77\111\100", "\77\97\107\101\115\32\116\104\101\32\103\117\110\32\111\112", {"\77\57", "\82\101\109\105\110\103\116\111\110\32\56\55\48", "\65\75\45\52\55", "\84\97\122\101\114"}, function(g) local ic = nil if game:GetService("\80\108\97\121\101\114\115").LocalPlayer.Backpack:FindFirstChild(g) then ic = require(game:GetService("\80\108\97\121\101\114\115").LocalPlayer.Backpack[g].GunStates) elseif game:GetService("\80\108\97\121\101\114\115").LocalPlayer.Character:FindFirstChild(g) then ic = require(game:GetService("\80\108\97\121\101\114\115").LocalPlayer.Character[g].GunStates) end if ic ~= nil then ic["\77\97\120\65\109\109\111"] = 100000000 ic["\67\117\114\114\101\110\116\65\109\109\111"] = 100000000 ic["\83\116\111\114\101\100\65\109\109\111"] = 100000000 ic["\70\105\114\101\82\97\116\101"] = 0.3 ic["\83\112\114\101\97\100"] = 0 ic["\82\97\110\103\101"] = math.huge ic["\66\117\108\108\101\116\115"] = 10 ic["\82\101\108\111\97\100\84\105\109\101"] = 0.000001 ic["\65\117\116\111\70\105\114\101"] = true end end) enabled = false m:NewButton("\69\110\97\98\108\101\69\83\80", "\69\83\80", function() if enabled == false then enabled = true while game:GetService('RunService').RenderStepped:Wait() do  i() for _,Player in pairs(game:GetService('Players'):GetPlayers()) do if Player ~= game:GetService('Players').LocalPlayer then n(Player) end end end elseif enabled == true then print("\69\115\112\32\65\108\114\101\97\100\121\32\97\99\116\105\118\97\116\101\100") end end) m:NewButton("\68\101\115\116\114\111\121\32\97\108\108\32\68\111\111\114\115", "\68\101\115\116\114\111\121\68\111\111\114\115", function() game.Workspace.Doors:Destroy() end) m:NewButton("\84\80\32\84\111\32\66\97\115\101", "\84\80\84\111\66\97\115\101", function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-943.981506, 100.1523933, 2058.73462) end) local qi = j:NewSection("\80\108\97\121\101\114") qi:NewSlider("\87\97\108\107\115\112\101\101\100", "\67\104\97\110\103\101\115\32\121\111\117\114\32\119\97\108\107\32\115\112\101\101\100\32\116\111\32\97\32\115\101\116\32\97\109\111\117\110\116\46", 500, 0, function(r)  game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = r end) qi:NewSlider("\74\117\109\112\112\111\119\101\114", "\67\104\97\110\103\101\115\32\121\111\117\114\32\106\117\109\112\32\112\111\119\101\114\32\116\111\32\97\32\115\101\116\32\97\109\111\117\110\116\46", 500, 0, function(r)  game.Players.LocalPlayer.Character.Humanoid.JumpPower = r end) end
