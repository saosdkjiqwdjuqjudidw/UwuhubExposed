
-- Detected obfuscation: Luraph v15
-- Local names are inferred from use (the original names are not in the bytecode)

local function fn(arg)
	local n = arg or 8
	local str = ""

	for i = 1, n do
		local n2 = math.random(1, 62)
		str ..= string.sub("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", n2, n2)
	end

	return str
end

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local localPlayer = Players.LocalPlayer

local tbl = {
	w = 87,
	a = 65,
	s = 83,
	d = 68,
	space = 32,
	e = 69,
	q = 81,
	f = 70,
	r = 82,
	t = 84,
	y = 89,
	x = 88,
	c = 67,
	v = 86,
	b = 66,
	g = 71,
	h = 72,
	z = 90,
	["1"] = 49,
	["2"] = 50,
	["3"] = 51,
	["4"] = 52,
	["5"] = 53,
	["6"] = 54,
	["7"] = 55,
	["8"] = 56,
	["9"] = 57,
	["0"] = 48,
}

local function fn2(arg)
	if type(keypress) == "function" and type(keyrelease) == "function" then
		local v = tbl[string.lower(tostring(arg))]

		if v then
			keypress(v)
			task.wait(0.05)
			keyrelease(v)
			return true
		end
	end

	return false
end

local function fn3(arg)
	local character = localPlayer.Character
	if not character or not character:FindFirstChild("HumanoidRootPart") then
		return
	end
	local humanoidRootPart = character.HumanoidRootPart
	humanoidRootPart.Velocity = Vector3.zero
	humanoidRootPart.RotVelocity = Vector3.zero
	humanoidRootPart.Anchored = true
	character:PivotTo(arg)
	task.wait()
	humanoidRootPart.Velocity = Vector3.zero
	humanoidRootPart.Anchored = false
end

local HBGQTE = nil

local function fn4()
	if not HBGQTE then
		pcall(function()
			local ReplicatedStorage = game:GetService("ReplicatedStorage")
			local modules = ReplicatedStorage:FindFirstChild("Modules")

			if modules and modules:FindFirstChild("HBGQTE") then
				HBGQTE = require(modules.HBGQTE)
			else
				for _, descendant in ipairs(ReplicatedStorage:GetDescendants()) do
					if descendant.Name == "HBGQTE" and descendant:IsA("ModuleScript") then
						HBGQTE = require(descendant)
						break
					end
				end
			end
		end)
	end

	return HBGQTE
end

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/platinww/CrustyUI/refs/heads/main/WizardRemake.lua"))()
lib.ConfigFolder = "UwU"
lib:SetToggleKey(Enum.KeyCode.F5)
local v = lib:NewWindow("UwU Safe")
local v2 = v:NewSection("Red Light Green Light")

v2:CreateButton("TP End", function()
	fn3(CFrame.new(-45, 1025, 137))
end)

v2:CreateButton("Remove Injury", function()
	local character = localPlayer.Character
	if not character then
		return
	end
	local humanoid = character:FindFirstChildOfClass("Humanoid")

	for _, v3 in ipairs({ "InjuredWalking", "CantRun", "Hurt" }) do
		local v4 = character:FindFirstChild(v3)

		if v4 then
			pcall(function()
				v4:Destroy()
			end)
		end
	end

	for _, child in ipairs(character:GetChildren()) do
		if string.find(string.lower(child.Name), "injured") or child.Name == "Stun" and child:GetAttribute("InjuredWalking") then
			pcall(function()
				child:Destroy()
			end)
		end
	end

	for _, v3 in ipairs({ "InjuredWalking", "CantRun", "Injured" }) do
		if character:GetAttribute(v3) ~= nil then
			character:SetAttribute(v3, nil)
		end

		if localPlayer:GetAttribute(v3) ~= nil then
			localPlayer:SetAttribute(v3, nil)
		end
	end

	if humanoid then
		local animator = humanoid:FindFirstChildOfClass("Animator")

		if animator then
			for _, v3 in ipairs(animator:GetPlayingAnimationTracks()) do
				local v4 = string.lower(v3.Name or "")
				local v5 = string.lower(tostring(v3.Animation and v3.Animation.AnimationId or ""))

				if string.find(v4, "injured") or string.find(v4, "hurt") or string.find(v5, "injured") or string.find(v5, "hurt") then
					pcall(function()
						v3:Stop()
					end)
				end
			end
		end

		if humanoid.WalkSpeed < 14 then
			humanoid.WalkSpeed = 14
		end
	end
end)

v2:CreateButton("Remove Crawl", function()
	local character = localPlayer.Character
	if not character then
		return
	end
	local humanoid = character:FindFirstChildOfClass("Humanoid")

	for _, v3 in ipairs({ "Crawling", "Crawl", "Downed", "Down", "CrawlFolder" }) do
		local v4 = character:FindFirstChild(v3)

		if v4 then
			pcall(function()
				v4:Destroy()
			end)
		end
	end

	for _, child in ipairs(character:GetChildren()) do
		local v3 = string.lower(child.Name)

		if string.find(v3, "crawl") or string.find(v3, "downed") then
			pcall(function()
				child:Destroy()
			end)
		end
	end

	for _, v3 in ipairs({ "Crawling", "Crawl", "Downed", "Down", "IsCrawling", "IsDowned" }) do
		if character:GetAttribute(v3) ~= nil then
			character:SetAttribute(v3, nil)
		end

		if localPlayer:GetAttribute(v3) ~= nil then
			localPlayer:SetAttribute(v3, nil)
		end
	end

	if humanoid then
		local animator = humanoid:FindFirstChildOfClass("Animator")

		if animator then
			for _, v3 in ipairs(animator:GetPlayingAnimationTracks()) do
				local v4 = string.lower(v3.Name or "")
				local v5 = string.lower(tostring(v3.Animation and v3.Animation.AnimationId or ""))

				if string.find(v4, "crawl") or string.find(v5, "crawl") then
					pcall(function()
						v3:Stop()
					end)
				end
			end
		end

		humanoid.PlatformStand = false
		humanoid.Sit = false
		humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

		if humanoid.WalkSpeed < 14 then
			humanoid.WalkSpeed = 14
		end
	end
end)

local Dalgona = v:NewSection("Dalgona")
local connection = nil
local tbl2 = {}

local function fn5()
	local effects = Workspace:FindFirstChild("Effects")

	if effects then
		for _, child in pairs(effects:GetChildren()) do
			if child:IsA("Model") and string.match(child.Name, "Outline$") then
				return child
			end
		end
	end

	for _, child in pairs(Workspace:GetChildren()) do
		if child:IsA("Model") and string.match(child.Name, "Outline$") then
			return child
		end
	end

	return nil
end

local function fn6()
	for k, v3 in pairs(tbl2) do
		if k and k.Parent then
			pcall(function()
				k.Position = v3.Position
				k.Transparency = v3.Transparency
			end)
		end
	end

	table.clear(tbl2)
end

local function fn7()
	local getupvalues_ = debug and (debug.getupvalues or debug.get_upvalues) or getupvalues
	local setupvalue_ = debug and (debug.setupvalue or debug.setup_value) or setupvalue
	local getconstants_ = debug and (debug.getconstants or debug.get_constants) or getconstants

	local function fn8()
		local v3 = getgc and getupvalues_ and setupvalue_
		local flag = false

		if v3 then
			local v4 = getgc()

			if type(v4) == "table" then
				for _, v5 in ipairs(v4) do
					if type(v5) == "function" then
						local result = nil

						if getconstants_ then
							local ok
							ok, result = pcall(getconstants_, v5)
							local v6 = nil

							if not ok then
								result = v6
							end
						end

						if type(result) == "table" then
							local flag2 = false

							for _, v6 in pairs(result) do
								if v6 == "Progress" or v6 == "Completed" then
									flag2 = true
									break
								elseif type(v6) == "string" and string.find(v6, "%%", 1, true) then
									flag2 = true
									break
								end
							end

							if flag2 then
								local ok, result2 = pcall(getupvalues_, v5)

								if ok and type(result2) == "table" then
									for k, v6 in pairs(result2) do
										if type(v6) == "number" and v6 == v6 and v6 >= 0 and v6 < 50000 then
											if pcall(setupvalue_, v5, k, 100000) then
												flag = true
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end

		pcall(function()
			local effects = Workspace:FindFirstChild("Effects")

			if effects then
				for _, child in ipairs(effects:GetChildren()) do
					if child.Name and string.find(child.Name, "Outline") then
						for _, descendant in ipairs(child:GetDescendants()) do
							if descendant:IsA("BasePart") then
								descendant:SetAttribute("Done", true)
							end
						end
					end
				end
			end
		end)

		pcall(function()
			local effects = Workspace:FindFirstChild("Effects")

			if effects then
				for _, child in ipairs(effects:GetChildren()) do
					local name = child.Name

					if name then
						name = string.find(child.Name, "Crack") or string.find(child.Name, "Shattered") or string.find(child.Name, "Fragment")
					end

					if name then
						pcall(function()
							child:Destroy()
						end)
					end
				end
			end
		end)

		pcall(function()
			local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
			remotes = remotes and remotes:FindFirstChild("DALGONATEMPREMPTE")

			if remotes then
				remotes:FireServer({ Completed = true })
				remotes:FireServer({ Success = true })
			end
		end)

		return flag
	end

	task.spawn(function()
		for i = 1, 10 do
			fn8()
			task.wait(0.15)
		end
	end)
end

Dalgona:CreateButton("Auto Complete Dalgona", function()
	fn7()
end)

Dalgona:CreateToggle("One Click Complete", function(arg)
	if arg then
		if not connection then
			connection = RunService.RenderStepped:Connect(function()
				pcall(function()
					local mouse = localPlayer:GetMouse()
					if not mouse or not mouse.Hit then
						return
					end
					local v3 = fn5()

					if v3 then
						local position = mouse.Hit.Position

						for _, child in ipairs(v3:GetChildren()) do
							if child:IsA("BasePart") and not child:GetAttribute("Done") then
								if not tbl2[child] then
									tbl2[child] = { Position = child.Position, Transparency = child.Transparency }
								end

								child.Position = position
								child.Transparency = 1
							end
						end
					end
				end)
			end)
		end
	else
		if connection then
			pcall(function()
				connection:Disconnect()
			end)

			connection = nil
		end

		fn6()
	end
end)

v:NewSection("Lights Out"):CreateButton("TP To Roof", function()
	fn3(CFrame.new(198, 145, -93))
end)

local v3 = v:NewSection("Hide and Seek")

v3:CreateButton("Auto Escape", function()
	fn3(CFrame.new(199, 54, -88))
end)

local flag = false
local tbl3 = {}
local tbl4 = {}

local function fn8(arg)
	if not flag or arg == localPlayer then
		return
	end
	local character = arg.Character
	if not character then
		return
	end

	if tbl3[arg] then
		pcall(function()
			tbl3[arg]:Destroy()
		end)

		tbl3[arg] = nil
	end

	local highlight = Instance.new("Highlight")
	highlight.Name = fn()
	highlight.FillTransparency = 0.4
	highlight.OutlineTransparency = 0
	local attribute = arg:GetAttribute("IsHunter")
	local attribute2 = arg:GetAttribute("IsHider")

	if attribute then
		highlight.FillColor = Color3.fromRGB(255, 50, 50)
		highlight.OutlineColor = Color3.fromRGB(200, 30, 30)
	elseif attribute2 then
		highlight.FillColor = Color3.fromRGB(50, 255, 50)
		highlight.OutlineColor = Color3.fromRGB(30, 200, 30)
	else
		highlight.FillColor = Color3.fromRGB(0, 200, 255)
		highlight.OutlineColor = Color3.fromRGB(0, 150, 200)
	end

	highlight.Adornee = character
	highlight.Parent = character
	tbl3[arg] = highlight
end

local function fn9()
	for _, v4 in pairs(tbl4) do
		if v4 and v4.Connected then
			pcall(function()
				v4:Disconnect()
			end)
		end
	end

	table.clear(tbl4)

	for _, v4 in pairs(tbl3) do
		if v4 and v4.Parent then
			pcall(function()
				v4:Destroy()
			end)
		end
	end

	table.clear(tbl3)
end

local function fn10(arg)
	if arg == localPlayer then
		return
	end

	table.insert(tbl4, arg:GetAttributeChangedSignal("IsHider"):Connect(function()
		if flag then
			fn8(arg)
		end
	end))

	table.insert(tbl4, arg:GetAttributeChangedSignal("IsHunter"):Connect(function()
		if flag then
			fn8(arg)
		end
	end))

	table.insert(tbl4, arg.CharacterAdded:Connect(function()
		task.wait(0.5)

		if flag then
			fn8(arg)
		end
	end))

	fn8(arg)
end

v3:CreateToggle("ESP Players", function(arg)
	flag = arg

	if flag then
		fn9()

		for _, player in pairs(Players:GetPlayers()) do
			fn10(player)
		end

		table.insert(tbl4, Players.PlayerAdded:Connect(function(player)
			task.wait(1)

			if flag then
				fn10(player)
			end
		end))

		table.insert(tbl4, Players.PlayerRemoving:Connect(function(player)
			if tbl3[player] then
				pcall(function()
					tbl3[player]:Destroy()
				end)

				tbl3[player] = nil
			end
		end))
	else
		fn9()
	end
end)

local flag2 = false
local thread = nil
local tbl5 = {}

local function fn11()
	for _, v4 in pairs(tbl5) do
		if v4 and v4.Parent then
			pcall(function()
				v4:Destroy()
			end)
		end
	end

	table.clear(tbl5)
end

v3:CreateToggle("ESP Keys", function(arg)
	flag2 = arg

	if flag2 then
		if thread then
			return
		end

		thread = task.spawn(function()
			while flag2 do
				local effects = Workspace:FindFirstChild("Effects")

				if effects then
					for _, child in ipairs(effects:GetChildren()) do
						if string.sub(child.Name, 1, 10) == "DroppedKey" and not child:FindFirstChildOfClass("BillboardGui") then
							local str = string.sub(child.Name, 11)
							local text = "Key"

							if str ~= "" then
								text = "Key " .. str
							end

							local billboardGui = Instance.new("BillboardGui")
							billboardGui.Name = fn()
							billboardGui.AlwaysOnTop = true
							billboardGui.Size = UDim2.new(0, 100, 0, 30)
							billboardGui.StudsOffset = Vector3.new(0, 1.5, 0)
							local textLabel = Instance.new("TextLabel")
							textLabel.Name = fn()
							textLabel.Size = UDim2.new(1, 0, 1, 0)
							textLabel.BackgroundTransparency = 1
							textLabel.Text = text
							textLabel.TextColor3 = Color3.new(1, 1, 0)
							textLabel.TextStrokeTransparency = 0
							textLabel.TextSize = 14
							textLabel.Font = Enum.Font.GothamBold
							textLabel.Parent = billboardGui
							billboardGui.Parent = child
							table.insert(tbl5, billboardGui)
						end
					end
				end

				task.wait(1.5)
			end

			fn11()
			thread = nil
		end)
	else
		fn11()
		thread = nil
	end
end)

local flag3 = false
local thread2 = nil
local tbl6 = {}

local function fn12()
	for _, v4 in pairs(tbl6) do
		if v4 and v4.Parent then
			pcall(function()
				v4:Destroy()
			end)
		end
	end

	table.clear(tbl6)
end

v3:CreateToggle("ESP Exit Doors", function(arg)
	flag3 = arg

	if flag3 then
		if thread2 then
			return
		end

		thread2 = task.spawn(function()
			while flag3 do
				local hideAndSeekMap = Workspace:FindFirstChild("HideAndSeekMap")
				hideAndSeekMap = hideAndSeekMap and hideAndSeekMap:FindFirstChild("NEWFIXEDDOORS")
				hideAndSeekMap = hideAndSeekMap and hideAndSeekMap:FindFirstChild("Floor1")
				hideAndSeekMap = hideAndSeekMap and hideAndSeekMap:FindFirstChild("EXITDOORS")

				if hideAndSeekMap then
					for _, child in ipairs(hideAndSeekMap:GetChildren()) do
						if child.Name == "EXITDOOR" and not child:FindFirstChildOfClass("Highlight") then
							local highlight = Instance.new("Highlight")
							highlight.Name = fn()
							highlight.FillColor = Color3.new(1, 0, 0)
							highlight.OutlineColor = Color3.new(1, 0, 0)
							highlight.FillTransparency = 0.5
							highlight.OutlineTransparency = 0
							highlight.Parent = child
							table.insert(tbl6, highlight)
						end
					end
				end

				task.wait(1.5)
			end

			fn12()
			thread2 = nil
		end)
	else
		fn12()
		thread2 = nil
	end
end)

local flag4 = false
local connection2 = nil
local connection3 = nil
local tbl7 = {}
local rotation = nil

local function fn13()
	local playerGui = localPlayer:FindFirstChild("PlayerGui")
	if not playerGui then
		return nil
	end
	local tugOfWarUIV2 = playerGui:FindFirstChild("TugOfWarUIV2") or playerGui:FindFirstChild("TugOfWarUI") or playerGui:FindFirstChild("TugofWarRemake")

	if not tugOfWarUIV2 then
		for _, child in ipairs(playerGui:GetChildren()) do
			if child:IsA("ScreenGui") and child.Enabled then
				local circleBase = child:FindFirstChild("CircleBase", true)
				if circleBase and circleBase.Visible then
					return circleBase
				end
			end
		end

		return nil
	end

	local tugofWarRemake = tugOfWarUIV2:FindFirstChild("TugofWarRemake") or tugOfWarUIV2
	tugofWarRemake = tugofWarRemake and tugofWarRemake:FindFirstChild("CircleBase")
	if tugofWarRemake and tugofWarRemake.Visible then
		return tugofWarRemake
	end
	return nil
end

local function fn14()
	for _, v4 in ipairs(tbl7) do
		if v4 and v4.Parent then
			pcall(function()
				v4:Destroy()
			end)
		end
	end

	table.clear(tbl7)
end

v:NewSection("Tug of War"):CreateToggle("Hit Zone 80%", function(arg)
	flag4 = arg

	if flag4 then
		fn14()

		if connection2 then
			pcall(function()
				connection2:Disconnect()
			end)
		end

		if connection3 then
			pcall(function()
				connection3:Disconnect()
			end)
		end

		local v4 = nil

		connection2 = RunService.RenderStepped:Connect(function()
			if not flag4 then
				return
			end
			local v5 = fn13()

			if v5 then
				local medium = v5:FindFirstChild("Medium")

				if not medium then
					for _, child in ipairs(v5:GetChildren()) do
						if child:IsA("ImageLabel") and child.Name ~= "Arrow" and child.Name ~= "CircleBase" then
							medium = child
							break
						end
					end
				end

				if medium and medium:IsA("GuiObject") then
					if not rotation then
						rotation = medium.Rotation
					end

					if v5 ~= v4 or #tbl7 == 0 then
						fn14()
						v4 = v5

						for i = -140, 140, 12 do
							if i ~= 0 then
								local clone = medium:Clone()
								clone.Name = fn()
								clone.Rotation = (rotation + i) % 360
								clone.ZIndex = medium.ZIndex
								clone.Parent = v5
								table.insert(tbl7, clone)
							end
						end
					end
				end
			elseif #tbl7 > 0 then
				fn14()
				v4 = nil
				rotation = nil
			end
		end)

		connection3 = UserInputService.InputBegan:Connect(function(input)
			if not flag4 then
				return
			end

			if input.KeyCode == Enum.KeyCode.Space or input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				local v5 = fn13()

				if v5 then
					local arrow = v5:FindFirstChild("Arrow")
					local medium = v5:FindFirstChild("Medium")

					if arrow and medium then
						medium.Rotation = arrow.Rotation
					end
				end
			end
		end)
	else
		if connection2 then
			pcall(function()
				connection2:Disconnect()
			end)

			connection2 = nil
		end

		if connection3 then
			pcall(function()
				connection3:Disconnect()
			end)

			connection3 = nil
		end

		fn14()
		rotation = nil
	end
end)

local flag5 = false
local tbl8 = {}
local thread3 = nil

local function fn15()
	for _, v4 in pairs(tbl8) do
		if v4 and v4.Parent then
			pcall(function()
				v4:Destroy()
			end)
		end
	end

	table.clear(tbl8)
end

local function fn16(adornee)
	if not adornee:IsA("Model") or not adornee.PrimaryPart then
		return
	end
	local primaryPart = adornee.PrimaryPart
	local flag6 = primaryPart:GetAttribute("DelayedGlass") == true or primaryPart:GetAttribute("DelayedKilling") == true or primaryPart:GetAttribute("DelayedTime") and primaryPart:GetAttribute("DelayedTime") > 0
	local flag7 = primaryPart:GetAttribute("exploitingisevil") == true or primaryPart:GetAttribute("ActuallyKilling") == true

	if not flag6 and not flag7 then
		for _, descendant in ipairs(adornee:GetDescendants()) do
			if descendant:IsA("BasePart") then
				if descendant:GetAttribute("DelayedGlass") == true or descendant:GetAttribute("DelayedKilling") == true or descendant:GetAttribute("DelayedTime") and descendant:GetAttribute("DelayedTime") > 0 then
					flag6 = true
					break
				elseif descendant:GetAttribute("ActuallyKilling") == true or descendant:GetAttribute("exploitingisevil") == true then
					flag7 = true
				end
			end
		end
	end

	local color

	if flag6 then
		color = Color3.fromRGB(255, 140, 0)
	elseif flag7 then
		color = Color3.fromRGB(255, 50, 50)
	else
		color = Color3.fromRGB(50, 255, 50)
	end

	local v4 = tbl8[adornee]

	if not v4 or not v4.Parent then
		local highlight = Instance.new("Highlight")
		highlight.Name = fn()
		highlight.FillTransparency = 0.5
		highlight.OutlineTransparency = 0
		highlight.OutlineColor = Color3.new(1, 1, 1)
		highlight.FillColor = color
		highlight.Adornee = adornee
		highlight.Parent = adornee
		tbl8[adornee] = highlight
	elseif v4.FillColor ~= color then
		v4.FillColor = color
	end
end

v:NewSection("Glass Bridge"):CreateToggle("Glass ESP", function(arg)
	flag5 = arg

	if flag5 then
		if thread3 then
			return
		end

		thread3 = task.spawn(function()
			while flag5 do
				local glassBridge = Workspace:FindFirstChild("GlassBridge")

				if glassBridge then
					local glassHolder = glassBridge:FindFirstChild("GlassHolder")

					if glassHolder then
						for _, child in ipairs(glassHolder:GetChildren()) do
							for _, child2 in ipairs(child:GetChildren()) do
								fn16(child2)
							end
						end
					end
				end

				task.wait(1.5)
			end

			fn15()
			thread3 = nil
		end)
	else
		fn15()
		thread3 = nil
	end
end)

local Utilities = v:NewSection("Utilities")
local hui = gethui and gethui() or game:GetService("CoreGui"):FindFirstChild("RobloxGui") or game:GetService("CoreGui") or localPlayer:WaitForChild("PlayerGui")
local flag6 = false
local tbl9 = {}
local connection4 = nil

local function fn17(arg, arg2)
	return math.floor((arg - arg2).Magnitude)
end

local function fn18()
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= localPlayer then
			local character = player.Character
			local head = character and character:FindFirstChild("Head")
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")

			if flag6 and head and humanoid and humanoid.Health > 0 then
				local billboardGui = tbl9[player]

				if not billboardGui or not billboardGui.Parent then
					billboardGui = Instance.new("BillboardGui")
					billboardGui.Name = fn()
					billboardGui.AlwaysOnTop = true
					billboardGui.Size = UDim2.new(0, 200, 0, 45)
					billboardGui.StudsOffset = Vector3.new(0, 3.5, 0)
					local textLabel = Instance.new("TextLabel")
					textLabel.Name = fn()
					textLabel.BackgroundTransparency = 1
					textLabel.Size = UDim2.new(1, 0, 1, 0)
					textLabel.Text = ""
					textLabel.TextColor3 = Color3.new(1, 1, 1)
					textLabel.TextStrokeTransparency = 0
					textLabel.Font = Enum.Font.GothamBold
					textLabel.TextSize = 11
					textLabel.Parent = billboardGui

					pcall(function()
						billboardGui.Parent = hui
					end)

					tbl9[player] = billboardGui
				end

				billboardGui.Adornee = head
				local textLabel = billboardGui:FindFirstChildOfClass("TextLabel")

				if textLabel then
					local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("HumanoidRootPart")
					local n = 0

					if humanoidRootPart then
						n = fn17(localPlayer.Character.HumanoidRootPart.Position, character.HumanoidRootPart.Position)
					end

					local n2 = math.floor(humanoid.Health)
					local n3 = math.floor(humanoid.MaxHealth)
					textLabel.Text = string.format("%s\nHP: %d/%d | [%ds]", player.DisplayName, n2, n3, n)

					if n2 / n3 > 0.7 then
						textLabel.TextColor3 = Color3.fromRGB(80, 255, 80)
					elseif n2 / n3 > 0.35 then
						textLabel.TextColor3 = Color3.fromRGB(255, 180, 50)
					else
						textLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
					end
				end
			elseif tbl9[player] then
				pcall(function()
					tbl9[player]:Destroy()
				end)

				tbl9[player] = nil
			end
		end
	end
end

Utilities:CreateToggle("Player ESP", function(arg)
	flag6 = arg

	if flag6 then
		if not connection4 then
			connection4 = RunService.RenderStepped:Connect(fn18)
		end
	else
		if connection4 then
			connection4:Disconnect()
			connection4 = nil
		end

		for _, v4 in pairs(tbl9) do
			if v4 then
				pcall(function()
					v4:Destroy()
				end)
			end
		end

		table.clear(tbl9)
	end
end)

local flag7 = false
local connection5 = nil

Utilities:CreateToggle("Auto QTE", function(arg)
	flag7 = arg

	if flag7 then
		if not connection5 then
			local tbl10 = {}

			connection5 = RunService.RenderStepped:Connect(function()
				if not flag7 then
					return
				end
				local v4 = fn4()

				if v4 and v4.ActiveButtons then
					for k, activeButton in pairs(v4.ActiveButtons) do
						if not tbl10[k] and activeButton then
							local inner = activeButton.Inner
							local outer = activeButton.Outer
							local v5 = string.lower(tostring(activeButton.Key or activeButton.Letter or activeButton.Input or k))

							if inner and outer and inner.Parent and outer.Parent then
								local magnitude = (inner.AbsolutePosition + inner.AbsoluteSize / 2 - outer.AbsolutePosition + outer.AbsoluteSize / 2).Magnitude
								local x = inner.AbsoluteSize.X
								local x2 = outer.AbsoluteSize.X

								if magnitude <= 8 and x <= x2 + 4 and x >= x2 - 16 then
									tbl10[k] = true

									if tbl[v5] then
										task.spawn(fn2, v5)
									end

									pcall(function()
										v4.Pressed(false, activeButton)
									end)
								end
							else
								tbl10[k] = true

								if tbl[v5] then
									task.spawn(fn2, v5)
								end

								pcall(function()
									v4.Pressed(false, activeButton)
								end)
							end
						end
					end

					for k in pairs(tbl10) do
						if not v4.ActiveButtons[k] then
							tbl10[k] = nil
						end
					end
				end
			end)
		end
	elseif connection5 then
		pcall(function()
			connection5:Disconnect()
		end)

		connection5 = nil
	end
end)

local flag8 = false
local tbl10 = {}
local tbl11 = {}

local function fn19(arg)
	if not arg or not arg.Character then
		return
	end
	local head = arg.Character:FindFirstChild("Head")
	local attribute = arg:GetAttribute("_EquippedPower")
	local flag9 = attribute and attribute ~= "" and attribute ~= "None" and attribute ~= "Yok"
	local v4 = flag8
	local v5

	if flag8 then
		v5 = head
	else
		v5 = v4
	end

	if v5 and flag9 then
		local text = tostring(attribute)
		local v6 = tbl11[arg]

		if not v6 then
			local billboardGui = Instance.new("BillboardGui")
			billboardGui.Name = fn()
			billboardGui.AlwaysOnTop = false
			billboardGui.Size = UDim2.new(0, 100, 0, 20)
			billboardGui.StudsOffset = Vector3.new(0, 1.5, 0)
			local textLabel = Instance.new("TextLabel")
			textLabel.Name = fn()
			textLabel.BackgroundTransparency = 1
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.Text = text
			textLabel.TextColor3 = Color3.new(1, 1, 1)
			textLabel.Font = Enum.Font.Arcade
			textLabel.TextSize = 10
			textLabel.TextStrokeTransparency = 0.5
			textLabel.Parent = billboardGui
			billboardGui.Parent = head
			tbl11[arg] = billboardGui
		else
			if v6.Parent ~= head then
				v6.Parent = head
			end

			local textLabel = v6:FindFirstChildOfClass("TextLabel")

			if textLabel then
				textLabel.Text = text
			end
		end
	elseif tbl11[arg] then
		pcall(function()
			tbl11[arg]:Destroy()
		end)

		tbl11[arg] = nil
	end
end

local function fn20()
	for _, v4 in pairs(tbl10) do
		if v4 and v4.Connected then
			pcall(function()
				v4:Disconnect()
			end)
		end
	end

	table.clear(tbl10)

	for _, v4 in pairs(tbl11) do
		if v4 and v4.Parent then
			pcall(function()
				v4:Destroy()
			end)
		end
	end

	table.clear(tbl11)
end

local function fn21(arg)
	if arg == localPlayer then
		return
	end

	table.insert(tbl10, arg:GetAttributeChangedSignal("_EquippedPower"):Connect(function()
		if flag8 then
			fn19(arg)
		end
	end))

	table.insert(tbl10, arg.CharacterAdded:Connect(function()
		task.wait(1)

		if flag8 then
			fn19(arg)
		end
	end))

	if flag8 then
		fn19(arg)
	end
end

Utilities:CreateToggle("Power ESP", function(arg)
	flag8 = arg

	if flag8 then
		fn20()

		for _, player in ipairs(Players:GetPlayers()) do
			fn21(player)
		end

		table.insert(tbl10, Players.PlayerAdded:Connect(function(player)
			task.wait(1)

			if flag8 then
				fn21(player)
			end
		end))

		table.insert(tbl10, Players.PlayerRemoving:Connect(function(player)
			if tbl3[player] then
				pcall(function()
					tbl3[player]:Destroy()
				end)

				tbl3[player] = nil
			end
		end))
	else
		fn20()
	end
end)

local Combat = lib:NewWindow("Combat")
local v4 = Combat:NewSection("Gun Client")
local flag9 = false
local flag10 = false
local flag11 = false
local flag12 = false

local function fn22()
	if flag9 then
		return
	end
	flag9 = true

	pcall(function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local modules = ReplicatedStorage:FindFirstChild("Modules")
		modules = modules and modules:FindFirstChild("GunFunctions")

		if not modules then
			for _, descendant in ipairs(ReplicatedStorage:GetDescendants()) do
				if descendant.Name == "GunFunctions" and descendant:IsA("ModuleScript") then
					modules = descendant
					break
				end
			end
		end

		if not modules then
			return
		end
		local module = require(modules)
		local firedGun = module.FiredGun

		module.FiredGun = function(arg, arg2, arg3, ...)
			if not (flag10 or flag11 or flag12) or arg ~= localPlayer.Character then
				return firedGun(arg, arg2, arg3, ...)
			end
			arg3 = arg3 or {}
			local humanoidRootPart = arg and arg:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return firedGun(arg, arg2, arg3, ...)
			end
			local position = humanoidRootPart.Position

			pcall(function()
				local attribute = arg:GetAttribute("HoldingWeapon")

				if attribute then
					local v5 = arg:FindFirstChild(attribute)

					if v5 then
						local fireFrom = v5:FindFirstChild("FireFrom")

						if fireFrom then
							position = fireFrom.Position
						end
					end
				end
			end)

			local live = workspace:FindFirstChild("Live")

			if not live then
				for _, child in pairs(workspace:GetChildren()) do
					if child:IsA("Model") or child:IsA("Folder") then
						local live2 = child:FindFirstChild("Live")
						if live2 and live2:IsA("Folder") then
							live = live2
							break
						end
					end
				end
			end

			if not live then
				for _, descendant in pairs(workspace:GetDescendants()) do
					if descendant.Name == "Live" and descendant:IsA("Folder") then
						live = descendant
						break
					end
				end
			end

			local v5 = nil

			if live then
				local huge = math.huge
				v5 = nil

				for _, child in pairs(live:GetChildren()) do
					if child ~= arg then
						if not child:FindFirstChild("Dead") then
							if not child:FindFirstChild("IFrame") then
								local humanoid = child:FindFirstChild("Humanoid")

								if not (humanoid and humanoid.Health <= 0) then
									local head = child:FindFirstChild("Head") or child:FindFirstChild("HumanoidRootPart") or child:FindFirstChildWhichIsA("BasePart", true)

									if head then
										local humanoidRootPart2 = child:FindFirstChild("HumanoidRootPart")
										local v6 = flag12 and string.match(string.lower(child.Name), "peabert")
										local flag13 = false

										if v6 then
											flag13 = true
										end

										if flag10 then
											if child:FindFirstChild("Enemy") then
												flag13 = true
											elseif child:FindFirstChild("GuardCanKill") or humanoidRootPart2 and humanoidRootPart2:FindFirstChild("GuardCanKillLockOn") then
												flag13 = true
											end

											local typeOfGuard = child:FindFirstChild("TypeOfGuard")

											if typeOfGuard then
												typeOfGuard = not (humanoidRootPart2 and humanoidRootPart2:FindFirstChild("GuardCanKillLockOn"))
											end

											if typeOfGuard and not child:FindFirstChild("GuardCanKill") then
												flag13 = false
											end
										end

										if flag11 then
											local playerFromCharacter = Players:GetPlayerFromCharacter(child)

											if playerFromCharacter and playerFromCharacter ~= localPlayer and playerFromCharacter:GetAttribute("IsGuard") or child.Name:match("Rebel") or child.Name:match("Guard") or child:FindFirstChild("PlayerCanKill") or child:FindFirstChild("TypeOfGuard") then
												flag13 = true
											end
										end

										if flag13 then
											local magnitude = (head.Position - position).Magnitude

											if magnitude < huge and magnitude < 1500 then
												huge = magnitude
												v5 = head
											end
										end
									end
								end
							end
						end
					end
				end
			end

			if v5 then
				arg2 = v5.Position
				arg3.CustomFireFrom = true
				arg3.spread = 0
			end

			return firedGun(arg, arg2, arg3, ...)
		end
	end)
end

v4:CreateToggle("Guard Silent Aim", function(arg)
	flag10 = arg

	if arg then
		fn22()
	end
end)

v4:CreateToggle("Rebel Silent Aim", function(arg)
	flag11 = arg

	if arg then
		fn22()
	end
end)

v4:CreateToggle("AA Silent Aim", function(arg)
	flag12 = arg

	if arg then
		fn22()
	end
end)

local v5 = Combat:NewSection("Movement Client")
local flag13 = false
local connection6 = nil
local flag14 = false
local connection7 = nil
local connection8 = nil
local connection9 = nil

local tbl12 = {
	knife = true,
	bottle = true,
	fork = true,
	pole = true,
	["throw weapon"] = true,
	fist = true,
	fists = true,
	["fight back"] = true,
	fightback = true,
}

local function fn23()
	local backpack = localPlayer:FindFirstChild("Backpack")
	local character = localPlayer.Character

	if backpack then
		for _, child in ipairs(backpack:GetChildren()) do
			if child:IsA("Tool") then
				local v6 = string.lower(child.Name)

				for k in pairs(tbl12) do
					if string.find(v6, k) then
						return true
					end
				end
			end
		end
	end

	if character then
		for _, child in ipairs(character:GetChildren()) do
			if child:IsA("Tool") then
				local v6 = string.lower(child.Name)

				for k in pairs(tbl12) do
					if string.find(v6, k) then
						return true
					end
				end
			end
		end
	end

	return false
end

local tbl13 = {
	"Freeze",
	"Slowed",
	"Slow",
	"Action",
	"LightAction",
	"NoAttack",
	"Ragdoll",
	"Stun",
	"Stunned",
	"DisableJump",
	"RotateDisabled",
}

local tbl14 = {
	"Stun",
	"RotateDisabled",
	"Freeze",
	"Slowed",
	"Action",
	"LightAction",
	"Ragdoll",
	"NoAttack",
	"Blocking",
	"Stunned",
}

local function fn24(arg)
	if not arg then
		return
	end
	local humanoid = arg:FindFirstChildOfClass("Humanoid")

	for _, v6 in ipairs(tbl13) do
		if arg:GetAttribute(v6) then
			arg:SetAttribute(v6, nil)
		end

		if localPlayer:GetAttribute(v6) then
			localPlayer:SetAttribute(v6, nil)
		end
	end

	for _, child in ipairs(arg:GetChildren()) do
		if table.find(tbl14, child.Name) or child:HasTag("EffectTag") or child.Name == "BinaryStringValue" then
			pcall(function()
				child:Destroy()
			end)
		end
	end

	local effects = Workspace:FindFirstChild("Effects")

	if effects then
		local localRagdolls = effects:FindFirstChild("LocalRagdolls")

		if localRagdolls then
			local v6 = localRagdolls:FindFirstChild(localPlayer.Name)

			if v6 and v6:GetAttribute("InUse") then
				pcall(function()
					v6:SetAttribute("InUse", false)
				end)
			end
		end
	end

	if arg:GetAttribute("SwingSpeed") and arg:GetAttribute("SwingSpeed") < 1 then
		arg:SetAttribute("SwingSpeed", 1)
	end

	if humanoid and humanoid.Health > 0 then
		if humanoid.PlatformStand then
			humanoid.PlatformStand = false
			humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
		end

		if humanoid.Sit then
			humanoid.Sit = false
		end

		humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)

		if humanoid.WalkSpeed < 14 then
			humanoid.WalkSpeed = 14
		end
	end
end

local tbl15 = { "Freeze", "Slowed", "Slow" }
local tbl16 = { "Freeze", "Slowed" }

local function fn25(arg)
	if not arg then
		return
	end
	local humanoid = arg:FindFirstChildOfClass("Humanoid")

	for _, v6 in ipairs(tbl15) do
		if arg:GetAttribute(v6) then
			arg:SetAttribute(v6, nil)
		end

		if localPlayer:GetAttribute(v6) then
			localPlayer:SetAttribute(v6, nil)
		end
	end

	for _, child in ipairs(arg:GetChildren()) do
		if table.find(tbl16, child.Name) then
			pcall(function()
				child:Destroy()
			end)
		end
	end

	if humanoid and humanoid.Health > 0 and humanoid.WalkSpeed < 14 then
		humanoid.WalkSpeed = 14
	end
end

v5:CreateToggle("Anti Freeze/Slow", function(arg)
	flag13 = arg

	if flag13 then
		if not connection6 then
			connection6 = RunService.Heartbeat:Connect(function()
				if not flag13 then
					return
				end

				if not fn23() then
					return
				end
				fn25(localPlayer.Character)
			end)
		end
	elseif connection6 then
		pcall(function()
			connection6:Disconnect()
		end)

		connection6 = nil
	end
end)

v5:CreateToggle("No Stun", function(arg)
	flag14 = arg

	if flag14 then
		local function fn26(arg2)
			if not arg2 then
				return
			end

			if connection8 then
				connection8:Disconnect()
			end

			if connection9 then
				connection9:Disconnect()
			end

			connection8 = arg2.ChildAdded:Connect(function(child)
				if not flag14 then
					return
				end

				if table.find(tbl14, child.Name) or child:HasTag("EffectTag") or child.Name == "BinaryStringValue" then
					task.defer(function()
						if child and child.Parent then
							pcall(function()
								child:Destroy()
							end)
						end
					end)
				end
			end)

			connection9 = arg2.AttributeChanged:Connect(function(attribute)
				if not flag14 then
					return
				end

				if table.find(tbl13, attribute) and arg2:GetAttribute(attribute) then
					task.defer(function()
						if arg2 and arg2:GetAttribute(attribute) then
							arg2:SetAttribute(attribute, nil)
						end
					end)
				end
			end)
		end

		fn26(localPlayer.Character)

		if not connection7 then
			connection7 = RunService.Heartbeat:Connect(function()
				if not flag14 then
					return
				end
				fn24(localPlayer.Character)
			end)
		end
	else
		if connection7 then
			pcall(function()
				connection7:Disconnect()
			end)

			connection7 = nil
		end

		if connection8 then
			pcall(function()
				connection8:Disconnect()
			end)

			connection8 = nil
		end

		if connection9 then
			pcall(function()
				connection9:Disconnect()
			end)

			connection9 = nil
		end
	end
end)

local Config = v:NewSection("Config")

Config:CreateButton("Save Config", function()
	lib:SaveConfig("config")
end)

Config:CreateButton("Load Config", function()
	lib:LoadConfig("config")
end)

Config:CreateButton("Toggle GUI (F5)", function()
	lib:Toggle()
end)
