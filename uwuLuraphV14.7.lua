-- old uwu hub version luraph 14.7 its in obsidian ui 

local function geniter(f, s, c)
	if type(f) ~= "function" then
		local mt = getmetatable(f)

		if type(mt) == "table" and mt.__iter then
			f, s, c = mt.__iter(f)
		elseif type(f) == "table" then
			f, s, c = next, f, nil
		end
	end

	return function()
		local r = table.pack(f(s, c))

		if r[1] == nil then
			return false
		end

		c = r[1]

		return true, table.unpack(r, 1, r.n)
	end
end

do
	local n1 = 0
	local connection = game:GetService("RunService").Heartbeat:Connect(function()
		n1 += 1
	end)

	repeat
		task.wait()
	until n1 >= 2

	connection:Disconnect()
end

pcall(function()
	local HttpService = game:GetService("HttpService")
	local request_ = request or http_request or syn and syn.request

	if request_ then
		request_({
			Url = "http://127.0.0.1:6463/rpc?v=1",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
				Origin = "https://discord.com"
			},
			Body = HttpService:JSONEncode({
				cmd = "INVITE_BROWSER",
				args = {
					code = "uwustudios"
				},
				nonce = HttpService:GenerateGUID(false)
			})
		})
	end
end)

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()
local lib2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/ThemeManager.lua"))()
local lib3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/SaveManager.lua"))()
local v15 = lib:CreateWindow({
	Title = "Uwu Hub | Ink Game",
	NotifySide = "Right",
	ShowCustomCursor = false,
	Size = UDim2.fromOffset(650, 480),
	Footer = "discord.gg/uwustudios",
	CornerRadius = 14
})

pcall(function()
	v15:SetCornerRadius(14)
end)

local v16 = lib:AddDraggableLabel("Uwu Hub | Loading...")

task.spawn(function()
	local RunService_ = game:GetService("RunService")
	local Stats = game:GetService("Stats")
	local t1 = {}
	local n2 = 0

	RunService_.RenderStepped:Connect(function(dt)
		table.insert(t1, 1 / dt)

		if #t1 > 30 then
			table.remove(t1, 1)
		end
	end)

	while lib and not lib.Unloaded do
		pcall(function()
			if tick() - n2 >= 0.5 then
				local n3 = 0

				for _, v in ipairs(t1) do
					n3 += v
				end

				local v24 = #t1 > 0 and math.floor(n3 / #t1) or 0
				local n4 = 0

				pcall(function()
					n4 = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
				end)

				local s1 = "Lobby"

				pcall(function()
					local Values = workspace:FindFirstChild("Values")
					local CurrentGame = Values and Values:FindFirstChild("CurrentGame")

					if CurrentGame and CurrentGame.Value ~= "" then
						s1 = CurrentGame.Value
					end
				end)

				local v29 = os.date("%H:%M:%S")

				if getgenv().DisableWatermarkUI then
					v16:SetText("")
				else
					v16:SetText(string.format("Uwu Hub  |  %d FPS  |  %dms  |  %s  |  %s", v24, n4, s1, v29))
				end

				n2 = tick()
			end
		end)
		task.wait(0.5)
	end
end)
task.spawn(function()
	task.wait(0.5)
	pcall(function()
		local Obsidian = game:GetService("CoreGui"):FindFirstChild("Obsidian")

		if not Obsidian then
			local ipairs_ = ipairs
			local CoreGui = game:GetService("CoreGui")

			for _, child in ipairs_(CoreGui:GetChildren()) do
				if child:IsA("ScreenGui") and child:FindFirstChild("Watermark") then
					Obsidian = child

					break
				end
			end
		end

		if Obsidian then
			for _, descendant in ipairs(Obsidian:GetDescendants()) do
				if descendant:IsA("Frame") and descendant.Size.X.Offset >= 600 then
					if not descendant:FindFirstChildOfClass("UICorner") then
						local UICorner = Instance.new("UICorner")

						UICorner.CornerRadius = UDim.new(0, 8)
						UICorner.Parent = descendant
					end

					break
				end
			end
		end
	end)
end)

local HttpService = game:GetService("HttpService")
local n5 = 0
local v40 = false

pcall(function()
	if game.PlaceId ~= 99567941238278 then
		local data
		local ok, result = pcall(function()
			return game:HttpGet("https://platinstudio.xyz/raw/InkVersion")
		end)

		if ok and result then
			pcall(function()
				data = HttpService:JSONDecode(result)
			end)
		end

		if not data or not data.LastCheckedVersion then
			local ok2, result2 = pcall(function()
				return game:HttpGet("https://raw.githubusercontent.com/platinww/UwU/refs/heads/main/UI/InkVersion.json")
			end)

			if ok2 and result2 then
				pcall(function()
					data = HttpService:JSONDecode(result2)
				end)
			end
		end

		if data and data.LastCheckedVersion then
			n5 = tonumber(data.LastCheckedVersion) or 0
		end
	end
end)

if game.PlaceId ~= 99567941238278 then
	if n5 < game.PlaceVersion then
		v40 = true
	end
end

local t2 = {
	Game = v15:AddTab("Game", "gamepad"),
	Tools = v15:AddTab("Tools", "wrench"),
	Visual = v15:AddTab("Visual", "eye"),
	UISettings = v15:AddTab("UI Settings", "settings")
}
local t3 = {
	RLGLBox = t2.Game:AddLeftGroupbox("Red Light Green Light", "traffic-cone"),
	HSTOWBox = t2.Game:AddLeftGroupbox("Hide And Seek & Tug Of War", "eye"),
	MingleBox = t2.Game:AddLeftGroupbox("Mingle", "users"),
	GameToolsBox = t2.Tools:AddLeftGroupbox("Game Tools", "wrench"),
	AutoVoteBox = t2.Tools:AddRightGroupbox("Auto Vote", "mouse-pointer"),
	UtilitiesBox = t2.Game:AddLeftGroupbox("Utilities", "wrench"),
	DalgonaBox = t2.Game:AddRightGroupbox("Dalgona & Pentathlon", "cookie"),
	LightsOutBox = t2.Game:AddRightGroupbox("Lights Out", "moon"),
	MingleGlassBox = t2.Game:AddRightGroupbox("Jump Rope & Glass Bridge", "swords"),
	RebelBox = t2.Game:AddRightGroupbox("Rebel", "target"),
	SkyBox = t2.Game:AddRightGroupbox("Sky Squid Game & Squid Game", "cloud"),
	GuardBox = t2.Game:AddRightGroupbox("Guard Mode", "shield"),
	AdminAbuseBox = t2.Tools:AddRightGroupbox("Admin Abuse Tools", "swords"),
	InfoBox = t2.Game:AddRightGroupbox("Information", "info"),
	VisualGamepassBox = t2.Visual:AddLeftGroupbox("Gamepass Options", "star"),
	VisualClientBox = t2.Visual:AddRightGroupbox("Client Options", "user"),
	EmoteBox = t2.Visual:AddRightGroupbox("Emote Player", "play")
}
local InfoBox = t3.InfoBox

if game.PlaceId ~= 99567941238278 then
	InfoBox:AddLabel("<font color=\"#A5B4FC\">Current Game Version:</font> <font color=\"#FFFFFF\"><b>" .. tostring(game.PlaceVersion) .. "</b></font>")
	InfoBox:AddLabel("<font color=\"#A5B4FC\">Last Checked Version:</font> <font color=\"#FFFFFF\"><b>" .. tostring(n5) .. "</b></font>")

	if v40 then
		InfoBox:AddDivider()
		InfoBox:AddLabel({
			Text = "<font color=\"#F87171\"><b>WARNING</b></font>\n<font color=\"#FCCCA7\">Game Version Change Detected Features may be patched.</font>",
			DoesWrap = true
		})
	end
end

InfoBox:AddDivider()
InfoBox:AddLabel("<font color=\"#FBBF24\"><b>Latest Update Logs:</b></font>")

local s2 = "Failed to fetch logs..."

pcall(function()
	local request_ = request or http_request or syn and syn.request

	if request_ then
		local v51 = request_({
			Url = "https://platinstudio.xyz/raw/UpdateLogs",
			Method = "GET"
		})

		if not v51 or not v51.Success or not v51.Body or v51.StatusCode ~= 200 then
			v51 = request_({
				Url = "https://raw.githubusercontent.com/platinww/UwU/refs/heads/main/UI/LastUpdateLog",
				Method = "GET"
			})
		end

		if v51 and v51.Success and v51.Body then
			local s3 = ""

			for match in tostring(v51.Body):gmatch("[^\r\n]+") do
				local v54 = match:gsub("%*%*", "")

				if v54:match("^%s*%-") then
					s3 ..= "<font color=\"#A5B4FC\">></font> <font color=\"#F3F4F6\">" .. v54:gsub("^%s*%-%s*", "") .. "</font>\n"
				end
			end

			if s3 == "" then
				s2 = "<font color=\"#9CA3AF\">No recent updates found.</font>"
			else
				s2 = s3:gsub("\n$", "")
			end
		end
	end
end)
InfoBox:AddLabel({
	Text = s2,
	DoesWrap = true
})

local Value
local n6 = 0

local function v57()
	if tick() - n6 < 0.5 then
		return Value
	end

	n6 = tick()

	local Values = Workspace:FindFirstChild("Values")
	local CurrentGame = Values and Values:FindFirstChild("CurrentGame")

	if not CurrentGame or CurrentGame.Value == "" then
		Value = nil
	else
		Value = CurrentGame.Value
	end

	return Value
end
local function v60(p1)
	return v57() == p1
end

local s4 = "rbxassetid://4590657391"

pcall(function()
	if not isfolder("UwUStudios") then
		makefolder("UwUStudios")
	end

	if not isfile("UwUStudios/notify.wav") then
		local response = game:HttpGet("https://github.com/platinww/UwU/raw/refs/heads/main/UI/notify.wav")

		writefile("UwUStudios/notify.wav", response)
	end

	if getcustomasset then
		s4 = getcustomasset("UwUStudios/notify.wav")
	end
end)

local function v63(p2, p3)
	lib:Notify({
		Title = "Uwu Hub",
		Description = p3,
		Time = 4,
		SoundId = s4,
		Volume = 2
	})
end

local t4 = {
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
	["0"] = 48
}

local function v65(p4)
	if type(keypress) == "function" and type(keyrelease) == "function" then
		local v66 = t4[string.lower(tostring(p4))]

		if v66 then
			keypress(v66)
			task.wait(0.05)
			keyrelease(v66)

			return true
		end
	end

	return false
end

local HBGQTE

local function v68()
	if not HBGQTE then
		pcall(function()
			local Modules = game:GetService("ReplicatedStorage"):WaitForChild("Modules", 5)

			if Modules then
				HBGQTE = require(Modules:WaitForChild("HBGQTE", 5))
			end
		end)
	end

	return HBGQTE
end

local GUID

task.spawn(function()
	pcall(function()
		local Modules = game:GetService("ReplicatedStorage"):WaitForChild("Modules", 5)

		if Modules then
			local Games = Modules:WaitForChild("Games", 5)

			if Games then
				local PentathlonClient = require(Games:WaitForChild("PentathlonClient", 5))

				if PentathlonClient and type(PentathlonClient) == "table" then
					local RunServerGame = PentathlonClient.RunServerGame

					if RunServerGame then
						PentathlonClient.RunServerGame = function(p5, p6, ...)
							if p5 and p5.GUID then
								GUID = p5.GUID
							end

							return RunServerGame(p5, p6, ...)
						end
					end

					local AddActiveGame = PentathlonClient.AddActiveGame

					if AddActiveGame then
						PentathlonClient.AddActiveGame = function(p7)
							if p7 and p7.GUID then
								GUID = p7.GUID
							end

							return AddActiveGame(p7)
						end
					end
				end
			end
		end
	end)
end)

local function v76(p8, p9)
	if not GUID then
		return false
	end

	local PentathlonRemote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") and game:GetService("ReplicatedStorage").Remotes:FindFirstChild("PentathlonRemote")

	if not PentathlonRemote then
		return false
	end

	if p9 then
		PentathlonRemote:FireServer(GUID, p8, p9)
	else
		PentathlonRemote:FireServer(GUID, p8)
	end

	return true
end
local function v78(p10)
	local Character = LocalPlayer.Character

	if not Character or not Character:FindFirstChild("HumanoidRootPart") then
		return
	end

	local HumanoidRootPart = Character.HumanoidRootPart

	HumanoidRootPart.Velocity = Vector3.zero
	HumanoidRootPart.RotVelocity = Vector3.zero
	HumanoidRootPart.Anchored = true
	Character:PivotTo(p10)
	task.wait()
	HumanoidRootPart.Velocity = Vector3.zero
	HumanoidRootPart.Anchored = false
end

local n7 = 0

t3.RLGLBox:AddButton({
	Text = "TP To End",
	Func = function()
		if tick() - n7 < 10 then
			v63(" Cooldown", "Please wait " .. math.ceil(10 - (tick() - n7)) .. "s before teleporting again.")

			return
		end

		if v60("RedLightGreenLight") then
			v78(CFrame.new(-45, 1025, 137))
			n7 = tick()
		else
			v63(nil, "Red Light Green Light is not currently running.")
		end
	end
})
t3.RLGLBox:AddButton({
	Text = "TP To Start",
	Func = function()
		if tick() - n7 < 10 then
			v63(" Cooldown", "Please wait " .. math.ceil(10 - (tick() - n7)) .. "s before teleporting again.")

			return
		end

		if v60("RedLightGreenLight") then
			v78(CFrame.new(-49, 1023, -540))
			n7 = tick()
		else
			v63(nil, "Red Light Green Light is not currently running.")
		end
	end
})
t3.RLGLBox:AddButton({
	Text = "Remove Injury",
	Func = function()
		if not v60("RedLightGreenLight") then
			v63(nil, "Red Light Green Light is not currently running.")

			return
		end

		if not LocalPlayer then
			return
		end

		local Character = LocalPlayer.Character

		if not Character then
			return
		end

		local Humanoid = Character:FindFirstChild("Humanoid")
		local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

		if not Humanoid or not HumanoidRootPart then
			return
		end

		local Torso = Character:FindFirstChild("Torso") or Character:FindFirstChild("UpperTorso")

		Humanoid.PlatformStand = false
		Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)

		for _, v in pairs({
			Enum.HumanoidStateType.FallingDown,
			Enum.HumanoidStateType.Seated,
			Enum.HumanoidStateType.Swimming,
			Enum.HumanoidStateType.Flying,
			Enum.HumanoidStateType.StrafingNoPhysics,
			Enum.HumanoidStateType.Ragdoll
		}) do
			Humanoid:SetStateEnabled(v, false)
		end

		for _, child in pairs(HumanoidRootPart:GetChildren()) do
			if not child:IsA("BallSocketConstraint") then
				if not child.Name:match("^CacheAttachment") then
					continue
				end
			end

			child:Destroy()
		end

		if Torso then
			for _, v in pairs({
				"Left Hip",
				"Left Shoulder",
				"Neck",
				"Right Hip",
				"Right Shoulder"
			}) do
				local v92 = Torso:FindFirstChild(v)

				if v92 and v92:IsA("Motor6D") and not v92.Part0 then
					v92.Part0 = Torso
				end
			end
		end

		for _, child in pairs(Character:GetChildren()) do
			if child:IsA("BasePart") and child:FindFirstChild("BoneCustom") then
				child.BoneCustom:Destroy()
			end
		end

		for _, v in pairs({
			"Ragdoll",
			"Stun",
			"RotateDisabled",
			"RagdollWakeupImmunity",
			"Injured"
		}) do
			local v97 = Character:FindFirstChild(v)

			if v97 then
				v97:Destroy()
			end
		end

		local Effects = Workspace:FindFirstChild("Effects")

		if Effects then
			local LocalRagdolls = Effects:FindFirstChild("LocalRagdolls")

			if LocalRagdolls then
				local LocalPlayerName = LocalRagdolls:FindFirstChild(LocalPlayer.Name)

				if LocalPlayerName then
					LocalPlayerName:Destroy()
				end
			end
		end

		if Character:GetAttribute("Injured") then
			Character:SetAttribute("Injured", false)
		end
	end
})
t3.RLGLBox:AddButton({
	Text = "Anti Crawl",
	Func = function()
		if not v60("RedLightGreenLight") then
			v63(nil, "Red Light Green Light is not currently running.")

			return
		end

		v63(nil, "Anti Crawl Enabled")
		task.spawn(function()
			while v60("RedLightGreenLight") do
				local Character = LocalPlayer.Character

				if Character and Character:FindFirstChild("Crawling") then
					Character.Crawling:Destroy()
				end

				task.wait(0.25)
			end
		end)
	end
})

do
	local function v102(p11)
		local Character = LocalPlayer.Character

		if Character then
			local Humanoid = Character:FindFirstChild("Humanoid")

			if Humanoid then
				Humanoid.WalkSpeed = p11 and 16 or 0
				Humanoid.JumpPower = p11 and 50 or 0
			end

			local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

			if HumanoidRootPart and not p11 then
				HumanoidRootPart.Velocity = Vector3.zero
			end
		end
	end
	local function v106(p12, p13, p14)
		local v107 = math.min(p13.X, p14.X)
		local v108 = math.max(p13.X, p14.X)
		local v109 = math.min(p13.Z, p14.Z)
		local v110 = math.max(p13.Z, p14.Z)

		return p12.X >= v107 and p12.X <= v108 and p12.Z >= v109 and p12.Z <= v110
	end
	local function v111()
		local Character = LocalPlayer.Character

		if not Character or not Character:FindFirstChild("HumanoidRootPart") then
			return false
		end

		local Position = Character.HumanoidRootPart.Position
		local v114 = v106(Position, Vector3.new(-216, 0, 83), Vector3.new(103, 0, 168))
		local v115 = v106(Position, Vector3.new(103, 0, 168), Vector3.new(116, 0, 82))
		local v116 = v106(Position, Vector3.new(115, 0, -578), Vector3.new(-215, 0, -516))

		return v114 or v115 or v116
	end

	local u117 = false
	local u118
	local u119 = false

	t3.RLGLBox:AddToggle("FreezeOnRedLight", {
		Text = " Freeze On Red Light",
		Default = false,
		Callback = function(p15)
			u117 = p15

			if u117 then
				if u118 then
					return
				end

				u118 = true
				task.spawn(function()
					while u118 and u117 do
						if v60("RedLightGreenLight") then
							local v120 = false
							local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")

							if PlayerGui then
								local ImpactFrames = PlayerGui:FindFirstChild("ImpactFrames")

								if ImpactFrames then
									local TrafficLightEmpty = ImpactFrames:FindFirstChild("TrafficLightEmpty")

									if TrafficLightEmpty and TrafficLightEmpty.Image == "rbxassetid://88400194373338" then
										v120 = true
									end
								end
							end

							if not v120 or v111() then
								if u119 then
									v102(true)
									u119 = false
								end
							else
								if not u119 then
									v102(false)
									u119 = true
								end

								local Character = LocalPlayer.Character

								if Character then
									local Humanoid = Character:FindFirstChild("Humanoid")

									if Humanoid then
										Humanoid.WalkSpeed = 0
										Humanoid.JumpPower = 0
									end

									local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

									if HumanoidRootPart then
										HumanoidRootPart.Velocity = Vector3.zero
									end
								end
							end
						elseif u119 then
							v102(true)
							u119 = false
						end

						task.wait(0.1)
					end

					u118 = nil

					if u119 then
						v102(true)
						u119 = false
					end
				end)
			end
		end
	})
end

do
	local u127 = false
	local u128

	t3.RLGLBox:AddToggle("AutoTPEndLastSecond", {
		Text = " Auto TP End Last Second",
		Default = false,
		Callback = function(p16)
			u127 = p16

			if u127 then
				if u128 then
					return
				end

				u128 = true
				task.spawn(function()
					while u128 and u127 do
						if v60("RedLightGreenLight") then
							local attribute = workspace:GetAttribute("CurrentGameTime")

							if attribute and attribute <= 3 then
								if attribute > 0 then
									local v130 = true
									local Character = LocalPlayer.Character
									local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

									if HumanoidRootPart then
										local Position = HumanoidRootPart.Position

										local function v134(p17, p18, p19)
											return p17.X >= math.min(p18.X, p19.X) and p17.X <= math.max(p18.X, p19.X) and p17.Z >= math.min(p18.Z, p19.Z) and p17.Z <= math.max(p18.Z, p19.Z)
										end

										local vector3 = Vector3.new(115, 1023, 84)
										local vector32 = Vector3.new(103, 1023, 168)
										local vector33 = Vector3.new(103, 1023, 168)
										local vector34 = Vector3.new(-216, 1023, 83)

										if v134(Position, vector3, vector32) or v134(Position, vector33, vector34) then
											if math.abs(Position.Y - 1023) < 100 then
												v130 = false
											end
										end
									end

									if v130 then
										v63(nil, "Last 3 Second Left Teleporting End")
										v78(CFrame.new(-45, 1025, 137))
									end

									task.wait(5)
								end
							end
						end

						task.wait(1)
					end

					u128 = nil
				end)
			end
		end
	})
end

local u139 = false
local t5 = {}
local t6 = {}

local function v142(p20)
	if not u139 then
		return
	end

	if p20 == LocalPlayer then
		return
	end

	local Character = p20.Character

	if not Character then
		return
	end

	if t5[p20] then
		t5[p20]:Destroy()
		t5[p20] = nil
	end

	local attribute = p20:GetAttribute("IsHider")
	local attribute2 = p20:GetAttribute("IsHunter")

	if not (attribute or attribute2) then
		return
	end

	local Highlight = Instance.new("Highlight")

	Highlight.FillTransparency = 0.4
	Highlight.OutlineTransparency = 0

	if attribute then
		Highlight.FillColor = Color3.fromRGB(50, 255, 50)
		Highlight.OutlineColor = Color3.fromRGB(30, 200, 30)
	elseif attribute2 then
		Highlight.FillColor = Color3.fromRGB(255, 50, 50)
		Highlight.OutlineColor = Color3.fromRGB(200, 30, 30)
	end

	Highlight.Adornee = Character
	Highlight.Parent = Character
	t5[p20] = Highlight
end
local function v147()
	for _, v in pairs(t6) do
		if v and v.Connected then
			v:Disconnect()
		end
	end

	table.clear(t6)

	for _, v in pairs(t5) do
		if v and v.Parent then
			v:Destroy()
		end
	end

	table.clear(t5)
end
local function v152(p21)
	if p21 == LocalPlayer then
		return
	end

	table.insert(t6, p21:GetAttributeChangedSignal("IsHider"):Connect(function()
		if u139 then
			v142(p21)
		end
	end))
	table.insert(t6, p21:GetAttributeChangedSignal("IsHunter"):Connect(function()
		if u139 then
			v142(p21)
		end
	end))
	table.insert(t6, p21.CharacterAdded:Connect(function()
		task.wait(0.5)

		if u139 then
			v142(p21)
		end
	end))
	v142(p21)
end

t3.HSTOWBox:AddButton({
	Text = "Auto Escape",
	Func = function()
		if not v60("HideAndSeek") then
			v63(nil, "Hide And Seek is not active")

			return
		end

		local Character = LocalPlayer.Character

		if Character and Character:FindFirstChild("HumanoidRootPart") then
			v78(CFrame.new(199, 54, -88))
			v63(" Escaped", "Teleported to safe zone")
		end
	end
})

local u154 = false
local u155

t3.HSTOWBox:AddToggle("AutoGetKeys", {
	Text = " Auto Get Missing Keys",
	Default = false,
	Callback = function(p22)
		u154 = p22

		if u154 then
			if u155 then
				return
			end

			u155 = true
			task.spawn(function()
				local t7 = {
					"Circle",
					"Square",
					"Triangle"
				}

				while u154 and u155 do
					if v60("HideAndSeek") then
						local CurrentKeys = LocalPlayer:FindFirstChild("CurrentKeys")

						if CurrentKeys then
							local t8 = {}

							for _, child in ipairs(CurrentKeys:GetChildren()) do
								t8[child.Name] = true
							end

							local t9 = {}

							for _, v in ipairs(t7) do
								if not t8[v] then
									t9[v] = true
								end
							end

							local Effects = workspace:FindFirstChild("Effects")

							if Effects then
								for _, child in ipairs(Effects:GetChildren()) do
									if string.sub(child.Name, 1, 10) == "DroppedKey" and t9[string.sub(child.Name, 11)] then
										local Character = LocalPlayer.Character
										local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

										if HumanoidRootPart then
											local pivot = child:IsA("Model") and child:GetPivot() or child.CFrame
											local CFrame_ = HumanoidRootPart.CFrame

											HumanoidRootPart.CFrame = pivot
											task.wait(0.1)
											HumanoidRootPart.CFrame = CFrame_

											break
										end
									end
								end
							end
						end
					end

					task.wait(0.1)
				end

				u155 = nil
			end)
		else
			u155 = nil
		end
	end
})

local u171 = false
local u172
local u173 = false

local function v174(p23, p24)
	return math.abs((p23 - p24 + 180) % 360 - 180)
end
local function v175()
	v65("space")
end
local function v176()
	if u173 then
		return
	end

	u173 = true

	local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")

	if not PlayerGui then
		u173 = false

		return
	end

	local TugOfWarUIV2 = PlayerGui:WaitForChild("TugOfWarUIV2", 5)

	if not TugOfWarUIV2 then
		u173 = false

		return
	end

	local TugofWarRemake = TugOfWarUIV2:FindFirstChild("TugofWarRemake")

	if not TugofWarRemake then
		u173 = false

		return
	end

	local CircleBase = TugofWarRemake:FindFirstChild("CircleBase")

	if not CircleBase then
		u173 = false

		return
	end

	while u171 do
		local attribute

		pcall(function()
			attribute = LocalPlayer:GetAttribute("TugOfWarPhase")
		end)

		if attribute == "QTE" then
			break
		end

		task.wait(0.1)
	end

	if not u171 then
		u173 = false

		return
	end

	if not CircleBase.Visible then
		local now = tick()

		while u171 and not CircleBase.Visible and tick() - now < 10 do
			task.wait(0.1)
		end
	end

	if not u171 then
		u173 = false

		return
	end

	local Arrow = CircleBase:FindFirstChild("Arrow")

	if not Arrow then
		u173 = false

		return
	end

	local Medium = CircleBase:FindFirstChild("Medium")

	if not Medium then
		Medium = CircleBase:FindFirstChild("Small") or CircleBase:FindFirstChild("Large")
	end

	if not Medium then
		u173 = false

		return
	end

	local n8

	if (LocalPlayer:GetAttribute("TugOfWarStrategy") or "Standard") == "Stall" then
		n8 = 14
	else
		n8 = 18.2
	end

	local n9 = 0
	local u187 = false
	local connection
	local connection2

	local function v190()
		if connection then
			connection:Disconnect()
			connection = nil
		end

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		u173 = false
	end

	connection2 = LocalPlayer.ChildAdded:Connect(function(child)
		if child.Name == "QTEOver" then
			v190()
		end
	end)
	connection = game:GetService("RunService").RenderStepped:Connect(function()
		if not u171 or not Arrow or not Arrow.Parent or not CircleBase.Visible then
			v190()

			return
		end

		local v191 = v174(Medium.Rotation % 360, Arrow.Rotation % 360) <= n8

		if v191 and not u187 and tick() - n9 > 0.12 then
			v175()
			n9 = tick()
		end

		u187 = v191
	end)
	task.spawn(function()
		while u173 and u171 and v60("TugOfWar") do
			task.wait(1)
		end

		v190()
	end)
end

local u192 = false
local u193

local function v194()
	local Character = LocalPlayer.Character

	if not Character then
		return nil
	end

	local Backpack = LocalPlayer:FindFirstChild("Backpack")
	local Tool = Character:FindFirstChildOfClass("Tool")

	if Tool then
		return Tool
	end

	if Backpack then
		for _, child in pairs(Backpack:GetChildren()) do
			if not child:IsA("Tool") then
				continue
			end

			child.Parent = Character
			task.wait(0.1)

			return child
		end
	end

	return nil
end
local function v200()
	local Character = LocalPlayer.Character

	if not Character or not Character:FindFirstChild("HumanoidRootPart") then
		return nil
	end

	local Position = Character.HumanoidRootPart.Position
	local v203
	local huge = math.huge

	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player:GetAttribute("IsHider") then
			local Character2 = player.Character

			if Character2 then
				local Humanoid = Character2:FindFirstChild("Humanoid")
				local HumanoidRootPart = Character2:FindFirstChild("HumanoidRootPart")

				if Humanoid and HumanoidRootPart and Humanoid.Health > 0 then
					local Magnitude = (HumanoidRootPart.Position - Position).Magnitude

					if Magnitude < huge then
						huge = Magnitude
						v203 = player
					end
				end
			end
		end
	end

	return v203
end

t3.HSTOWBox:AddToggle("KillHiders", {
	Text = " Auto Kill Hiders",
	Default = false,
	Callback = function(p25)
		u192 = p25

		if u192 then
			if not LocalPlayer:GetAttribute("IsHunter") then
				v63(" Not Hunter", "You are not a Hunter.")
				u192 = false

				return
			end

			u193 = nil
			task.wait(0.2)
			u193 = true
			task.spawn(function()
				local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

				HumanoidRootPart = HumanoidRootPart and LocalPlayer.Character.HumanoidRootPart.CFrame

				local v212 = false

				while u193 and u192 do
					if v60("HideAndSeek") then
						if not LocalPlayer:GetAttribute("IsHunter") then
							u192 = false
							u193 = nil

							break
						end

						local v213 = v200()

						if v213 then
							v212 = false

							local Character = v213.Character
							local Humanoid = Character and Character:FindFirstChild("Humanoid")
							local HumanoidRootPart2 = Character and Character:FindFirstChild("HumanoidRootPart")

							while u193 and u192 and Character and Humanoid and HumanoidRootPart2 and Humanoid.Health > 0 and v60("HideAndSeek") do
								local Character2 = LocalPlayer.Character
								local HumanoidRootPart3 = Character2 and Character2:FindFirstChild("HumanoidRootPart")
								local Humanoid2 = Character2 and Character2:FindFirstChild("Humanoid")

								if not HumanoidRootPart3 or not Humanoid2 then
									break
								end

								local n10 = 0

								pcall(function()
									n10 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 1000
								end)
								HumanoidRootPart3.CFrame = (HumanoidRootPart2.CFrame + HumanoidRootPart2.AssemblyLinearVelocity * n10) * CFrame.new(0, 0, 3)
								HumanoidRootPart3.AssemblyLinearVelocity = Vector3.new(0, 0, 0)

								local v221 = v194()

								if v221 then
									if v221.Parent ~= Character2 then
										v221.Parent = Character2
									end

									pcall(function()
										v221:Activate()
									end)
								end

								task.wait(0.05)
								Character = v213.Character
								Humanoid = Character and Character:FindFirstChild("Humanoid")
								HumanoidRootPart2 = Character and Character:FindFirstChild("HumanoidRootPart")
							end
						else
							if HumanoidRootPart and not v212 then
								local Character = LocalPlayer.Character
								local HumanoidRootPart2 = Character and Character:FindFirstChild("HumanoidRootPart")

								if HumanoidRootPart2 then
									HumanoidRootPart2.CFrame = HumanoidRootPart
									v212 = true
								end
							end

							task.wait(0.5)
						end

						task.wait(0.1)
					else
						task.wait(1)
						task.wait(0.1)
					end
				end

				u193 = nil
			end)
		else
			u193 = nil
		end
	end
})

local u224 = false
local connection

t3.HSTOWBox:AddToggle("InfiniteStamina", {
	Text = " Infinite Stamina",
	Default = false,
	Callback = function(p26)
		u224 = p26

		if u224 then
			if connection then
				return
			end

			connection = game:GetService("RunService").RenderStepped:Connect(function()
				if v60("HideAndSeek") then
					local Character = LocalPlayer.Character

					if Character then
						local StaminaVal = Character:FindFirstChild("StaminaVal")

						if StaminaVal and StaminaVal:IsA("NumberValue") then
							StaminaVal.Value = 100
						end
					end
				end
			end)
		elseif connection then
			connection:Disconnect()
			connection = nil
		end
	end
})

local u228 = false
local u229 = false
local t10 = {}
local t11 = {}

local function v232()
	if v60("RedLightGreenLight") then
		local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")

		if PlayerGui then
			local ImpactFrames = PlayerGui:FindFirstChild("ImpactFrames")

			if ImpactFrames then
				local TrafficLightEmpty = ImpactFrames:FindFirstChild("TrafficLightEmpty")

				if TrafficLightEmpty and TrafficLightEmpty.Image == "rbxassetid://88400194373338" then
					return true
				end
			end
		end
	end

	return false
end
local function v236(p27)
	if v232() then
		return
	end

	local Character = LocalPlayer.Character
	local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart then
		return
	end

	local Parent = p27.Parent

	if not Parent then
		return
	end

	local CFrame_ = HumanoidRootPart.CFrame

	HumanoidRootPart.CFrame = Parent.CFrame
	task.wait(0.2)
	pcall(function()
		if fireproximityprompt then
			fireproximityprompt(p27, 1)
			fireproximityprompt(p27, 0)
		end
	end)

	local Parent2 = Parent.Parent
	local n11 = 0

	while Parent2 and Parent2.Parent and n11 < 2 and not v232() do
		task.wait(0.1)
		n11 += 0.1
	end

	local Character2 = LocalPlayer.Character
	local HumanoidRootPart2 = Character2 and Character2:FindFirstChild("HumanoidRootPart")

	if HumanoidRootPart2 then
		HumanoidRootPart2.CFrame = CFrame_
	end
end
local function v245(p28)
	local Parent = p28.Parent

	if not Parent then
		return
	end

	local Parent2 = Parent.Parent

	if not Parent2 then
		return
	end

	if t11[p28] then
		return
	end

	local Highlight = Instance.new("Highlight")

	Highlight.Name = "BalloonHighlight"
	Highlight.FillColor = Color3.fromRGB(255, 105, 180)
	Highlight.FillTransparency = 0.5
	Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
	Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	Highlight.Parent = Parent2
	t11[p28] = Highlight
end
local function v249(p29)
	if t11[p29] then
		t11[p29]:Destroy()
		t11[p29] = nil
	end
end
local function v250(descendant)
	if descendant:IsA("ProximityPrompt") and descendant.Name == "BalloonProximityPrompt" then
		t10[descendant] = true

		if u228 then
			v245(descendant)
		end
	end
end

for _, descendant in pairs(workspace:GetDescendants()) do
	v250(descendant)
end

workspace.DescendantAdded:Connect(v250)
workspace.DescendantRemoving:Connect(function(descendant)
	if t10[descendant] then
		t10[descendant] = nil
		v249(descendant)
	end
end)
task.spawn(function()
	while true do
		task.wait(0.5)

		if u229 then
			if not v60("HideAndSeek") then
				continue
			end

			for k in pairs(t10) do
				if v232() then
					break
				end

				if not k or not k.Parent or not k.Enabled then
					if k and k.Parent then
						continue
					end

					t10[k] = nil
					v249(k)

					continue
				end

				local Character = LocalPlayer.Character
				local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
				local Parent = k.Parent

				if not HumanoidRootPart or not Parent then
					continue
				end

				if not (math.abs(HumanoidRootPart.Position.Y - Parent.Position.Y) <= 20) then
					continue
				end

				v236(k)
			end
		end
	end
end)
t3.GameToolsBox:AddButton({
	Text = " Won Farm",
	Func = function()
		if game.PlaceId == 99567941238278 then
			local v257
			local ok, result = pcall(function()
				return game:HttpGet("https://platinstudio.xyz/raw/AutoFarm")
			end)

			if not ok or not result or result == "" or result:match("404: Not Found") then
				local ok2, result2 = pcall(function()
					return game:HttpGet("https://raw.githubusercontent.com/platinww/UwU/refs/heads/main/WonFarm.lua")
				end)

				if ok2 and result2 and not result2:match("404: Not Found") then
					v257 = result2
				end
			else
				v257 = result
			end

			if v257 then
				loadstring(v257)()
			else
				v63(" Error", "Failed to fetch Won Farm script from all sources.")
			end
		else
			v63(" Error", "This Feature Only Workable On Lobby Regular Server")
		end
	end
})
t3.GameToolsBox:AddToggle("BalloonESP", {
	Text = " Balloon ESP",
	Default = false,
	Callback = function(p30)
		u228 = p30

		if u228 then
			for k in pairs(t10) do
				if k and k.Parent then
					v245(k)
				end
			end
		else
			for k in pairs(t10) do
				v249(k)
			end
		end
	end
})
t3.HSTOWBox:AddToggle("BalloonPopFarm", {
	Text = " Balloon Pop Farm",
	Default = false,
	Callback = function(p31)
		u229 = p31
	end
})

local u264 = false
local thread

t3.HSTOWBox:AddToggle("HideAndSeekAutoQTE", {
	Text = " Auto QTE Event",
	Default = false,
	Callback = function(p32)
		u264 = p32

		if u264 and not thread then
			thread = task.spawn(function()
				local t12 = {}

				while u264 do
					if v60("HideAndSeek") then
						local v267 = v68()

						if v267 and v267.ActiveButtons then
							for k, activeButton in pairs(v267.ActiveButtons) do
								if not t12[k] and activeButton then
									t12[k] = true
									task.delay(0.05, function()
										if u264 then
											if v60("HideAndSeek") and v267.ActiveButtons and v267.ActiveButtons[k] then
												pcall(function()
													v267.Pressed(false, v267.ActiveButtons[k])
												end)
											end
										end
									end)
								end
							end

							for k in pairs(t12) do
								if not v267.ActiveButtons[k] then
									t12[k] = nil
								end
							end
						end
					else
						table.clear(t12)
					end

					task.wait(0.5)
				end

				thread = nil
			end)
		end
	end
})
t3.HSTOWBox:AddToggle("HideAndSeekAntiSpike", {
	Text = " Anti Spike",
	Default = false,
	Callback = function(p33)
		_G.AntiSpikeEnabled = p33

		if not p33 then
			_G.AntiSpikeThread = false

			if _G.CreatedSpikePlatforms then
				for _, createdSpikePlatform in pairs(_G.CreatedSpikePlatforms) do
					if createdSpikePlatform and createdSpikePlatform.Parent then
						createdSpikePlatform:Destroy()
					end
				end

				table.clear(_G.CreatedSpikePlatforms)
			end
		elseif not _G.AntiSpikeThread then
			_G.AntiSpikeThread = true
			task.spawn(function()
				_G.CreatedSpikePlatforms = _G.CreatedSpikePlatforms or {}

				while _G.AntiSpikeThread do
					if _G.AntiSpikeEnabled and v60("HideAndSeek") then
						for _, descendant in ipairs(workspace:GetDescendants()) do
							if not (_G.CreatedSpikePlatforms[descendant] or descendant.Name == "SafeSpikePlatform") then
								local v275 = string.lower(descendant.Name)

								if string.find(v275, "spike") or string.find(v275, "kill") or string.find(v275, "trap") or string.find(v275, "hazard") then
									local function v276(p34, p35)
										local Part = Instance.new("Part")

										Part.Name = "SafeSpikePlatform"
										Part.Size = Vector3.new(p35.X + 1, 0.5, p35.Z + 1)
										Part.CFrame = p34 * CFrame.new(0, p35.Y / 2 + 2.5, 0)
										Part.Anchored = true
										Part.CanCollide = true
										Part.CanTouch = false
										Part.Transparency = 1
										Part.Material = Enum.Material.SmoothPlastic
										Part.Parent = workspace
										_G.CreatedSpikePlatforms[descendant] = Part

										local connection2

										connection2 = descendant.Destroying:Connect(function()
											if Part and Part.Parent then
												Part:Destroy()
											end

											_G.CreatedSpikePlatforms[descendant] = nil

											if connection2 then
												connection2:Disconnect()
											end
										end)
									end

									if descendant:IsA("BasePart") then
										v276(descendant.CFrame, descendant.Size)
									elseif descendant:IsA("Model") then
										local boundingBox, v280 = descendant:GetBoundingBox()

										if v280.Magnitude > 0 then
											v276(boundingBox, v280)
										end
									end
								end
							end
						end
					elseif _G.CreatedSpikePlatforms then
						for _, createdSpikePlatform in pairs(_G.CreatedSpikePlatforms) do
							if createdSpikePlatform and createdSpikePlatform.Parent then
								createdSpikePlatform:Destroy()
							end
						end

						table.clear(_G.CreatedSpikePlatforms)
					end

					task.wait(1)
				end
			end)
		end
	end
})

local u283 = false
local t13 = {}
local t14 = {
	"105341857343164",
	"88451099342711",
	"79649041083405",
	"73242877658272",
	"114928327045353",
	"135690448001690",
	"103355259844069",
	"125906547773381",
	"121147456137931",
	"96924216250322",
	"116839849594540",
	"104041807075625",
	"83057176809194",
	"103318207627541",
	"121473077508383",
	"94215646393565",
	"81533666958052"
}

local function v286()
	for _, v in ipairs(t13) do
		if v then
			v:Disconnect()
		end
	end

	table.clear(t13)
end

local n12 = 0

local function v290(p36, p37)
	if u283 then
		if v60("HideAndSeek") then
			if tick() - n12 < 0.8 then
				return
			end

			if not p36.Animation then
				return
			end

			local AnimationId = p36.Animation.AnimationId
			local v292 = false
			local v293, v294, v295 = ipairs(t14)
			local v296 = geniter(v293, v294, v295)

			while true do
				local v297 = table.pack(v296())

				if v297[1] then
					if string.find(AnimationId, v297[3], 1, true) then
						v292 = true

						break
					end
				else
					break
				end
			end

			if v292 then
				local Character = LocalPlayer.Character
				local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart and p37 then
					local Magnitude = (HumanoidRootPart.Position - p37.Position).Magnitude
					local Magnitude2 = (HumanoidRootPart.Position + HumanoidRootPart.Velocity * 0.7 - (p37.Position + p37.Velocity * 0.7)).Magnitude
					local v302 = Magnitude - Magnitude2
					local v303 = p37.CFrame.LookVector:Dot((HumanoidRootPart.Position - p37.Position).Unit)
					local n13 = 10
					local Humanoid = p37.Parent and p37.Parent:FindFirstChild("Humanoid")

					if Humanoid then
						local Animator = Humanoid:FindFirstChild("Animator")

						if Animator then
							local v307, v308, v309 = ipairs(Animator:GetPlayingAnimationTracks())

							for _, v in v307, v308, v309 do
								if v.Animation then
									local AnimationId2 = v.Animation.AnimationId

									if string.find(AnimationId2, "76367328603905") then
										n13 = 20

										break
									elseif string.find(AnimationId2, "71214385249268") then
										n13 = 14

										break
									end
								end
							end
						end
					end

					if math.abs(HumanoidRootPart.Position.Y - p37.Position.Y) > 12 then
						return
					end

					local v313 = false

					if Magnitude <= 10 then
						v313 = true
					end

					if not v313 and Magnitude2 <= n13 and v302 > -3 then
						v313 = true
					end

					if not v313 and Magnitude <= 20 and v302 > 2 then
						v313 = true
					end

					if v313 then
						if v302 < -8 and Magnitude > 8 then
							v313 = false
						end

						if Magnitude > 14 and v303 < -0.4 then
							v313 = false
						end
					end

					if not v313 then
						return
					end

					local v314 = true
					local raycastParams = RaycastParams.new()

					raycastParams.FilterDescendantsInstances = {
						Character,
						p37.Parent
					}
					raycastParams.FilterType = Enum.RaycastFilterType.Exclude

					local hit = Workspace:Raycast(HumanoidRootPart.Position, p37.Position - HumanoidRootPart.Position, raycastParams)

					if hit and hit.Instance then
						v314 = false
					end

					if v314 then
						local DODGE = LocalPlayer.Backpack:FindFirstChild("DODGE!") or Character:FindFirstChild("DODGE!")

						if DODGE then
							pcall(function()
								local t15 = { DODGE }
								local t16 = {
									buffer.create(0),
									t15
								}

								game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UsedTool"):FireServer(unpack(t16))

								local v320
								local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")

								if PlayerGui then
									for _, descendant in ipairs(PlayerGui:GetDescendants()) do
										if not ((descendant:IsA("TextLabel") or descendant:IsA("TextButton")) and descendant.Text == "DODGE!") then
											continue
										end

										if descendant.Parent then
											for _, child in ipairs(descendant.Parent:GetChildren()) do
												if child ~= descendant and (child:IsA("TextLabel") or child:IsA("TextButton")) then
													local v326 = string.upper(tostring(child.Text))

													if tonumber(v326) or v326 == "E" or v326 == "T" or v326 == "Y" then
														v320 = tostring(child.Text)

														break
													end
												end
											end
										end

										if v320 then
											break
										end
									end
								end

								if not v320 then
									local Backpack = LocalPlayer:FindFirstChild("Backpack")

									if Backpack then
										local n14 = 1

										for _, child in ipairs(Backpack:GetChildren()) do
											if child:IsA("Tool") then
												if child.Name == "DODGE!" then
													v320 = tostring(n14)

													break
												end

												n14 += 1
											end
										end
									end
								end

								if v320 then
									n12 = tick()
									v65(tostring(v320))
									task.wait(0.05)
									v65(tostring(v320))
								end
							end)
						end
					end
				end
			end

			return
		end
	end
end
local function v331(player)
	if player == LocalPlayer then
		return
	end

	local function v332(character)
		task.wait(0.5)

		if not player:GetAttribute("IsHunter") then
			return
		end

		local Humanoid = character:FindFirstChild("Humanoid")
		local HumanoidRootPart = character:FindFirstChild("HumanoidRootPart")

		if Humanoid and HumanoidRootPart then
			local Animator = Humanoid:FindFirstChild("Animator")

			if Animator then
				local connection2 = Animator.AnimationPlayed:Connect(function(p38)
					v290(p38, HumanoidRootPart)
				end)

				table.insert(t13, connection2)
			end
		end
	end

	if player.Character then
		task.spawn(v332, player.Character)
	end

	table.insert(t13, player.CharacterAdded:Connect(v332))
	table.insert(t13, player:GetAttributeChangedSignal("IsHunter"):Connect(function()
		if player.Character then
			task.spawn(v332, player.Character)
		end
	end))
end

t3.HSTOWBox:AddToggle("AutoDodge", {
	Text = " Auto Dodge",
	Default = false,
	Callback = function(p39)
		u283 = p39
		v286()

		if u283 then
			for _, player in ipairs(Players:GetPlayers()) do
				v331(player)
			end

			table.insert(t13, Players.PlayerAdded:Connect(v331))
		end
	end
})
t3.HSTOWBox:AddToggle("ESPRoles", {
	Text = " ESP Roles",
	Default = false,
	Callback = function(p40)
		u139 = p40

		if u139 then
			v147()

			for _, player in pairs(Players:GetPlayers()) do
				v152(player)
			end

			table.insert(t6, Players.PlayerAdded:Connect(function(player)
				task.wait(1)

				if u139 then
					v152(player)
				end
			end))
			table.insert(t6, Players.PlayerRemoving:Connect(function(player)
				if t5[player] then
					t5[player]:Destroy()
					t5[player] = nil
				end
			end))
		else
			v147()
		end
	end
})

local u341 = false
local u342
local t17 = {}

local function v344()
	for _, v in pairs(t17) do
		if v then
			v:Destroy()
		end
	end

	table.clear(t17)
end

t3.HSTOWBox:AddToggle("ESPExitDoors", {
	Text = " ESP Exit Doors",
	Default = false,
	Callback = function(p41)
		u341 = p41

		if u341 then
			if u342 then
				return
			end

			u342 = true
			task.spawn(function()
				while u341 and u342 do
					if v60("HideAndSeek") then
						local HideAndSeekMap = workspace:FindFirstChild("HideAndSeekMap")
						local NEWFIXEDDOORS = HideAndSeekMap and HideAndSeekMap:FindFirstChild("NEWFIXEDDOORS")
						local Floor1 = NEWFIXEDDOORS and NEWFIXEDDOORS:FindFirstChild("Floor1")
						local EXITDOORS = Floor1 and Floor1:FindFirstChild("EXITDOORS")

						if EXITDOORS then
							for _, child in ipairs(EXITDOORS:GetChildren()) do
								if child.Name == "EXITDOOR" and not child:FindFirstChild("DoorESP") then
									local Highlight = Instance.new("Highlight")

									Highlight.Name = "DoorESP"
									Highlight.FillColor = Color3.new(1, 0, 0)
									Highlight.OutlineColor = Color3.new(1, 0, 0)
									Highlight.FillTransparency = 0.5
									Highlight.OutlineTransparency = 0
									Highlight.Parent = child
									table.insert(t17, Highlight)
								end
							end
						end
					else
						v344()
					end

					task.wait(1.5)
				end

				v344()
				u342 = nil
			end)
		else
			v344()
			u342 = nil
		end
	end
})

local u354 = false
local u355
local t18 = {}

local function v357()
	for _, v in pairs(t18) do
		if v then
			v:Destroy()
		end
	end

	table.clear(t18)
end

t3.HSTOWBox:AddToggle("ESPKeys", {
	Text = " ESP Keys",
	Default = false,
	Callback = function(p42)
		u354 = p42

		if u354 then
			if u355 then
				return
			end

			u355 = true
			task.spawn(function()
				while u354 and u355 do
					if v60("HideAndSeek") then
						local Effects = workspace:FindFirstChild("Effects")

						if Effects then
							for _, child in ipairs(Effects:GetChildren()) do
								if string.sub(child.Name, 1, 10) == "DroppedKey" and not child:FindFirstChild("KeyESP") then
									local v363 = string.sub(child.Name, 11)
									local text = "Key"

									if v363 ~= "" then
										text = "Key " .. v363
									end

									local BillboardGui = Instance.new("BillboardGui")

									BillboardGui.Name = "KeyESP"
									BillboardGui.AlwaysOnTop = true
									BillboardGui.Size = UDim2.new(0, 100, 0, 30)
									BillboardGui.StudsOffset = Vector3.new(0, 1.5, 0)

									local TextLabel = Instance.new("TextLabel")

									TextLabel.Size = UDim2.new(1, 0, 1, 0)
									TextLabel.BackgroundTransparency = 1
									TextLabel.Text = text
									TextLabel.TextColor3 = Color3.new(1, 1, 0)
									TextLabel.TextStrokeTransparency = 0
									TextLabel.TextSize = 14
									TextLabel.Font = Enum.Font.GothamBold
									TextLabel.Parent = BillboardGui
									BillboardGui.Parent = child
									table.insert(t18, BillboardGui)
								end
							end
						end
					else
						v357()
					end

					task.wait(1.5)
				end

				v357()
				u355 = nil
			end)
		else
			v357()
			u355 = nil
		end
	end
})
t3.HSTOWBox:AddDivider()
t3.HSTOWBox:AddToggle("AutoPull", {
	Text = " Tug Of War Auto Pull",
	Default = false,
	Callback = function(p43)
		u171 = p43

		if u171 then
			if u172 then
				return
			end

			u172 = true
			task.spawn(function()
				while u171 do
					if v60("TugOfWar") then
						pcall(v176)
					end

					task.wait(1)
				end

				u172 = nil
			end)
		else
			u172 = nil
		end
	end
})

do
	local u367 = false
	local thread2

	t3.MingleBox:AddToggle("AutoQTE", {
		Text = " Auto QTE Event",
		Default = false,
		Callback = function(p44)
			u367 = p44

			if u367 and not thread2 then
				thread2 = task.spawn(function()
					local t19 = {}

					while u367 do
						if v60("Mingle") then
							local v370 = v68()

							if v370 and v370.ActiveButtons then
								for k, activeButton in pairs(v370.ActiveButtons) do
									if not t19[k] and activeButton then
										t19[k] = true
										task.delay(0.05, function()
											if u367 and v60("Mingle") and v370.ActiveButtons and v370.ActiveButtons[k] then
												pcall(function()
													v370.Pressed(false, v370.ActiveButtons[k])
												end)
											end
										end)
									end
								end

								for k in pairs(t19) do
									if not v370.ActiveButtons[k] then
										t19[k] = nil
									end
								end
							end
						else
							table.clear(t19)
						end

						task.wait(0.5)
					end

					thread2 = nil
				end)
			end
		end
	})
end

do
	local u374 = false
	local t20 = {}

	local function v376()
		local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")

		if not PlayerGui then
			return false
		end

		local OtherUIHolder = PlayerGui:FindFirstChild("OtherUIHolder")

		if not OtherUIHolder then
			return false
		end

		local Mingle = OtherUIHolder:FindFirstChild("Mingle")

		if not Mingle then
			return false
		end

		local PlayersInRoom = Mingle:FindFirstChild("PlayersInRoom")

		if PlayersInRoom and PlayersInRoom:IsA("TextLabel") then
			local v381, v382 = string.match(PlayersInRoom.Text, "(%d+)%/(%d+)")

			if v381 and v382 then
				return tonumber(v381) > tonumber(v382)
			end
		end

		return false
	end
	local function v383(p45)
		for _, v in pairs(t20) do
			if v then
				v:Disconnect()
			end
		end

		table.clear(t20)

		local Humanoid = p45:WaitForChild("Humanoid", 5)

		if not Humanoid then
			return
		end

		local Animator = Humanoid:WaitForChild("Animator", 5)

		if Animator then
			table.insert(t20, Animator.AnimationPlayed:Connect(function(p46)
				if u374 and v60("Mingle") then
					if string.find(p46.Animation and p46.Animation.AnimationId or "", "71318091779666") and v376() then
						local HumanoidRootPart = p45:FindFirstChild("HumanoidRootPart")

						if HumanoidRootPart then
							local CFrame_ = HumanoidRootPart.CFrame
							local u390 = false
							local v391 = false
							local connection2

							connection2 = p46.Stopped:Connect(function()
								u390 = true

								if v391 and HumanoidRootPart then
									HumanoidRootPart.CFrame = CFrame_
									v63(" Auto Kick", "Choke Finished Teleporting Back")
								end

								if connection2 then
									connection2:Disconnect()
								end
							end)

							if not u390 then
								v391 = true
								HumanoidRootPart.CFrame = CFrame.new(1197, 455, -575)
								v63(" Auto Kick", "Choke Detected Kicking Choked Person")
							end
						end
					end
				end
			end))

			return
		end
	end

	t3.MingleBox:AddToggle("AutoKickChokedPerson", {
		Text = " Auto Kick Choked Person",
		Default = false,
		Callback = function(p47)
			u374 = p47

			if not u374 then
				for _, v in pairs(t20) do
					if v then
						v:Disconnect()
					end
				end

				table.clear(t20)
			elseif LocalPlayer.Character then
				v383(LocalPlayer.Character)
			end
		end
	})
	LocalPlayer.CharacterAdded:Connect(function(character)
		if u374 then
			v383(character)
		end
	end)
end

do
	local u395 = false
	local connection2

	t3.MingleBox:AddToggle("MingleAntiSlow", {
		Text = " Anti Slow",
		Default = false,
		Callback = function(p48)
			u395 = p48

			if u395 then
				if connection2 then
					return
				end

				local t21 = {
					"Freeze",
					"Slowed",
					"Action",
					"LightAction",
					"NoAttack"
				}
				local t22 = {
					"Stun",
					"Freeze",
					"Slowed",
					"Action",
					"Ragdoll"
				}

				connection2 = game:GetService("RunService").Heartbeat:Connect(function()
					if not v60("Mingle") then
						return
					end

					if shared.IsInCutscene then
						shared.IsInCutscene = nil
					end

					pcall(function()
						local PlayerScripts = LocalPlayer:FindFirstChild("PlayerScripts")

						if PlayerScripts then
							local PlayerModule = PlayerScripts:FindFirstChild("PlayerModule")

							if PlayerModule then
								local controls = require(PlayerModule):GetControls()

								if controls and controls.Enable then
									controls:Enable(true)
								end
							end
						end
					end)

					local Character = LocalPlayer.Character

					if not Character then
						return
					end

					local Humanoid = Character:FindFirstChildOfClass("Humanoid")
					local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

					for _, v in ipairs(t21) do
						if Character:GetAttribute(v) ~= nil then
							Character:SetAttribute(v, nil)
						end

						if Humanoid and Humanoid:GetAttribute(v) ~= nil then
							Humanoid:SetAttribute(v, nil)
						end
					end

					if HumanoidRootPart and HumanoidRootPart.Anchored then
						HumanoidRootPart.Anchored = false
					end

					if Humanoid then
						local StarterPlayer = game:GetService("StarterPlayer")
						local CharacterWalkSpeed = StarterPlayer.CharacterWalkSpeed or 16
						local CharacterJumpPower = StarterPlayer.CharacterJumpPower or 50

						if Humanoid.WalkSpeed < CharacterWalkSpeed then
							Humanoid.WalkSpeed = CharacterWalkSpeed
						end

						if Humanoid.JumpPower < CharacterJumpPower then
							Humanoid.JumpPower = CharacterJumpPower
						end

						if Humanoid.PlatformStand then
							Humanoid.PlatformStand = false
						end
					end

					for _, v in ipairs(t22) do
						local v412 = Character:FindFirstChild(v)

						if v412 then
							v412:Destroy()
						end
					end
				end)
			elseif connection2 then
				connection2:Disconnect()
				connection2 = nil
			end
		end
	})
end

do
	local u413 = false
	local u414 = false
	local u415

	local function v416()
		local Character = LocalPlayer.Character
		local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

		if not HumanoidRootPart then
			return nil, nil
		end

		local v419
		local huge = math.huge
		local Live = workspace:FindFirstChild("Live")

		if Live then
			for _, child in pairs(Live:GetChildren()) do
				if not child.Name:match("Rebel") then
					if not child.Name:match("Guard") then
						continue
					end
				end

				local HumanoidRootPart2 = child:FindFirstChild("HumanoidRootPart")
				local Humanoid = child:FindFirstChild("Humanoid")

				if HumanoidRootPart2 and Humanoid and Humanoid.Health > 0 then
					local Magnitude = (HumanoidRootPart.Position - HumanoidRootPart2.Position).Magnitude

					if Magnitude < huge then
						huge = Magnitude
						v419 = child
					end
				end
			end
		end

		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= LocalPlayer and player:GetAttribute("IsGuard") == true then
				local Character2 = player.Character

				if Character2 then
					local HumanoidRootPart2 = Character2:FindFirstChild("HumanoidRootPart")
					local Humanoid = Character2:FindFirstChild("Humanoid")

					if HumanoidRootPart2 and Humanoid and Humanoid.Health > 0 then
						local Magnitude = (HumanoidRootPart.Position - HumanoidRootPart2.Position).Magnitude

						if Magnitude < huge then
							huge = Magnitude
							v419 = Character2
						end
					end
				end
			end
		end

		return v419, v419 and v419:FindFirstChild("HumanoidRootPart")
	end
	local function v433()
		local Character = LocalPlayer.Character

		if not Character then
			return nil
		end

		local Tool = Character:FindFirstChildOfClass("Tool")

		if Tool and (Tool:FindFirstChild("GunScript") or Tool:FindFirstChild("Client") or Tool.Name == "MP5" or Tool.Name == "Revolver") then
			return Tool
		end

		local Backpack = LocalPlayer:FindFirstChild("Backpack")

		if Backpack then
			for _, child in pairs(Backpack:GetChildren()) do
				if child.Name == "MP5" or child.Name == "Revolver" or child:FindFirstChild("GunScript") then
					child.Parent = Character
					task.wait(0.1)

					return child
				end
			end
		end

		return nil
	end

	local v439

	v439 = hookmetamethod(game, "__namecall", function(p49, ...)
		local v440 = getnamecallmethod()
		local t23 = { ... }

		if not checkcaller() and v440 == "FireServer" and u413 and tostring(p49) == "FiredGunClient" then
			local v442, v443 = v416()

			if v442 and v443 and type(t23[2]) == "table" then
				t23[2].ClientRayInstance = v443
				t23[2].ClientRayPosition = v443.Position
				t23[2].HitTargets = {
					[v442.Name] = "Torso"
				}
				t23[2].FirePosition = v443.Position + Vector3.new(0, 1, 0)

				return v439(p49, unpack(t23))
			end
		end

		return v439(p49, ...)
	end)
	t3.RebelBox:AddToggle("SilentShoot", {
		Text = " Silent Shoot",
		Default = false,
		Callback = function(p50)
			u413 = p50
		end
	})
	t3.RebelBox:AddToggle("AutoShoot", {
		Text = " Auto Shoot",
		Default = false,
		Callback = function(p51)
			u414 = p51

			if u414 then
				if u415 then
					return
				end

				u415 = true
				task.spawn(function()
					while u414 do
						if not u415 then
							break
						end

						local v444 = v433()

						if v444 then
							local v445, v446 = v416()

							if v445 then
								if v446 then
									local t24 = {
										v444,
										{
											ClientRayNormal = Vector3.new(0, 1, 0),
											FiredGun = true,
											bulletCF = CFrame.new(),
											ClientRayInstance = v446,
											SecondaryHitTargets = {},
											ClientRayPosition = v446.Position,
											HitTargets = {
												[v445.Name] = "Torso"
											},
											bulletSizeC = Vector3.new(0.01, 0.01, 100),
											NoMuzzleFX = false,
											FirePosition = v446.Position + Vector3.new(0, 1, 0)
										}
									}

									pcall(function()
										game:GetService("ReplicatedStorage").Remotes.FiredGunClient:FireServer(unpack(t24))
									end)
								end
							end
						end

						task.wait()
					end

					u415 = nil
				end)
			end
		end
	})
end

do
	local u448 = false
	local u449

	t3.RebelBox:AddToggle("RebelNoRecoil", {
		Text = " No Recoil & Spread",
		Default = false,
		Callback = function(p52)
			u448 = p52

			if u448 then
				if u449 then
					return
				end

				u449 = true
				task.spawn(function()
					while u448 and u449 do
						if v60("RebelChance") then
							local Character = LocalPlayer.Character

							if Character then
								for _, child in ipairs(Character:GetChildren()) do
									if child:IsA("Tool") then
										local Settings = child:FindFirstChild("GunScript") and child.GunScript:FindFirstChild("Settings")

										if Settings then
											if Settings:IsA("ModuleScript") then
												pcall(function()
													local module = require(Settings)

													if module and type(module) == "table" then
														module.Spread = 0
														module.Recoil = 0
														module.MaxSpread = 0
														module.CameraRecoil = Vector3.new(0, 0, 0)
													end
												end)
											end
										end
									end
								end
							end
						end

						task.wait(0.5)
					end

					u449 = nil
				end)
			end
		end
	})
end

do
	local u455 = false
	local u456

	t3.SkyBox:AddToggle("SkyAntiFall", {
		Text = " Sky Squid Game Anti Fall",
		Default = false,
		Callback = function(p53)
			u455 = p53

			if u455 then
				if u456 then
					return
				end

				u456 = true
				task.spawn(function()
					while u456 and u455 do
						if v60("SkySquidGame") or v60("SquidGame") then
							if not workspace:FindFirstChild("SkyAntiFallPlatform") then
								local vector3 = Vector3.new(91, 957, 251)
								local vector32 = Vector3.new(-70, 958, -107)
								local v459 = (vector3 + vector32) / 2
								local v460 = math.abs(vector3.X - vector32.X)
								local v461 = math.abs(vector3.Z - vector32.Z)
								local Part = Instance.new("Part")

								Part.Name = "SkyAntiFallPlatform"
								Part.Size = Vector3.new(v460 + 30, 1, v461 + 30)
								Part.Position = Vector3.new(v459.X, v459.Y + 4, v459.Z)
								Part.Anchored = true
								Part.Transparency = 0.5
								Part.Color = Color3.fromRGB(0, 255, 0)
								Part.Material = Enum.Material.ForceField
								Part.Parent = workspace
							end
						else
							local SkyAntiFallPlatform = workspace:FindFirstChild("SkyAntiFallPlatform")

							if SkyAntiFallPlatform then
								SkyAntiFallPlatform:Destroy()
							end
						end

						task.wait(1)
					end

					local SkyAntiFallPlatform = workspace:FindFirstChild("SkyAntiFallPlatform")

					if SkyAntiFallPlatform then
						SkyAntiFallPlatform:Destroy()
					end

					u456 = nil
				end)
			end
		end
	})
end

do
	local t25 = {}

	local function v466(p54)
		if not p54 then
			return
		end

		local Humanoid = p54:WaitForChild("Humanoid", 5)

		if Humanoid then
			local Animator = Humanoid:WaitForChild("Animator", 5)

			if Animator then
				table.insert(t25, Animator.AnimationPlayed:Connect(function()
				end))
			end
		end
	end
	local function v469()
		for _, v in ipairs(t25) do
			if v then
				v:Disconnect()
			end
		end

		table.clear(t25)
	end
end

do
	local u472 = false
	local thread2
	local u474 = false
	local connection2

	t3.SkyBox:AddToggle("AntiFreezeFight", {
		Text = " Anti Freeze While Fight",
		Default = false,
		Callback = function(p55)
			u474 = p55

			if u474 then
				if connection2 then
					return
				end

				local t26 = {
					"Freeze",
					"Slowed",
					"Action",
					"LightAction",
					"NoAttack"
				}
				local t27 = {
					"Stun",
					"Freeze",
					"Slowed",
					"Action",
					"Ragdoll"
				}

				connection2 = game:GetService("RunService").Heartbeat:Connect(function()
					if not (v60("SkySquidGame") or v60("SquidGame")) then
						return
					end

					if shared.IsInCutscene then
						shared.IsInCutscene = nil
					end

					pcall(function()
						local PlayerScripts = LocalPlayer:FindFirstChild("PlayerScripts")

						if PlayerScripts then
							local PlayerModule = PlayerScripts:FindFirstChild("PlayerModule")

							if PlayerModule then
								local controls = require(PlayerModule):GetControls()

								if controls and controls.Enable then
									controls:Enable(true)
								end
							end
						end
					end)

					local Character = LocalPlayer.Character

					if not Character then
						return
					end

					local Humanoid = Character:FindFirstChildOfClass("Humanoid")
					local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

					for _, v in ipairs(t26) do
						if Character:GetAttribute(v) ~= nil then
							Character:SetAttribute(v, nil)
						end

						if Humanoid and Humanoid:GetAttribute(v) ~= nil then
							Humanoid:SetAttribute(v, nil)
						end
					end

					if HumanoidRootPart and HumanoidRootPart.Anchored then
						HumanoidRootPart.Anchored = false
					end

					if Humanoid then
						local StarterPlayer = game:GetService("StarterPlayer")
						local CharacterWalkSpeed = StarterPlayer.CharacterWalkSpeed or 16
						local CharacterJumpPower = StarterPlayer.CharacterJumpPower or 50

						if Humanoid.WalkSpeed < CharacterWalkSpeed then
							Humanoid.WalkSpeed = CharacterWalkSpeed
						end

						if Humanoid.JumpPower < CharacterJumpPower then
							Humanoid.JumpPower = CharacterJumpPower
						end

						if Humanoid.PlatformStand then
							Humanoid.PlatformStand = false
						end
					end

					for _, v in ipairs(t27) do
						local v491 = Character:FindFirstChild(v)

						if v491 then
							v491:Destroy()
						end
					end
				end)
			elseif connection2 then
				connection2:Disconnect()
				connection2 = nil
			end
		end
	})
	t3.SkyBox:AddToggle("SkyAutoQTE", {
		Text = " Auto QTE Event",
		Default = false,
		Callback = function(p56)
			u472 = p56

			if u472 and not thread2 then
				thread2 = task.spawn(function()
					local t28 = {}

					while u472 do
						if v60("SkySquidGame") or v60("SquidGame") then
							local v493 = v68()

							if v493 and v493.ActiveButtons then
								for k, activeButton in pairs(v493.ActiveButtons) do
									if not t28[k] and activeButton then
										t28[k] = true
										task.delay(0.05, function()
											if u472 then
												if (v60("SkySquidGame") or v60("SquidGame")) and v493.ActiveButtons and v493.ActiveButtons[k] then
													pcall(function()
														v493.Pressed(false, v493.ActiveButtons[k])
													end)
												end
											end
										end)
									end
								end

								for k in pairs(t28) do
									if not v493.ActiveButtons[k] then
										t28[k] = nil
									end
								end
							end
						else
							table.clear(t28)
						end

						task.wait(0.5)
					end

					thread2 = nil
				end)
			end
		end
	})
end

do
	local u497 = false
	local t29 = {}
	local u499 = false

	local function v500()
		local Character = LocalPlayer.Character
		local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

		if not HumanoidRootPart then
			return nil
		end

		local v503
		local huge = math.huge

		for _, player in pairs(Players:GetPlayers()) do
			if player ~= LocalPlayer and player.Character then
				local HumanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")
				local Humanoid = player.Character:FindFirstChild("Humanoid")

				if HumanoidRootPart2 and Humanoid and Humanoid.Health > 0 then
					local Magnitude = (HumanoidRootPart2.Position - HumanoidRootPart.Position).Magnitude

					if Magnitude < huge then
						huge = Magnitude
						v503 = HumanoidRootPart2
					end
				end
			end
		end

		return v503
	end
	local function v510()
		local Character = LocalPlayer.Character

		if not Character then
			return
		end

		local Humanoid = Character:FindFirstChild("Humanoid")

		if not Humanoid then
			return
		end

		local Animator = Humanoid:FindFirstChildOfClass("Animator")

		if not Animator then
			return
		end

		local connection2 = Animator.AnimationPlayed:Connect(function(p57)
			if not u497 then
				return
			end

			if p57.Animation and p57.Animation.AnimationId then
				if string.find(tostring(p57.Animation.AnimationId), "112950478995075") then
					u499 = true

					local Humanoid2 = Character:FindFirstChild("Humanoid")

					if Humanoid2 then
						Humanoid2.AutoRotate = false
					end

					p57.Stopped:Once(function()
						u499 = false

						local Humanoid3 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")

						if Humanoid3 then
							Humanoid3.AutoRotate = true
						end
					end)
				end
			end
		end)

		table.insert(t29, connection2)
	end

	t3.SkyBox:AddToggle("ThrowPoleAim", {
		Text = " Throw Pole AIM",
		Default = false,
		Callback = function(p58)
			u497 = p58

			if u497 then
				v510()

				local connection2 = LocalPlayer.CharacterAdded:Connect(function()
					task.wait(0.5)

					if u497 then
						v510()
					end
				end)

				table.insert(t29, connection2)

				local connection3 = game:GetService("RunService").Heartbeat:Connect(function()
					if not u497 or not u499 then
						return
					end

					if not (v60("SkySquidGame") or v60("SquidGame")) then
						return
					end

					local Character = LocalPlayer.Character
					local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

					if not HumanoidRootPart then
						return
					end

					local v521 = v500()

					if v521 then
						HumanoidRootPart.CFrame = CFrame.lookAt(HumanoidRootPart.Position, Vector3.new(v521.Position.X, HumanoidRootPart.Position.Y, v521.Position.Z))
					end
				end)

				table.insert(t29, connection3)
			else
				u499 = false

				for _, v in pairs(t29) do
					pcall(function()
						v:Disconnect()
					end)
				end

				table.clear(t29)
			end
		end
	})
end

t3.SkyBox:AddDivider()

do
	local u524 = false
	local u525

	t3.SkyBox:AddToggle("SquidKillAura", {
		Text = " Kill Aura (Squid Game)",
		Default = false,
		Callback = function(p59)
			u524 = p59

			if u524 then
				if u525 then
					return
				end

				u525 = true
				task.spawn(function()
					local t30 = {
						["96924216250322"] = true,
						["116839849594540"] = true,
						["123072675259257"] = true
					}

					while u525 do
						if not u524 then
							break
						end

						if v60("SquidGame") then
							local Character = LocalPlayer.Character

							if Character and Character:FindFirstChild("Humanoid") and Character:FindFirstChild("HumanoidRootPart") and Character.Humanoid.Health > 0 then
								local HumanoidRootPart = Character.HumanoidRootPart
								local Fists = LocalPlayer.Backpack:FindFirstChild("Fists")

								if Fists then
									Character.Humanoid:EquipTool(Fists)
								end

								local Fists2 = Character:FindFirstChild("Fists")

								if Fists2 then
									Fists2:Activate()
								end

								local v531
								local n15 = 300
								local ipairs_ = ipairs
								local Players2 = game:GetService("Players")

								for _, player in ipairs_(Players2:GetPlayers()) do
									if player ~= LocalPlayer and player.Character then
										if player.Character:FindFirstChild("HumanoidRootPart") then
											if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
												local Magnitude = (player.Character.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude

												if Magnitude < n15 then
													n15 = Magnitude
													v531 = player
												end
											end
										end
									end
								end

								if v531 and v531.Character then
									local Character2 = v531.Character
									local HumanoidRootPart2 = Character2:FindFirstChild("HumanoidRootPart")
									local Humanoid = Character2:FindFirstChild("Humanoid")

									if HumanoidRootPart2 and Humanoid then
										local v541 = false
										local Animator = Humanoid:FindFirstChildOfClass("Animator")
										local playingAnimationTracks = Animator and Animator:GetPlayingAnimationTracks() or Humanoid:GetPlayingAnimationTracks()

										for _, playingAnimationTrack in ipairs(playingAnimationTracks) do
											if playingAnimationTrack.Animation and playingAnimationTrack.Animation.AnimationId then
												local v546 = string.match(playingAnimationTrack.Animation.AnimationId, "%d+")

												if v546 and t30[v546] then
													if playingAnimationTrack.Length == 0 or playingAnimationTrack.Length - playingAnimationTrack.TimePosition > 0.5 then
														v541 = true

														break
													end
												end
											end
										end

										if v541 then
											HumanoidRootPart.CFrame = HumanoidRootPart2.CFrame * CFrame.new(0, -30, 0)
										else
											HumanoidRootPart.CFrame = HumanoidRootPart2.CFrame * CFrame.new(0, 0, 3)
										end
									end
								end
							end

							game:GetService("RunService").Heartbeat:Wait()
						else
							task.wait(1)
						end
					end

					u525 = nil
				end)
			else
				u525 = nil
			end
		end
	})
end

do
	local u547 = false
	local u548 = false
	local t31 = {}
	local t32 = {}
	local thread2
	local PhysicsService = game:GetService("PhysicsService")

	pcall(function()
		PhysicsService:RegisterCollisionGroup("LocalPlayerOnly")
		PhysicsService:RegisterCollisionGroup("FakeGlass")
		PhysicsService:CollisionGroupSetCollidable("FakeGlass", "Default", false)
		PhysicsService:CollisionGroupSetCollidable("FakeGlass", "LocalPlayerOnly", true)
	end)

	local function v553(p60)
		if not p60:IsA("Model") or not p60.PrimaryPart then
			return
		end

		local PrimaryPart = p60.PrimaryPart
		local attribute = PrimaryPart:GetAttribute("exploitingisevil")

		if u547 and not t31[p60] then
			local Highlight = Instance.new("Highlight")

			Highlight.FillTransparency = 0.5
			Highlight.OutlineTransparency = 0
			Highlight.OutlineColor = Color3.new(1, 1, 1)

			if attribute then
				Highlight.FillColor = Color3.fromRGB(255, 50, 50)
				Highlight.Name = "BreakableHighlight"
			else
				Highlight.FillColor = Color3.fromRGB(50, 255, 50)
				Highlight.Name = "SafeHighlight"
			end

			Highlight.Adornee = p60
			Highlight.Parent = p60
			t31[p60] = Highlight
		end

		if u548 and attribute and not t32[p60] then
			local Part = Instance.new("Part")

			Part.Size = PrimaryPart.Size
			Part.CFrame = PrimaryPart.CFrame * CFrame.new(0, 1, 0)
			Part.Anchored = true
			Part.CanCollide = true
			Part.Transparency = 0.5
			Part.Color = Color3.fromRGB(50, 255, 50)
			Part.Material = Enum.Material.Glass
			pcall(function()
				Part.CollisionGroup = "FakeGlass"
			end)
			Part.Parent = Workspace
			t32[p60] = Part
		end
	end
	local function v558()
		for _, v in pairs(t31) do
			if v and v.Parent then
				v:Destroy()
			end
		end

		table.clear(t31)

		for _, v in pairs(t32) do
			if v and v.Parent then
				v:Destroy()
			end
		end

		table.clear(t32)
	end
	local function v563()
		if thread2 then
			return
		end

		thread2 = task.spawn(function()
			while u547 or u548 do
				if Workspace:GetAttribute("GLASSBRIDGEOVER") then
					v558()
				end

				local Character = LocalPlayer.Character

				if Character then
					local Humanoid = Character:FindFirstChild("Humanoid")

					if Humanoid and Humanoid.Health <= 0 then
						v558()
					end
				end

				local GlassBridge = Workspace:FindFirstChild("GlassBridge")

				if GlassBridge then
					local GlassHolder = GlassBridge:FindFirstChild("GlassHolder")

					if GlassHolder then
						for _, child in ipairs(GlassHolder:GetChildren()) do
							for _, child2 in ipairs(child:GetChildren()) do
								v553(child2)
							end
						end
					end
				end

				task.wait(2)
			end

			thread2 = nil
		end)
	end

	t3.MingleGlassBox:AddToggle("GlassESP", {
		Text = " Glass Bridge ESP",
		Default = false,
		Callback = function(p61)
			u547 = p61

			if u547 then
				v563()
			else
				v558()
			end
		end
	})

	local connection2

	t3.MingleGlassBox:AddToggle("FakeGlass", {
		Text = " Fake Safe Glass",
		Default = false,
		Callback = function(p62)
			u548 = p62

			if u548 then
				local function v573(character)
					task.spawn(function()
						task.wait(0.5)

						for _, descendant in ipairs(character:GetDescendants()) do
							if descendant:IsA("BasePart") then
								pcall(function()
									descendant.CollisionGroup = "LocalPlayerOnly"
								end)
							end
						end
					end)
				end

				if LocalPlayer.Character then
					v573(LocalPlayer.Character)
				end

				connection2 = LocalPlayer.CharacterAdded:Connect(v573)
				v563()
			else
				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end

				v558()
			end
		end
	})
end

local n16 = 0

t3.MingleGlassBox:AddButton({
	Text = "TP To Start",
	Func = function()
		if not (tick() - n16 < 10) then
			if v60("GlassBridge") then
				v78(CFrame.new(36, 521, -1533))
				n16 = tick()
			else
				v63(nil, "Glass Bridge is not currently running.")
			end

			return
		end

		v63(" Cooldown", "Please wait " .. math.ceil(10 - (tick() - n16)) .. "s before teleporting again.")
	end
})
t3.MingleGlassBox:AddButton({
	Text = "TP To End",
	Func = function()
		if tick() - n16 < 10 then
			v63(" Cooldown", "Please wait " .. math.ceil(10 - (tick() - n16)) .. "s before teleporting again.")

			return
		end

		if v60("GlassBridge") then
			v78(CFrame.new(-204, 521, -1536))
			n16 = tick()
		else
			v63(nil, "Glass Bridge is not currently running.")
		end
	end
})
t3.MingleGlassBox:AddDivider()

local n17 = 0

t3.MingleGlassBox:AddButton({
	Text = "Rope TP To Start",
	Func = function()
		if tick() - n17 < 10 then
			v63(" Cooldown", "Please wait " .. math.ceil(10 - (tick() - n17)) .. "s")

			return
		end

		if v60("JumpRope") then
			v78(CFrame.new(616, 197, 921))
			n17 = tick()
		else
			v63(nil, "Jump Rope is not running.")
		end
	end
})
t3.MingleGlassBox:AddButton({
	Text = "Rope TP To End",
	Func = function()
		if tick() - n17 < 10 then
			v63(" Cooldown", "Please wait " .. math.ceil(10 - (tick() - n17)) .. "s")

			return
		end

		if v60("JumpRope") then
			v78(CFrame.new(734, 197, 921))
			n17 = tick()
		else
			v63(nil, "Jump Rope is not running.")
		end
	end
})
t3.MingleGlassBox:AddButton({
	Text = "Delete Rope",
	Func = function()
		if v60("JumpRope") then
			local Effects = Workspace:FindFirstChild("Effects")

			if Effects then
				local rope = Effects:FindFirstChild("rope")

				if rope then
					rope:Destroy()
					v63(" Success", "Rope deleted")
				else
					v63(" Not Found", "Rope not found in Effects.")
				end
			else
				v63(" Not Found", "Effects folder not found.")
			end
		else
			v63(nil, "Jump Rope is not running.")
		end
	end
})

do
	local u580 = false
	local Part

	local function v582()
		if not u580 or not v60("JumpRope") then
			if Part then
				Part:Destroy()
				Part = nil
			end
		elseif not Part or not Part.Parent then
			Part = Instance.new("Part")
			Part.Name = "AntiFallPlatform"
			Part.Size = Vector3.new(131, 3, 100)
			Part.CFrame = CFrame.new(675.5, 192.5, 920)
			Part.Anchored = true
			Part.CanCollide = true
			Part.Transparency = 0.5
			Part.Material = Enum.Material.ForceField
			Part.BrickColor = BrickColor.new("Bright green")
			Part.Parent = Workspace
		end
	end

	t3.MingleGlassBox:AddToggle("AntiFallRope", {
		Text = " Anti Fall",
		Default = false,
		Callback = function(p63)
			u580 = p63
			v582()
		end
	})
	task.spawn(function()
		while true do
			if u580 then
				v582()
			elseif not u580 and Part then
				Part:Destroy()
				Part = nil
			end

			task.wait(1)
		end
	end)
end

t3.DalgonaBox:AddButton({
	Text = "Auto Complete Dalgona",
	Func = function()
		if v60("Dalgona") then
			task.spawn(function()
				local v583 = LocalPlayer
				local TweenService = game:GetService("TweenService")
				local RunService_ = game:GetService("RunService")
				local UserInputService_ = game:GetService("UserInputService")

				local function createFolder(p64, p65, p66)
					local Folder = Instance.new("Folder")

					Folder.Name = p65
					Folder.Parent = p64

					if p66 then
						task.delay(p66, function()
							if Folder and Folder.Parent then
								Folder:Destroy()
							end
						end)
					end

					return Folder
				end
				local function v589(p67)
					for _, descendant in pairs(p67:GetDescendants()) do
						if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" then
							descendant.Transparency = 1
						end
					end
				end
				local function v592(p68)
					for _, descendant in pairs(p68:GetDescendants()) do
						if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" then
							descendant.Transparency = 0
							descendant.LocalTransparencyModifier = 0
						end
					end

					for _, child in pairs(p68:GetChildren()) do
						if child:IsA("Accessory") then
							local Handle = child:FindFirstChild("Handle")

							if Handle and Handle.Transparency >= 0.99 then
								Handle.Transparency = 0
							end
						end
					end
				end
				local function v598()
					for _, player in pairs(Players:GetPlayers()) do
						if player.Character then
							v592(player.Character)
						end
					end
				end
				local function v601()
					local Character = v583.Character
					local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
					local Humanoid = Character and Character:FindFirstChild("Humanoid")
					local PlayerGui = v583:FindFirstChild("PlayerGui")
					local DebrisBD = v583:FindFirstChild("DebrisBD")
					local Effects = workspace:FindFirstChild("Effects")
					local ImpactFrames = PlayerGui and PlayerGui:FindFirstChild("ImpactFrames")

					if not Character or not HumanoidRootPart or not Humanoid then
						return
					end

					local FieldOfView = workspace.CurrentCamera.FieldOfView
					local v610
					local v611
					local v612
					local v613

					if Effects then
						for _, child in pairs(Effects:GetChildren()) do
							if child:IsA("Model") then
								if child.Name:match("Outline$") then
									v611 = child

									continue
								end
							end

							if child:IsA("Model") then
								if not (child.Name:match("Outline$") or child.Name == "Pick" or child.Name == "RedDot") then
									v610 = child

									continue
								end
							end

							if child.Name == "Pick" then
								v612 = child
							elseif child.Name == "RedDot" then
								v613 = child
							end
						end
					end

					local ProgressBar = ImpactFrames and ImpactFrames:FindFirstChild("ProgressBar")
					local PickModel

					if ImpactFrames then
						for _, child in pairs(ImpactFrames:GetChildren()) do
							if child:IsA("ViewportFrame") and child:FindFirstChild("PickModel") then
								PickModel = child.PickModel

								break
							end
						end
					end

					local DALGONATEMPREMPTE = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("DALGONATEMPREMPTE")
					local u621 = true
					local connection2

					task.spawn(function()
						createFolder(v583, "RecentGameStartedMessage", 0.01)

						if v610 and v610:FindFirstChild("shape") then
							TweenService:Create(v610.shape, TweenInfo.new(2, Enum.EasingStyle.Quad), {
								Position = v610.shape.Position + Vector3.new(0, 0.5, 0)
							}):Play()
						end

						if v610 then
							for _, child in pairs(v610:GetChildren()) do
								if child.Name == "DalgonaClickPart" and child:IsA("BasePart") then
									TweenService:Create(child, TweenInfo.new(2, Enum.EasingStyle.Quad), {
										Transparency = 1
									}):Play()
								end
							end
						end

						if v612 and v612.Parent then
							for _, descendant in pairs(v612:GetDescendants()) do
								if descendant:IsA("BasePart") then
									pcall(function()
										TweenService:Create(descendant, TweenInfo.new(2, Enum.EasingStyle.Quad), {
											Transparency = 1
										}):Play()
									end)
								end
							end
						end

						if v613 and v613.Parent then
							for _, descendant in pairs(v613:GetDescendants()) do
								if descendant:IsA("BasePart") then
									pcall(function()
										TweenService:Create(descendant, TweenInfo.new(2, Enum.EasingStyle.Quad), {
											Transparency = 1
										}):Play()
									end)
								end
							end
						end

						if PickModel then
							for _, descendant in pairs(PickModel:GetDescendants()) do
								if descendant:IsA("BasePart") then
									TweenService:Create(descendant, TweenInfo.new(2, Enum.EasingStyle.Quad), {
										Transparency = 1
									}):Play()
								end
							end
						end

						if HumanoidRootPart then
							TweenService:Create(workspace.CurrentCamera, TweenInfo.new(2, Enum.EasingStyle.Quad), {
								CFrame = HumanoidRootPart.CFrame * CFrame.new(0.0841674805, 8.45438766, 6.69675446, 0.999918401, -0.00898250192, 0.00907994807, 3.31699681e-08, 0.710912943, 0.703280032, -0.0127722733, -0.703222632, 0.710854948)
							}):Play()
						end

						v589(Character)
						DALGONATEMPREMPTE:FireServer({
							Success = true
						})
						task.wait(2)

						for _, v in pairs({
							v610,
							v611,
							v612,
							v613,
							ProgressBar
						}) do
							if v and v.Parent then
								v:Destroy()
							end
						end

						UserInputService_.MouseIconEnabled = true

						if PlayerGui and PlayerGui:FindFirstChild("Hotbar") then
							if PlayerGui.Hotbar:FindFirstChild("Backpack") then
								TweenService:Create(PlayerGui.Hotbar.Backpack, TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
									Position = UDim2.new(0, 0, 0, 0)
								}):Play()
							end
						end

						if ProgressBar then
							if DebrisBD then
								DebrisBD:Fire(ProgressBar, 2)
							end

							TweenService:Create(ProgressBar, TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
								Position = UDim2.new(ProgressBar.Position.X.Scale, 0, ProgressBar.Position.Y.Scale + 1, 0)
							}):Play()
						end

						task.wait(0.5)
						u621 = false

						if PlayerGui then
							local DalgonaUI = PlayerGui:FindFirstChild("DalgonaUI")

							if DalgonaUI then
								DalgonaUI:Destroy()
							end

							local ImpactFrames2 = PlayerGui:FindFirstChild("ImpactFrames")

							if ImpactFrames2 then
								local ViewportFrameLighter = ImpactFrames2:FindFirstChild("ViewportFrameLighter")

								if ViewportFrameLighter and ViewportFrameLighter:FindFirstChild("WorldModel") then
									if ViewportFrameLighter.WorldModel:FindFirstChild("Lighter") then
										ViewportFrameLighter.WorldModel.Lighter:Destroy()
									end
								end
							end
						end

						workspace.CurrentCamera.CameraType = Enum.CameraType.Custom

						if Humanoid then
							workspace.CurrentCamera.CameraSubject = Humanoid
						end

						workspace.CurrentCamera.FieldOfView = FieldOfView or 70
					end)
					connection2 = RunService_.RenderStepped:Connect(function()
						if not u621 then
							connection2:Disconnect()

							return
						end

						if workspace.CurrentCamera.CameraType == Enum.CameraType.Scriptable then
							workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
						end

						if Humanoid and workspace.CurrentCamera.CameraSubject ~= Humanoid then
							workspace.CurrentCamera.CameraSubject = Humanoid
						end
					end)
				end
				local function v636()
					if v583.Character then
						if v583.Character:FindFirstChild("Remotes") then
							local Remotes = v583.Character:FindFirstChild("Remotes")

							pcall(function()
								Remotes.Disabled = true
							end)
							task.wait(0.5)
							pcall(function()
								Remotes.Disabled = false
							end)
						end
					end
				end

				local DALGONATEMPREMPTE = ReplicatedStorage:WaitForChild("Remotes"):FindFirstChild("DALGONATEMPREMPTE")

				if not DALGONATEMPREMPTE then
					return
				end

				DALGONATEMPREMPTE:FireServer({
					Completed = true
				})
				DALGONATEMPREMPTE:FireServer({
					Success = true
				})
				v601()
				v636()
				task.spawn(function()
					repeat
						task.wait(1)
						v598()
					until not ReplicatedStorage:WaitForChild("Remotes"):FindFirstChild("DALGONATEMPREMPTE")

					v63(nil, "Dalgona Completed")
					task.spawn(function()
						local v639 = tick() + 10

						while tick() < v639 do
							local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")

							if PlayerGui then
								local DalgonaUI = PlayerGui:FindFirstChild("DalgonaUI")

								if DalgonaUI then
									DalgonaUI:Destroy()
								end
							end

							task.wait(0.5)
						end
					end)
				end)
			end)

			return
		end

		v63(nil, "Dalgona is not currently running.")
	end
})
t3.DalgonaBox:AddToggle("FreeLighter", {
	Text = " Free Lighter",
	Default = false,
	Callback = function(p69)
		if p69 then
			LocalPlayer:SetAttribute("HasLighter", true)
		else
			LocalPlayer:SetAttribute("HasLighter", nil)
		end
	end
})

do
	local u642 = false
	local thread2

	t3.DalgonaBox:AddToggle("AutoRelax", {
		Text = " Auto Relax",
		Default = false,
		Callback = function(p70)
			u642 = p70

			if u642 and not thread2 then
				thread2 = task.spawn(function()
					local n18 = 0

					while u642 do
						if v60("Dalgona") and getStressLevel() > 0 and tick() - n18 >= 2.1 then
							v65("q")
							n18 = tick()
						end

						task.wait(1)
					end

					thread2 = nil
				end)
			end
		end
	})
end

do
	local u645 = false
	local thread2

	t3.DalgonaBox:AddToggle("DalgonaAutoQTE", {
		Text = " Auto QTE Event (Dalgona)",
		Default = false,
		Callback = function(p71)
			u645 = p71

			if u645 and not thread2 then
				thread2 = task.spawn(function()
					local t33 = {}

					while u645 do
						if v60("Dalgona") then
							local v648 = v68()

							if v648 and v648.ActiveButtons then
								for k, activeButton in pairs(v648.ActiveButtons) do
									if not t33[k] and activeButton then
										t33[k] = true
										task.delay(0.01, function()
											if u645 and v60("Dalgona") then
												if v648.ActiveButtons and v648.ActiveButtons[k] then
													pcall(function()
														v648.Pressed(false, v648.ActiveButtons[k])
													end)
												end
											end
										end)
									end
								end

								for k in pairs(t33) do
									if not v648.ActiveButtons[k] then
										t33[k] = nil
									end
								end
							end
						else
							table.clear(t33)
						end

						task.wait(0.05)
					end

					thread2 = nil
				end)
			end
		end
	})
end

t3.DalgonaBox:AddDivider()
t3.DalgonaBox:AddButton({
	Text = "Auto Complete Ddakji",
	Func = function()
		if not GUID then
			v63(nil, "Pentathlon is not currently running.")

			return
		end

		local CurrentCamera = Workspace.CurrentCamera
		local v653 = CurrentCamera.CFrame.Position + CurrentCamera.CFrame.LookVector * 10
		local ViewportSize = CurrentCamera.ViewportSize
		local v655 = CurrentCamera:ViewportPointToRay(ViewportSize.X * 0.5, ViewportSize.Y * 0.5)
		local raycastParams = RaycastParams.new()

		raycastParams.FilterType = Enum.RaycastFilterType.Include

		local PentathlonMap = Workspace:FindFirstChild("PentathlonMap")

		raycastParams.FilterDescendantsInstances = PentathlonMap and { PentathlonMap } or {}

		local hit = Workspace:Raycast(v655.Origin, v655.Direction * 500, raycastParams)

		if hit and hit.Position then
			v653 = hit.Position
		end

		if v76("Thrown", {
			Power = 1,
			Position = v653
		}) then
			v63("Pentathlon", "Ddakji Completed")
		else
			v63(" Error", "Wait for game to start")
		end
	end
})
t3.DalgonaBox:AddButton({
	Text = "Auto Complete Flying Stone",
	Func = function()
		if not GUID then
			v63(nil, "Pentathlon is not currently running.")

			return
		end

		local Character = LocalPlayer.Character
		local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart then
			local v661

			for _, descendant in ipairs(Workspace:GetDescendants()) do
				if descendant.Name == "Target" and descendant:IsA("BasePart") then
					v661 = descendant

					break
				end
			end

			local v664 = HumanoidRootPart.Position + Vector3.new(0, 1.5, 0)

			if v76("Thrown", {
				Direction = v661 and CFrame.lookAt(HumanoidRootPart.Position, v661.Position, Vector3.new(0, 1, 0)).LookVector or Vector3.new(0, 0, 1),
				ThrowPower = "Perfect",
				Origin = v664
			}) then
				v63("Pentathlon", "Flying Stone Completed")
			else
				v63(" Error", "Wait for game to start")
			end
		end
	end
})
t3.DalgonaBox:AddButton({
	Text = "Auto Gonggi (Spam This)",
	Func = function()
		if GUID then
			task.spawn(function()
				pcall(function()
					v76("Thrown", {})
				end)

				for _, v in ipairs({
					"YTriangle",
					"RCircle",
					"Square",
					"GTriangle",
					"BCircle",
					"BSquare",
					"BTriangle",
					"BStar",
					"BUmbrella",
					"YCircle",
					"YSquare",
					"YStar",
					"YUmbrella",
					"RTriangle",
					"RSquare",
					"RStar",
					"RUmbrella",
					"GCircle",
					"GSquare",
					"GStar",
					"GUmbrella",
					"Triangle",
					"Circle",
					"Star",
					"Umbrella"
				}) do
					pcall(function()
						v76("GotPiece", {
							Name = v
						})
					end)
				end

				pcall(function()
					v76("Catch", {})
				end)
				pcall(function()
					v76("Caught", {})
				end)

				local u667 = false

				pcall(function()
					u667 = v76("TimeSlowFinish", {})
				end)

				if u667 then
					v63("Pentathlon", "Gonggi Part Got Completed")
				else
					v63(" Error", "Check if game started")
				end
			end)

			return
		end

		v63(nil, "Pentathlon is not currently running.")
	end
})
t3.DalgonaBox:AddButton({
	Text = "Auto Complete Spinning Top",
	Func = function()
		if GUID then
			task.spawn(function()
				v76("Tied", {})
				task.wait(0.01)

				if v76("Thrown", {}) then
					v63("Pentathlon", "Spinning Top Completed")
				else
					v63(" Error", "Wait for game to start")
				end
			end)

			return
		end

		v63(nil, "Pentathlon is not currently running.")
	end
})
t3.DalgonaBox:AddButton({
	Text = "Auto Complete Jegi",
	Func = function()
		if GUID then
			task.spawn(function()
				local v668 = false

				for i = 1, 6 do
					v668 = v76("Kick", {
						Lose = false
					})
					task.wait(0.01)
				end

				if v668 then
					v63("Pentathlon", "Jegi Completed")
				else
					v63(" Error", "Wait for game to start")
				end
			end)

			return
		end

		v63(nil, "Pentathlon is not currently running.")
	end
})

local function v670()
	local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")

	if not PlayerGui then
		return 0
	end

	local DalgonaUI = PlayerGui:FindFirstChild("DalgonaUI")

	if not DalgonaUI then
		return 0
	end

	local Breathing = DalgonaUI:FindFirstChild("Breathing")

	if not Breathing or not Breathing.Visible then
		return 0
	end

	local CrackProgressBar = Breathing:FindFirstChild("CrackProgressBar")

	if not CrackProgressBar then
		return 0
	end

	local ChanceShadow = CrackProgressBar:FindFirstChild("ChanceShadow")

	if not ChanceShadow then
		return 0
	end

	local Chance = ChanceShadow:FindFirstChild("Chance")

	if Chance then
		return tonumber(Chance.Text:match("(%d+)")) or 0
	end

	return 0
end

do
	local t34 = {}

	local function v678()
		t34 = {}

		for _, player in pairs(Players:GetPlayers()) do
			if player ~= LocalPlayer then
				table.insert(t34, player.Name)
			end
		end
	end

	v678()

	local u681 = false
	local t35 = {}
	local t36 = {}

	local function v684(p72)
		if not p72 or not p72.Character then
			return
		end

		local Head = p72.Character:FindFirstChild("Head")
		local attribute = p72:GetAttribute("_EquippedPower")

		if not u681 or not Head or not (attribute and attribute ~= "" and attribute ~= "None" and attribute ~= "Yok") then
			if t36[p72] then
				t36[p72]:Destroy()
				t36[p72] = nil
			end
		else
			local text = tostring(attribute)
			local v688 = t36[p72]

			if v688 then
				if v688.Parent ~= Head then
					v688.Parent = Head
				end

				local TextLabel = v688:FindFirstChildOfClass("TextLabel")

				if TextLabel then
					TextLabel.Text = text
				end
			else
				local BillboardGui = Instance.new("BillboardGui")

				BillboardGui.Name = "PowerESP"
				BillboardGui.AlwaysOnTop = false
				BillboardGui.Size = UDim2.new(0, 100, 0, 20)
				BillboardGui.StudsOffset = Vector3.new(0, 1.5, 0)

				local TextLabel = Instance.new("TextLabel")

				TextLabel.BackgroundTransparency = 1
				TextLabel.Size = UDim2.new(1, 0, 1, 0)
				TextLabel.Text = text
				TextLabel.TextColor3 = Color3.new(1, 1, 1)
				TextLabel.Font = Enum.Font.Arcade
				TextLabel.TextSize = 10
				TextLabel.TextStrokeTransparency = 0.5
				TextLabel.Parent = BillboardGui
				BillboardGui.Parent = Head
				t36[p72] = BillboardGui
			end
		end
	end
	local function v692(p73)
		if t35[p73] then
			t35[p73]:Disconnect()
			t35[p73] = nil
		end

		t35[p73] = p73:GetAttributeChangedSignal("_EquippedPower"):Connect(function()
			v684(p73)
		end)
		t35[p73.Name .. "_char"] = p73.CharacterAdded:Connect(function()
			task.wait(1)

			if u681 then
				v684(p73)
			end
		end)
		v684(p73)
	end
	local function v693()
		for _, v in pairs(t35) do
			v:Disconnect()
		end

		table.clear(t35)

		for _, v in pairs(t36) do
			if v then
				v:Destroy()
			end
		end

		table.clear(t36)
	end

	local n19 = 0

	local function v699(p74, p75)
		local Attachment = Instance.new("Attachment")

		Attachment.Parent = p74

		if p75 then
			Attachment.WorldCFrame = CFrame.lookAt(p74.Position, p74.Position + p75)
		end

		local ParticleEmitter = Instance.new("ParticleEmitter")

		ParticleEmitter.Acceleration = Vector3.new(0, 0, 0)
		ParticleEmitter.Brightness = 0
		ParticleEmitter.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
		})
		ParticleEmitter.Drag = 15
		ParticleEmitter.EmissionDirection = Enum.NormalId.Front
		ParticleEmitter.Enabled = false
		ParticleEmitter.FlipbookFramerate = NumberRange.new(1, 1)
		ParticleEmitter.FlipbookLayout = Enum.ParticleFlipbookLayout.None
		ParticleEmitter.FlipbookMode = Enum.ParticleFlipbookMode.Loop
		ParticleEmitter.Lifetime = NumberRange.new(0.075, 0.17)
		ParticleEmitter.LightEmission = -3
		ParticleEmitter.LightInfluence = 0
		ParticleEmitter.LockedToPart = true
		ParticleEmitter.Orientation = Enum.ParticleOrientation.VelocityParallel
		ParticleEmitter.Rate = 75
		ParticleEmitter.RotSpeed = NumberRange.new(0, 0)
		ParticleEmitter.Rotation = NumberRange.new(90, 90)
		ParticleEmitter.Shape = Enum.ParticleEmitterShape.Box
		ParticleEmitter.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
		ParticleEmitter.ShapePartial = 1
		ParticleEmitter.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
		ParticleEmitter.Size = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0, 0),
			NumberSequenceKeypoint.new(0.09322, 3.9975, 0.19326),
			NumberSequenceKeypoint.new(0.191525, 2.34, 0.172813),
			NumberSequenceKeypoint.new(0.29661, 3.75375, 0.164267),
			NumberSequenceKeypoint.new(0.410169, 2.29125, 0.149997),
			NumberSequenceKeypoint.new(0.605085, 4.24125, 0.141698),
			NumberSequenceKeypoint.new(1, 0, 0)
		})
		ParticleEmitter.Speed = NumberRange.new(39, 156)
		ParticleEmitter.SpreadAngle = Vector2.new(0, 0)
		ParticleEmitter.Squash = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 2, 0),
			NumberSequenceKeypoint.new(1, 2, 0)
		})
		ParticleEmitter.Texture = "rbxassetid://15431126240"
		ParticleEmitter.TimeScale = 1
		ParticleEmitter.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0, 0),
			NumberSequenceKeypoint.new(1, 0, 0)
		})
		ParticleEmitter.VelocityInheritance = 0
		ParticleEmitter.ZOffset = 0
		ParticleEmitter.Parent = Attachment

		local ParticleEmitter2 = Instance.new("ParticleEmitter")

		ParticleEmitter2.Acceleration = Vector3.new(0, 0, 0)
		ParticleEmitter2.Brightness = 15
		ParticleEmitter2.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
		})
		ParticleEmitter2.Drag = 10
		ParticleEmitter2.EmissionDirection = Enum.NormalId.Front
		ParticleEmitter2.Enabled = false
		ParticleEmitter2.FlipbookFramerate = NumberRange.new(10, 30)
		ParticleEmitter2.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
		ParticleEmitter2.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
		ParticleEmitter2.Lifetime = NumberRange.new(0.1, 0.15)
		ParticleEmitter2.LightEmission = -3
		ParticleEmitter2.LightInfluence = 0
		ParticleEmitter2.LockedToPart = false
		ParticleEmitter2.Orientation = Enum.ParticleOrientation.VelocityParallel
		ParticleEmitter2.Rate = 20
		ParticleEmitter2.RotSpeed = NumberRange.new(0, 0)
		ParticleEmitter2.Rotation = NumberRange.new(-90, -90)
		ParticleEmitter2.Shape = Enum.ParticleEmitterShape.Box
		ParticleEmitter2.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
		ParticleEmitter2.ShapePartial = 0
		ParticleEmitter2.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
		ParticleEmitter2.Size = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 5.964361, 0),
			NumberSequenceKeypoint.new(0.088764, 7.571077, 0.138019),
			NumberSequenceKeypoint.new(1, 6.3973, 0)
		})
		ParticleEmitter2.Speed = NumberRange.new(13.801883, 207.028244)
		ParticleEmitter2.SpreadAngle = Vector2.new(0, 0)
		ParticleEmitter2.Squash = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0, 0),
			NumberSequenceKeypoint.new(0.107093, 1.125, 0),
			NumberSequenceKeypoint.new(0.404729, 0.8625, 0),
			NumberSequenceKeypoint.new(1, 3, 0)
		})
		ParticleEmitter2.Texture = "rbxassetid://13127698536"
		ParticleEmitter2.TimeScale = 1
		ParticleEmitter2.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0, 0),
			NumberSequenceKeypoint.new(1, 0, 0)
		})
		ParticleEmitter2.VelocityInheritance = 0
		ParticleEmitter2.ZOffset = 0
		ParticleEmitter2.Parent = Attachment

		local ParticleEmitter3 = Instance.new("ParticleEmitter")

		ParticleEmitter3.Acceleration = Vector3.new(0, 0, 0)
		ParticleEmitter3.Brightness = 10
		ParticleEmitter3.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
		})
		ParticleEmitter3.Drag = 44.962558746337891
		ParticleEmitter3.EmissionDirection = Enum.NormalId.Top
		ParticleEmitter3.Enabled = false
		ParticleEmitter3.FlipbookFramerate = NumberRange.new(4.4928, 4.4928)
		ParticleEmitter3.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
		ParticleEmitter3.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
		ParticleEmitter3.Lifetime = NumberRange.new(0.173611, 0.289352)
		ParticleEmitter3.LightEmission = -3
		ParticleEmitter3.LightInfluence = 0
		ParticleEmitter3.LockedToPart = false
		ParticleEmitter3.Orientation = Enum.ParticleOrientation.VelocityParallel
		ParticleEmitter3.Rate = 5
		ParticleEmitter3.RotSpeed = NumberRange.new(0, 0)
		ParticleEmitter3.Rotation = NumberRange.new(-90, -90)
		ParticleEmitter3.Shape = Enum.ParticleEmitterShape.Box
		ParticleEmitter3.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
		ParticleEmitter3.ShapePartial = 1
		ParticleEmitter3.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
		ParticleEmitter3.Size = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0, 0),
			NumberSequenceKeypoint.new(0.156977, 2.330051, 0),
			NumberSequenceKeypoint.new(1, 0, 0)
		})
		ParticleEmitter3.Speed = NumberRange.new(20, 150)
		ParticleEmitter3.SpreadAngle = Vector2.new(360, 360)
		ParticleEmitter3.Squash = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1.5, 0),
			NumberSequenceKeypoint.new(1, 1.5, 0)
		})
		ParticleEmitter3.Texture = "rbxassetid://14005913529"
		ParticleEmitter3.TimeScale = 1
		ParticleEmitter3.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0, 0),
			NumberSequenceKeypoint.new(1, 0, 0)
		})
		ParticleEmitter3.VelocityInheritance = 0
		ParticleEmitter3.ZOffset = 1
		ParticleEmitter3.Parent = Attachment

		local ParticleEmitter4 = Instance.new("ParticleEmitter")

		ParticleEmitter4.Acceleration = Vector3.new(0, 0, 0)
		ParticleEmitter4.Brightness = 50
		ParticleEmitter4.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
		})
		ParticleEmitter4.Drag = 0
		ParticleEmitter4.EmissionDirection = Enum.NormalId.Right
		ParticleEmitter4.Enabled = false
		ParticleEmitter4.FlipbookFramerate = NumberRange.new(43.200001, 43.200001)
		ParticleEmitter4.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
		ParticleEmitter4.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
		ParticleEmitter4.Lifetime = NumberRange.new(0.231481, 0.289352)
		ParticleEmitter4.LightEmission = -3
		ParticleEmitter4.LightInfluence = 0
		ParticleEmitter4.LockedToPart = true
		ParticleEmitter4.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
		ParticleEmitter4.Rate = 5
		ParticleEmitter4.RotSpeed = NumberRange.new(0, 0)
		ParticleEmitter4.Rotation = NumberRange.new(-360, 360)
		ParticleEmitter4.Shape = Enum.ParticleEmitterShape.Box
		ParticleEmitter4.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
		ParticleEmitter4.ShapePartial = 1
		ParticleEmitter4.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
		ParticleEmitter4.Size = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0, 0),
			NumberSequenceKeypoint.new(0.121127, 8.226562, 1.21875),
			NumberSequenceKeypoint.new(0.204225, 9.2625, 0.4875),
			NumberSequenceKeypoint.new(0.329577, 9.079687, 0.670313),
			NumberSequenceKeypoint.new(0.405634, 9.018751, 0.73125),
			NumberSequenceKeypoint.new(0.5, 8.775, 0.975),
			NumberSequenceKeypoint.new(0.61831, 9.199818, 0.550182),
			NumberSequenceKeypoint.new(0.702817, 9.140625, 0.609375),
			NumberSequenceKeypoint.new(0.805634, 9.140625, 0.609375),
			NumberSequenceKeypoint.new(0.9, 8.957812, 0.792188),
			NumberSequenceKeypoint.new(1, 9.75, 0)
		})
		ParticleEmitter4.Speed = NumberRange.new(0.007821, 0.007821)
		ParticleEmitter4.SpreadAngle = Vector2.new(1, 1)
		ParticleEmitter4.Squash = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0, 0),
			NumberSequenceKeypoint.new(1, 0, 0)
		})
		ParticleEmitter4.Texture = "rbxassetid://17888919056"
		ParticleEmitter4.TimeScale = 1
		ParticleEmitter4.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1, 0),
			NumberSequenceKeypoint.new(0.150873, 0.252381, 0),
			NumberSequenceKeypoint.new(0.236908, 0.16875, 0),
			NumberSequenceKeypoint.new(0.332918, 0.152381, 0),
			NumberSequenceKeypoint.new(0.607232, 0.171429, 0),
			NumberSequenceKeypoint.new(0.704489, 0.233333, 0),
			NumberSequenceKeypoint.new(0.798005, 0.166667, 0),
			NumberSequenceKeypoint.new(1, 0, 0)
		})
		ParticleEmitter4.VelocityInheritance = 0
		ParticleEmitter4.ZOffset = 0.60000002384185791
		ParticleEmitter4.Parent = Attachment

		local ParticleEmitter5 = Instance.new("ParticleEmitter")

		ParticleEmitter5.Acceleration = Vector3.new(0, 0, 0)
		ParticleEmitter5.Brightness = 50
		ParticleEmitter5.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
		})
		ParticleEmitter5.Drag = 0
		ParticleEmitter5.EmissionDirection = Enum.NormalId.Front
		ParticleEmitter5.Enabled = false
		ParticleEmitter5.FlipbookFramerate = NumberRange.new(1.05, 1.05)
		ParticleEmitter5.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
		ParticleEmitter5.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
		ParticleEmitter5.Lifetime = NumberRange.new(0.285714, 0.666667)
		ParticleEmitter5.LightEmission = -3
		ParticleEmitter5.LightInfluence = 0.15000000596046448
		ParticleEmitter5.LockedToPart = false
		ParticleEmitter5.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
		ParticleEmitter5.Rate = 5
		ParticleEmitter5.RotSpeed = NumberRange.new(0, 0)
		ParticleEmitter5.Rotation = NumberRange.new(-360, 360)
		ParticleEmitter5.Shape = Enum.ParticleEmitterShape.Box
		ParticleEmitter5.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
		ParticleEmitter5.ShapePartial = 1
		ParticleEmitter5.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
		ParticleEmitter5.Size = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0, 2.410325),
			NumberSequenceKeypoint.new(0.1, 3.77373, 2.410325),
			NumberSequenceKeypoint.new(0.2, 5.592422, 2.410325),
			NumberSequenceKeypoint.new(0.3, 6.880312, 2.410325),
			NumberSequenceKeypoint.new(0.4, 7.878638, 2.410325),
			NumberSequenceKeypoint.new(0.5, 8.683578, 2.410325),
			NumberSequenceKeypoint.new(0.6, 9.34392, 2.410325),
			NumberSequenceKeypoint.new(0.7, 9.886753, 2.410325),
			NumberSequenceKeypoint.new(0.8, 10.325925, 2.410325),
			NumberSequenceKeypoint.new(0.9, 10.661847, 2.410325),
			NumberSequenceKeypoint.new(1, 10.846463, 2.410325)
		})
		ParticleEmitter5.Speed = NumberRange.new(0.01645, 0.01645)
		ParticleEmitter5.SpreadAngle = Vector2.new(20, 20)
		ParticleEmitter5.Squash = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0, 0),
			NumberSequenceKeypoint.new(1, 0, 0)
		})
		ParticleEmitter5.Texture = "http://www.roblox.com/asset/?id=14695179076"
		ParticleEmitter5.TimeScale = 1
		ParticleEmitter5.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0, 0),
			NumberSequenceKeypoint.new(1, 0, 0)
		})
		ParticleEmitter5.VelocityInheritance = 0
		ParticleEmitter5.ZOffset = 0.10000000149011612
		ParticleEmitter5.Parent = Attachment

		local ParticleEmitter6 = Instance.new("ParticleEmitter")

		ParticleEmitter6.Acceleration = Vector3.new(0, 0, 150)
		ParticleEmitter6.Brightness = 100
		ParticleEmitter6.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
		})
		ParticleEmitter6.Drag = 7.5997705459594727
		ParticleEmitter6.EmissionDirection = Enum.NormalId.Top
		ParticleEmitter6.Enabled = false
		ParticleEmitter6.FlipbookFramerate = NumberRange.new(0.870608, 0.870608)
		ParticleEmitter6.FlipbookLayout = Enum.ParticleFlipbookLayout.None
		ParticleEmitter6.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
		ParticleEmitter6.Lifetime = NumberRange.new(0.25, 1.666667)
		ParticleEmitter6.LightEmission = -3
		ParticleEmitter6.LightInfluence = 0
		ParticleEmitter6.LockedToPart = false
		ParticleEmitter6.Orientation = Enum.ParticleOrientation.VelocityParallel
		ParticleEmitter6.Rate = 5
		ParticleEmitter6.RotSpeed = NumberRange.new(0, 0)
		ParticleEmitter6.Rotation = NumberRange.new(90, 90)
		ParticleEmitter6.Shape = Enum.ParticleEmitterShape.Box
		ParticleEmitter6.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
		ParticleEmitter6.ShapePartial = 1
		ParticleEmitter6.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
		ParticleEmitter6.Size = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0, 0),
			NumberSequenceKeypoint.new(0.028523, 0.572566, 0.240108),
			NumberSequenceKeypoint.new(0.041946, 0.166229, 0.110819),
			NumberSequenceKeypoint.new(0.125839, 0, 0),
			NumberSequenceKeypoint.new(0.16443, 0.387867, 0.103414),
			NumberSequenceKeypoint.new(0.193792, 0, 0),
			NumberSequenceKeypoint.new(0.234899, 0.572566, 0.096872),
			NumberSequenceKeypoint.new(0.266779, 0, 0),
			NumberSequenceKeypoint.new(0.318792, 0.683385, 0.088375),
			NumberSequenceKeypoint.new(0.384228, 0.535626, 0.080539),
			NumberSequenceKeypoint.new(0.397651, 0.295518, 0.078783),
			NumberSequenceKeypoint.new(0.463087, 0.092349, 0.073309),
			NumberSequenceKeypoint.new(0.524329, 1.015843, 0.069895),
			NumberSequenceKeypoint.new(0.562081, 0.313988, 0.067676),
			NumberSequenceKeypoint.new(0.640101, 0.461747, 0.058212),
			NumberSequenceKeypoint.new(0.751678, 0.129289, 0.043693),
			NumberSequenceKeypoint.new(0.813758, 0.05541, 0.033779),
			NumberSequenceKeypoint.new(0.856544, 0.350927, 0.026718),
			NumberSequenceKeypoint.new(0.886745, 0.110819, 0.021405),
			NumberSequenceKeypoint.new(1, 0, 0)
		})
		ParticleEmitter6.Speed = NumberRange.new(37.104637, 111.313934)
		ParticleEmitter6.SpreadAngle = Vector2.new(200, 200)
		ParticleEmitter6.Squash = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1, 0),
			NumberSequenceKeypoint.new(1, 1, 0.549618)
		})
		ParticleEmitter6.Texture = "rbxassetid://14045123768"
		ParticleEmitter6.TimeScale = 1
		ParticleEmitter6.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0, 0),
			NumberSequenceKeypoint.new(1, 0, 0)
		})
		ParticleEmitter6.VelocityInheritance = 0
		ParticleEmitter6.ZOffset = 2
		ParticleEmitter6.Parent = Attachment
		ParticleEmitter:Emit(ParticleEmitter.Rate)
		ParticleEmitter2:Emit(ParticleEmitter2.Rate)
		ParticleEmitter3:Emit(ParticleEmitter3.Rate)
		ParticleEmitter4:Emit(ParticleEmitter4.Rate)
		ParticleEmitter5:Emit(ParticleEmitter5.Rate)
		ParticleEmitter6:Emit(ParticleEmitter6.Rate)
		task.delay(1.7, function()
			Attachment:Destroy()
		end)
	end

	local u707
	local clone
	local n20 = 2
	local u710 = false
	local TweenService = game:GetService("TweenService")

	game:GetService("UserInputService")

	local n21 = 1

	task.spawn(function()
		pcall(function()
			if not isfolder("UwUInk") then
				makefolder("UwUInk")
			end

			if not isfile("UwUInk/1.mp3") then
				writefile("UwUInk/1.mp3", game:HttpGet("https://github.com/platinww/UwU/raw/refs/heads/main/UI/1.mp3"))
			end

			if not isfile("UwUInk/2.mp3") then
				writefile("UwUInk/2.mp3", game:HttpGet("https://github.com/platinww/UwU/raw/refs/heads/main/UI/2.mp3"))
			end
		end)
	end)

	local function v713()
		if u707 then
			v63(nil, "Phantom Step is already activated!")

			return
		end

		n20 = 2
		v63(nil, "Phantom Step Activated PC Keybind Q")

		if not u707 then
			u707 = true

			local function v714()
				if n20 > 0 and not u710 then
					local Character = LocalPlayer.Character
					local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

					if HumanoidRootPart then
						local Humanoid = Character:FindFirstChild("Humanoid")

						if Humanoid and Humanoid.Health <= 0 then
							return
						end

						local v718 = false
						local v719, v720, v721 = ipairs(HumanoidRootPart:GetConnectedParts(true))
						local v722 = geniter(v719, v720, v721)

						while true do
							local v723 = table.pack(v722())

							if v723[1] then
								local Model = (v723[3]):FindFirstAncestorOfClass("Model")

								if Model and Model ~= Character then
									if game:GetService("Players"):GetPlayerFromCharacter(Model) then
										v718 = true

										break
									end
								end
							else
								break
							end
						end

						local t37 = {
							["rbxassetid://95966876052605"] = true,
							["rbxassetid://96909201344123"] = true,
							["rbxassetid://103036184572721"] = true,
							["rbxassetid://92750801694745"] = true,
							["rbxassetid://79058658453400"] = true,
							["rbxassetid://71410568064809"] = true,
							["rbxassetid://135421881374988"] = true,
							["rbxassetid://128174895245172"] = true,
							["rbxassetid://90903084043782"] = true,
							["rbxassetid://134977807883018"] = true,
							["rbxassetid://99725739479024"] = true,
							["rbxassetid://86955193235427"] = true,
							["rbxassetid://76720621720056"] = true,
							["rbxassetid://115446895197171"] = true
						}

						if not v718 and Humanoid then
							local Animator = Humanoid:FindFirstChildOfClass("Animator")

							if Animator then
								local v727, v728, v729 = ipairs(Animator:GetPlayingAnimationTracks())

								for _, v in v727, v728, v729 do
									if v.Animation then
										local AnimationId = v.Animation.AnimationId
										local v733 = v.Animation.Name:lower()

										if t37[AnimationId] then
											v718 = true

											break
										elseif AnimationId:lower():match("carry") or v733:match("carry") or v733:match("carried") then
											v718 = true

											break
										end
									end
								end
							end
						end

						if v718 then
							return
						end

						if v60("TugOfWar") then
							return
						end

						n20 -= 1
						u710 = true
						task.delay(0.2, function()
							u710 = false
						end)
						task.delay(1.5, function()
							if n20 < 2 then
								n20 += 1
							end
						end)

						local CFrame_ = HumanoidRootPart.CFrame
						local Humanoid2 = Character:FindFirstChild("Humanoid")
						local MoveDirection

						if Humanoid2 and Humanoid2.MoveDirection.Magnitude > 0.1 then
							MoveDirection = Humanoid2.MoveDirection
						else
							MoveDirection = CFrame_.LookVector
						end

						local n22 = 11
						local raycastParams = RaycastParams.new()
						local filterDescendantsInstances = { Character }
						local v740, v741, v742 = ipairs(game:GetService("Players"):GetPlayers())

						for _, v in v740, v741, v742 do
							if v ~= LocalPlayer and v.Character then
								table.insert(filterDescendantsInstances, v.Character)
							end
						end

						raycastParams.FilterDescendantsInstances = filterDescendantsInstances
						raycastParams.FilterType = Enum.RaycastFilterType.Exclude

						local Position = CFrame_.Position
						local v746 = n22
						local Position2

						for i = 1, 15 do
							local hit = workspace:Raycast(Position, MoveDirection * v746, raycastParams)

							if hit then
								if hit.Instance.CanCollide then
									Position2 = hit.Position

									break
								else
									table.insert(filterDescendantsInstances, hit.Instance)
									raycastParams.FilterDescendantsInstances = filterDescendantsInstances
									v746 -= (hit.Position - Position).Magnitude
									Position = hit.Position + MoveDirection * 0.01

									if not (v746 <= 0) then
										continue
									end
								end
							end

							break
						end

						if Position2 then
							n22 = math.max(0, (Position2 - CFrame_.Position).Magnitude - 1.5)
						end

						local v750 = CFrame_ + MoveDirection * math.max(0, n22)

						v699(HumanoidRootPart, MoveDirection)

						local ScreenGui = Instance.new("ScreenGui")

						ScreenGui.IgnoreGuiInset = true
						pcall(function()
							ScreenGui.Parent = game:GetService("CoreGui")
						end)

						if not ScreenGui.Parent then
							ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
						end

						local ImageLabel = Instance.new("ImageLabel")

						ImageLabel.Size = UDim2.new(1, 0, 1, 0)
						ImageLabel.BackgroundTransparency = 1
						ImageLabel.Image = "rbxassetid://17464258529"
						ImageLabel.ImageColor3 = Color3.new(0, 0, 0)
						ImageLabel.ImageTransparency = 1
						ImageLabel.Parent = ScreenGui
						TweenService:Create(ImageLabel, TweenInfo.new(0.05, Enum.EasingStyle.Sine), {
							ImageTransparency = 0.2
						}):Play()

						local CurrentCamera = workspace.CurrentCamera

						TweenService:Create(CurrentCamera, TweenInfo.new(0.05, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							FieldOfView = 85
						}):Play()

						local Sound = Instance.new("Sound")

						if n20 == 0 then
							if n21 == 2 then
								Sound.SoundId = getcustomasset("UwUInk/1.mp3")
								n21 = 1
							else
								Sound.SoundId = getcustomasset("UwUInk/2.mp3")
								n21 = 2
							end
						elseif math.random(1, 100) <= 30 then
							Sound.SoundId = getcustomasset("UwUInk/2.mp3")
							n21 = 2
						else
							Sound.SoundId = getcustomasset("UwUInk/1.mp3")
							n21 = 1
						end

						Sound.Volume = 2
						Sound.Parent = game:GetService("SoundService")
						Sound:Play()
						Sound.Ended:Connect(function()
							Sound:Destroy()
						end)
						TweenService:Create(HumanoidRootPart, TweenInfo.new(0.12, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							CFrame = v750
						}):Play()
						task.delay(0.12, function()
							v699(HumanoidRootPart, MoveDirection)

							local tween = TweenService:Create(ImageLabel, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
								ImageTransparency = 1
							})

							tween:Play()
							tween.Completed:Connect(function()
								ScreenGui:Destroy()
							end)
							TweenService:Create(CurrentCamera, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
								FieldOfView = 70
							}):Play()
						end)
					end
				end
			end

			game:GetService("ContextActionService"):BindActionAtPriority("CustomPhantomStep_Q", function(p76, p77)
				if p77 == Enum.UserInputState.Begin then
					v714()
				end

				return Enum.ContextActionResult.Sink
			end, false, Enum.ContextActionPriority.High.Value + 100, Enum.KeyCode.Q)

			local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")

			if PlayerGui then
				local MobileSupport = PlayerGui:FindFirstChild("MobileSupport")

				if MobileSupport then
					local CustomPhantomBtn = MobileSupport:FindFirstChild("CustomPhantomBtn")

					if CustomPhantomBtn then
						CustomPhantomBtn:Destroy()
					end

					local RollButton = MobileSupport:FindFirstChild("RollButton")

					if RollButton then
						if game:GetService("UserInputService").TouchEnabled then
							clone = RollButton:Clone()
							clone.Name = "CustomPhantomBtn"
							clone.Visible = true
							clone.Parent = MobileSupport
							clone.InputBegan:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
									local ImageLabelBaseHOLDING = clone:FindFirstChild("ImageLabelBaseHOLDING")

									if ImageLabelBaseHOLDING then
										ImageLabelBaseHOLDING.Visible = true
									end

									v714()
								end
							end)
							clone.InputEnded:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
									local ImageLabelBaseHOLDING = clone:FindFirstChild("ImageLabelBaseHOLDING")

									if ImageLabelBaseHOLDING then
										ImageLabelBaseHOLDING.Visible = false
									end
								end
							end)
							RollButton.Visible = false
						end
					end
				end
			end
		end
	end

	t3.UtilitiesBox:AddButton({
		Text = " Free Phantom Step",
		Func = function()
			if v713 then
				v713()
			end
		end
	})

	local TPPlayerDropdown = t3.UtilitiesBox:AddDropdown("TPPlayerDropdown", {
		Values = t34,
		Default = 1,
		Multi = false,
		Text = "Select Player"
	})

	t3.UtilitiesBox:AddButton({
		Text = "Teleport to Player",
		Func = function()
			v678()
			TPPlayerDropdown:SetValues(t34)

			local Value2 = TPPlayerDropdown.Value

			if not Value2 or Value2 == "" then
				v63(" Error", "Select a player first")

				return
			end

			local v764 = Players:FindFirstChild(Value2)

			if v764 and v764.Character then
				if not v764.Character:FindFirstChild("HumanoidRootPart") then
					v63(" Error", "Player not found or has no character")

					return
				end

				v78(v764.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
				v63(" Teleported", "Teleported to " .. Value2)
			else
				v63(" Error", "Player not found or has no character")
			end
		end
	})
	t3.UtilitiesBox:AddButton({
		Text = "Teleport 100 Stud Up",
		Func = function()
			if tick() - n19 < 10 then
				v63(nil, "Please wait before teleporting again (" .. math.ceil(10 - (tick() - n19)) .. "s)")

				return
			end

			local Character = LocalPlayer.Character

			if Character and Character:FindFirstChild("HumanoidRootPart") then
				Character.HumanoidRootPart.CFrame *= CFrame.new(0, 100, 0)
				n19 = tick()
				v63(nil, "Successfully Teleported 100 Stud Up")
			end
		end
	})
	t3.UtilitiesBox:AddButton({
		Text = "Teleport 50 Stud Down",
		Func = function()
			if tick() - n19 < 10 then
				v63(nil, "Please wait before teleporting again (" .. math.ceil(10 - (tick() - n19)) .. "s)")

				return
			end

			local Character = LocalPlayer.Character

			if Character and Character:FindFirstChild("HumanoidRootPart") then
				Character.HumanoidRootPart.CFrame *= CFrame.new(0, -50, 0)
				n19 = tick()
				v63(nil, "Successfully Teleported 50 Stud Down")
			end
		end
	})

	local u767 = false
	local n23 = 20

	t3.UtilitiesBox:AddSlider("SpeedSlider", {
		Text = "Speed Amount",
		Default = 20,
		Min = 16,
		Max = 65,
		Rounding = 0,
		Compact = false,
		Callback = function(p78)
			n23 = p78
		end
	})
	t3.UtilitiesBox:AddToggle("EnableSpeed", {
		Text = " Enable Speed",
		Default = false,
		Callback = function(p79)
			u767 = p79
		end
	})
	game:GetService("RunService").RenderStepped:Connect(function()
		if u767 then
			local Character = LocalPlayer.Character

			if Character and Character:FindFirstChild("Humanoid") and Character:FindFirstChild("HumanoidRootPart") then
				local Humanoid = Character.Humanoid
				local HumanoidRootPart = Character.HumanoidRootPart

				if Humanoid.Health > 0 and Humanoid.MoveDirection.Magnitude > 0 then
					local v772 = Humanoid.MoveDirection * n23

					HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(v772.X, HumanoidRootPart.AssemblyLinearVelocity.Y, v772.Z)
				end
			end
		end
	end)

	local u773 = false
	local thread2

	t3.GameToolsBox:AddToggle("AllGamesAutoQTE", {
		Text = " Auto QTE Event (All Games)",
		Default = false,
		Callback = function(p80)
			u773 = p80

			if not u773 or thread2 then
				if not u773 then
					thread2 = nil
				end
			else
				thread2 = task.spawn(function()
					local t38 = {}

					while u773 do
						local v776 = v68()

						if v776 and v776.ActiveButtons then
							for k, activeButton in pairs(v776.ActiveButtons) do
								if not t38[k] and activeButton then
									t38[k] = true
									task.delay(0.05, function()
										if u773 then
											if v776.ActiveButtons then
												if v776.ActiveButtons[k] then
													pcall(function()
														v776.Pressed(false, v776.ActiveButtons[k])
													end)
												end
											end
										end
									end)
								end
							end

							for k in pairs(t38) do
								if not v776.ActiveButtons[k] then
									t38[k] = nil
								end
							end
						else
							table.clear(t38)
						end

						task.wait(0.5)
					end

					thread2 = nil
				end)
			end
		end
	})
	t3.GameToolsBox:AddToggle("ESPPowers", {
		Text = " ESP Powers",
		Default = false,
		Callback = function(p81)
			u681 = p81

			if p81 then
				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= LocalPlayer then
						v692(player)
					end
				end

				t35._PlayerAdded = Players.PlayerAdded:Connect(function(player)
					if u681 then
						v692(player)
					end
				end)
			else
				v693()
			end
		end
	})
end

do
	local u782 = false
	local t39 = {}
	local t40 = {}

	local function v785(p82)
		if not p82 or not p82.Parent then
			return
		end

		if t40[p82] then
			return
		end

		local Highlight = Instance.new("Highlight")

		Highlight.Name = "PeabertHighlight"
		Highlight.FillColor = Color3.fromRGB(0, 255, 0)
		Highlight.FillTransparency = 0.5
		Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.Parent = p82
		t40[p82] = Highlight
	end
	local function v787(p83)
		if t40[p83] then
			t40[p83]:Destroy()
			t40[p83] = nil
		end
	end
	local function v788(p84)
		return p84:IsA("Model") and string.find(p84.Name, "FREEPEABERT")
	end
	local function v789(descendant)
		if v788(descendant) then
			t39[descendant] = true

			if u782 then
				v785(descendant)
			end
		end
	end

	for _, descendant in pairs(workspace:GetDescendants()) do
		v789(descendant)
	end

	workspace.DescendantAdded:Connect(v789)
	workspace.DescendantRemoving:Connect(function(descendant)
		if t39[descendant] then
			t39[descendant] = nil
			v787(descendant)
		end
	end)
	t3.GameToolsBox:AddToggle("PeabertsESP", {
		Text = " Peaberts ESP",
		Default = false,
		Callback = function(p85)
			u782 = p85

			if u782 then
				for k in pairs(t39) do
					if k and k.Parent then
						v785(k)
					end
				end
			else
				for k in pairs(t39) do
					v787(k)
				end
			end
		end
	})

	local n24 = 0

	t3.GameToolsBox:AddButton({
		Text = "TP To Peabert",
		Func = function()
			if tick() - n24 < 10 then
				v63(" Cooldown", string.format("Wait %.1fs", 10 - (tick() - n24)))

				return
			end

			local Character = LocalPlayer.Character
			local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

			if not HumanoidRootPart then
				return
			end

			local v797
			local huge = math.huge

			for k in pairs(t39) do
				if k and k.Parent then
					local BasePart = k:FindFirstChildWhichIsA("BasePart", true)

					if BasePart then
						local Magnitude = (HumanoidRootPart.Position - BasePart.Position).Magnitude

						if Magnitude < huge then
							huge = Magnitude
							v797 = BasePart
						end
					end
				end
			end

			if v797 then
				v78(v797.CFrame * CFrame.new(0, 0, 3))
				n24 = tick()
				v63(" Teleported", "Teleported to Peabert!")
			else
				v63(" Error", "No Peaberts found on map!")
			end
		end
	})
end

do
	local connection2
	local u803 = false

	t3.GameToolsBox:AddToggle("InfiniteJump", {
		Text = " Infinite Jump",
		Default = false,
		Callback = function(p86)
			if p86 then
				if connection2 then
					return
				end

				connection2 = UserInputService.JumpRequest:Connect(function()
					if not u803 then
						u803 = true

						local Character = LocalPlayer.Character

						if Character then
							local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
							local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

							if Humanoid then
								if HumanoidRootPart then
									Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

									local JumpPower = Humanoid.JumpPower

									if JumpPower <= 0 then
										JumpPower = 50
									end

									HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(HumanoidRootPart.AssemblyLinearVelocity.X, JumpPower, HumanoidRootPart.AssemblyLinearVelocity.Z)
								end
							end
						end

						task.wait(0.1)
						u803 = false
					end
				end)
			elseif connection2 then
				connection2:Disconnect()
				connection2 = nil
			end
		end
	})
end

local function v808(p87, p88, p89)
	local connection2

	t3.VisualGamepassBox:AddToggle(p87, {
		Text = p88,
		Default = false,
		Callback = function(p90)
			if p90 then
				LocalPlayer:SetAttribute(p89, true)
				connection2 = LocalPlayer:GetAttributeChangedSignal(p89):Connect(function()
					if not LocalPlayer:GetAttribute(p89) then
						LocalPlayer:SetAttribute(p89, true)
					end
				end)
			else
				if connection2 then
					connection2:Disconnect()
				end

				LocalPlayer:SetAttribute(p89, nil)
			end
		end
	})
end

v808("VisualVIP", " Unlock VIP", "__OwnsVIPGamepass")
v808("VisualLighter", " Unlock Lighter", "HasLighter")
v808("Visual2X", " Unlock 2X Count", "__Owns2XVoteGamepass")
v808("VisualGuard", " Unlock Guard Perm", "__OwnsPermGuard")
v808("VisualGlass", " Unlock Glass Vision", "__OwnsGlassManufacturerVision")
v808("VisualPSPlus", " Unlock PS Plus", "__OwnsPSPlus")
v808("VisualEmotes", " Unlock Emote Pages", "__OwnsEmotePages")
_G.UniformColorValue = Color3.fromRGB(255, 255, 255)
t3.VisualClientBox:AddToggle("SetUniformSkinToggle", {
	Text = "Set Uniform Skin",
	Default = false,
	Callback = function(p91)
		_G.SetUniformSkinEnabled = p91
		LocalPlayer:SetAttribute("ClothingColorToggle", p91)

		if p91 and _G.UniformColorValue then
			LocalPlayer:SetAttribute("ClothingColor", _G.UniformColorValue)
		end
	end
}):AddColorPicker("UniformColorPicker", {
	Default = Color3.fromRGB(255, 255, 255),
	Title = "Uniform Skin Color"
})
lib.Options.UniformColorPicker:OnChanged(function()
	_G.UniformColorValue = lib.Options.UniformColorPicker.Value

	if _G.SetUniformSkinEnabled then
		LocalPlayer:SetAttribute("ClothingColor", _G.UniformColorValue)
	end
end)
_G.CustomPlayerNumber = 456
_G.CustomPlayerNumberEnabled = false
t3.VisualClientBox:AddInput("CustomPlayerTagInput", {
	Default = "456",
	Numeric = true,
	Finished = false,
	Text = "Custom Player Number",
	Tooltip = "Change your overhead/chat number (e.g. 456)",
	Callback = function(p92)
		_G.CustomPlayerNumber = tonumber(p92) or 456
	end
})
t3.VisualClientBox:AddToggle("EnableCustomPlayerTag", {
	Text = "Enable Custom Tag",
	Default = false,
	Callback = function(p93)
		_G.CustomPlayerNumberEnabled = p93

		if p93 then
			task.spawn(function()
				while _G.CustomPlayerNumberEnabled do
					local PlayerTagValue = LocalPlayer:FindFirstChild("PlayerTagValue")
					local CustomPlayerNumber = _G.CustomPlayerNumber or 456
					local text = tostring(CustomPlayerNumber)

					if string.len(text) < 3 then
						text = string.rep("0", 3 - string.len(text)) .. text
					end

					if PlayerTagValue and PlayerTagValue.Value ~= CustomPlayerNumber then
						PlayerTagValue.Value = CustomPlayerNumber
					end

					local Character = LocalPlayer.Character

					if Character then
						for _, descendant in ipairs(Character:GetDescendants()) do
							if descendant:IsA("TextLabel") then
								if descendant.Parent:IsA("SurfaceGui") then
									descendant.Text = text
								end
							end
						end
					end

					task.wait(0.5)
				end
			end)
		end
	end
})
_G.CustomWinsValue = 100
_G.CustomWinsEnabled = false
t3.VisualClientBox:AddInput("CustomWinsInput", {
	Default = "100",
	Numeric = true,
	Finished = false,
	Text = "Custom Wins",
	Tooltip = "Change your visual total wins",
	Callback = function(p94)
		_G.CustomWinsValue = tonumber(p94) or 100
	end
})
t3.VisualClientBox:AddToggle("EnableCustomWins", {
	Text = "Enable Custom Wins",
	Default = false,
	Callback = function(p95)
		_G.CustomWinsEnabled = p95

		if p95 then
			task.spawn(function()
				while _G.CustomWinsEnabled do
					if LocalPlayer:GetAttribute("_GameWins") ~= _G.CustomWinsValue then
						LocalPlayer:SetAttribute("_GameWins", _G.CustomWinsValue)
					end

					task.wait(0.5)
				end
			end)
		end
	end
})
_G.CustomWinStreakValue = 10
_G.CustomWinStreakEnabled = false
t3.VisualClientBox:AddInput("CustomWinStreakInput", {
	Default = "10",
	Numeric = true,
	Finished = false,
	Text = "Custom Win Streak",
	Tooltip = "Change your visual win streak",
	Callback = function(p96)
		_G.CustomWinStreakValue = tonumber(p96) or 10
	end
})
t3.VisualClientBox:AddToggle("EnableCustomWinStreak", {
	Text = "Enable Custom Win Streak",
	Default = false,
	Callback = function(p97)
		_G.CustomWinStreakEnabled = p97

		if p97 then
			task.spawn(function()
				while _G.CustomWinStreakEnabled do
					if LocalPlayer:GetAttribute("_ConsecutiveWins") ~= _G.CustomWinStreakValue then
						LocalPlayer:SetAttribute("_ConsecutiveWins", _G.CustomWinStreakValue)
					end

					task.wait(0.5)
				end
			end)
		end
	end
})

do
	local t41 = { "Loading..." }
	local EmotePlayerList = t3.EmoteBox:AddDropdown("EmotePlayerList", {
		Values = t41,
		Default = 1,
		Multi = false,
		Text = "Emote List"
	})
	local u818 = false
	local u819

	t3.EmoteBox:AddButton({
		Text = "Play / Stop Emote",
		Func = function()
			local Character = LocalPlayer.Character
			local Humanoid = Character and Character:FindFirstChild("Humanoid")

			if not Humanoid then
				return
			end

			if u818 then
				u818 = false
				Humanoid.Jump = true

				if u819 then
					u819:Stop()
					u819 = nil
				end
			else
				local Value2 = lib.Options.EmotePlayerList.Value

				if Value2 and Value2 ~= "Loading..." then
					u818 = true
					pcall(function()
						game:GetService("ReplicatedStorage").Replication.Event:FireServer({
							event = "playEmote",
							emoteName = Value2
						})
					end)
					pcall(function()
						local Animations = game:GetService("ReplicatedStorage"):FindFirstChild("Animations")
						local v824

						if Animations then
							for _, descendant in pairs(Animations:GetDescendants()) do
								if descendant:IsA("Animation") and descendant.Name == Value2 then
									v824 = descendant

									break
								end
							end
						end

						if v824 then
							u819 = (Humanoid:FindFirstChild("Animator") or Humanoid):LoadAnimation(v824)
							u819:Play()
						end
					end)
				end
			end
		end
	})
	task.spawn(function()
		local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
		local t42 = {}

		pcall(function()
			local Animations = ReplicatedStorage2:FindFirstChild("Animations")

			if Animations then
				for _, descendant in pairs(Animations:GetDescendants()) do
					if descendant:IsA("Animation") and not table.find(t42, descendant.Name) then
						table.insert(t42, descendant.Name)
					end
				end
			end
		end)
		pcall(function()
			local data = game:GetService("HttpService"):JSONDecode(LocalPlayer:GetAttribute("_EmoteInventory"))

			if data then
				for k, v in pairs(data) do
					local v835 = type(v) == "string" and v or type(k) == "string" and k or tostring(v)

					if not table.find(t42, v835) then
						table.insert(t42, v835)
					end
				end
			end
		end)

		if #t42 == 0 then
			t42 = {
				"Floss",
				"DefaultDance",
				"TakeTheL",
				"CrabRave",
				"Distraction",
				"CoffinDance",
				"RickRoll"
			}
		end

		table.sort(t42, function(p98, p99)
			return tostring(p98) < tostring(p99)
		end)
		t41 = t42
		EmotePlayerList:SetValues(t41)
		EmotePlayerList:SetValue(t41[1])

		while task.wait(0.5) do
			if u818 then
				local Character = LocalPlayer.Character

				if Character then
					local Humanoid = Character:FindFirstChild("Humanoid")

					if Humanoid and Humanoid.MoveDirection.Magnitude > 0 then
						u818 = false

						if u819 then
							u819:Stop()
							u819 = nil
						end
					end
				end
			end
		end
	end)
end

local u838 = false

t3.GameToolsBox:AddToggle("FPSBooster", {
	Text = " FPS Booster / Anti-Lag",
	Default = false,
	Callback = function(p100)
		u838 = p100

		local Lighting = game:GetService("Lighting")
		local Terrain = workspace:FindFirstChildOfClass("Terrain")

		if u838 then
			if Terrain then
				Terrain.WaterWaveSize = 0
				Terrain.WaterWaveSpeed = 0
				Terrain.WaterReflectance = 0
				Terrain.WaterTransparency = 0
			end

			Lighting.GlobalShadows = false
			Lighting.FogEnd = 9e9
			Lighting.Brightness = 1
			settings().Rendering.QualityLevel = "Level01"

			for _, descendant in pairs(workspace:GetDescendants()) do
				if descendant:IsA("Part") or descendant:IsA("Union") or descendant:IsA("CornerWedgePart") or descendant:IsA("TrussPart") then
					descendant.Material = "Plastic"
					descendant.Reflectance = 0
				else
					if not descendant:IsA("Decal") then
						if not descendant:IsA("Texture") or descendant.Name == "TOWDecal" then
							if descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") then
								descendant.Lifetime = NumberRange.new(0)
							elseif descendant:IsA("Explosion") then
								descendant.BlastPressure = 1
								descendant.BlastRadius = 1
							end

							continue
						end
					end

					descendant.Transparency = 1
				end
			end
		else
			if Terrain then
				Terrain.WaterWaveSize = 0.15
				Terrain.WaterWaveSpeed = 10
				Terrain.WaterReflectance = 1
				Terrain.WaterTransparency = 1
			end

			Lighting.GlobalShadows = true
			settings().Rendering.QualityLevel = "Automatic"
		end
	end
})

local u843 = false

t3.AutoVoteBox:AddDropdown("Vote1Preference", {
	Values = {
		"None",
		"Dalgona",
		"Pentathlon"
	},
	Default = 1,
	Multi = false,
	Text = "Vote 1: Dalgona/Pentathlon"
})
t3.AutoVoteBox:AddDropdown("Vote2Preference", {
	Values = {
		"None",
		"Hide And Seek",
		"Tug Of War"
	},
	Default = 1,
	Multi = false,
	Text = "Vote 2: Hide/Tug"
})
t3.AutoVoteBox:AddDropdown("Vote3Preference", {
	Values = {
		"None",
		"Jump Rope",
		"Glass Bridge"
	},
	Default = 1,
	Multi = false,
	Text = "Vote 3: Jump/Glass"
})
t3.AutoVoteBox:AddDropdown("Vote4Preference", {
	Values = {
		"None",
		"Continue",
		"Rebel"
	},
	Default = 1,
	Multi = false,
	Text = "Vote 4: Rebel/Continue"
})
t3.AutoVoteBox:AddToggle("EnableAutoVote", {
	Text = "Enable Auto Vote",
	Default = false,
	Callback = function(p101)
		u843 = p101

		if p101 then
			task.spawn(function()
				while u843 do
					local ReplicatedStorage2 = game:GetService("ReplicatedStorage")

					if ReplicatedStorage2:FindFirstChild("Remotes") then
						if ReplicatedStorage2.Remotes:FindFirstChild("ExtraTemporaryRemote") then
							local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 2)

							if PlayerGui then
								local VotingToPickGames = PlayerGui:FindFirstChild("VotingToPickGames", true)
								local VotingToEndGames = PlayerGui:FindFirstChild("VotingToEndGames", true)

								if VotingToPickGames then
									if VotingToPickGames:FindFirstChild("VotingBoardLeft") and VotingToPickGames:FindFirstChild("VotingBoardRight") then
										if VotingToPickGames.VotingBoardLeft.Visible then
											local attribute = VotingToPickGames:GetAttribute("NewString")

											if attribute == "PentathlonOrDalgonaVote" then
												local Value2 = lib.Options.Vote1Preference.Value

												if Value2 == "Dalgona" then
													ReplicatedStorage2.Remotes.ExtraTemporaryRemote:FireServer({
														Voting = "KeepPlaying"
													})
												elseif Value2 == "Pentathlon" then
													ReplicatedStorage2.Remotes.ExtraTemporaryRemote:FireServer({
														Voting = "StopPlaying"
													})
												end
											elseif attribute == "HideAndSeekOrTugOfWarVote" then
												local Value2 = lib.Options.Vote2Preference.Value

												if Value2 == "Tug Of War" then
													ReplicatedStorage2.Remotes.ExtraTemporaryRemote:FireServer({
														Voting = "KeepPlaying"
													})
												elseif Value2 == "Hide And Seek" then
													ReplicatedStorage2.Remotes.ExtraTemporaryRemote:FireServer({
														Voting = "StopPlaying"
													})
												end
											elseif attribute == "GlassBridgeOrJumpRopeVote" then
												local Value2 = lib.Options.Vote3Preference.Value

												if Value2 == "Glass Bridge" then
													ReplicatedStorage2.Remotes.ExtraTemporaryRemote:FireServer({
														Voting = "KeepPlaying"
													})
												elseif Value2 == "Jump Rope" then
													ReplicatedStorage2.Remotes.ExtraTemporaryRemote:FireServer({
														Voting = "StopPlaying"
													})
												end
											end

											if VotingToPickGames:FindFirstChild("VotingBoardLeft") then
												VotingToPickGames.VotingBoardLeft.Visible = false
											end

											if VotingToPickGames:FindFirstChild("VotingBoardRight") then
												VotingToPickGames.VotingBoardRight.Visible = false
											end
										end
									end
								end

								if VotingToEndGames then
									if VotingToEndGames:FindFirstChild("VotingBoard") and VotingToEndGames.VotingBoard.Visible then
										local Value2 = lib.Options.Vote4Preference.Value

										if Value2 == "Continue" then
											ReplicatedStorage2.Remotes.ExtraTemporaryRemote:FireServer({
												Voting = "KeepPlaying"
											})
										elseif Value2 == "Rebel" then
											ReplicatedStorage2.Remotes.ExtraTemporaryRemote:FireServer({
												Voting = "StopPlaying"
											})
										end

										if VotingToEndGames:FindFirstChild("VotingBoard") then
											VotingToEndGames.VotingBoard.Visible = false
										end
									end
								end
							end
						end
					end

					task.wait(1)
				end
			end)
		end
	end
})

do
	local u853 = false
	local u854

	local function v855()
		local Character = LocalPlayer.Character

		if Character and Character:FindFirstChild("Bandage") then
			return true
		end

		local Backpack = LocalPlayer:FindFirstChild("Backpack")

		if Backpack and Backpack:FindFirstChild("Bandage") then
			return true
		end

		return false
	end
	local function v858()
		local function v859(p102)
			for _, child in ipairs(p102:GetChildren()) do
				if child.Name == "DroppedBandage" then
					local PrimaryPart = child:IsA("Model") and (child.PrimaryPart or child:FindFirstChildWhichIsA("BasePart", true)) or child:IsA("BasePart") and child

					if PrimaryPart then
						return child, PrimaryPart
					end
				end
			end

			return nil, nil
		end

		local v863, v864 = v859(workspace)

		if v863 then
			return v863, v864
		end

		local Effects = workspace:FindFirstChild("Effects")

		if Effects then
			local v866, v867 = v859(Effects)

			if v866 then
				return v866, v867
			end
		end

		local Live = workspace:FindFirstChild("Live")

		if Live then
			local v869, v870 = v859(Live)

			if v869 then
				return v869, v870
			end
		end

		return nil, nil
	end
	local function v871()
		if v60("RedLightGreenLight") then
			local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")

			if PlayerGui then
				local ImpactFrames = PlayerGui:FindFirstChild("ImpactFrames")

				if ImpactFrames then
					local TrafficLightEmpty = ImpactFrames:FindFirstChild("TrafficLightEmpty")

					if TrafficLightEmpty and TrafficLightEmpty.Image == "rbxassetid://88400194373338" then
						return true
					end
				end
			end
		end

		return false
	end

	t3.UtilitiesBox:AddToggle("AutoStealBandage", {
		Text = " Auto Steal Bandages",
		Default = false,
		Callback = function(p103)
			u853 = p103

			if u853 then
				if u854 then
					return
				end

				u854 = true
				task.spawn(function()
					while u853 do
						if not u854 then
							break
						end

						if not (v855() or v871()) then
							local v875, v876 = v858()

							if v875 and v876 then
								local Character = LocalPlayer.Character
								local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

								if HumanoidRootPart then
									local CFrame_ = HumanoidRootPart.CFrame
									local CFrame_2 = v876.CFrame

									HumanoidRootPart.CFrame = CFrame_2

									local n25 = 0

									while u853 do
										if not v855() and v875.Parent and n25 < 10 then
											if not v871() then
												HumanoidRootPart.CFrame = CFrame_2

												if typeof(firetouchinterest) == "function" then
													pcall(function()
														firetouchinterest(HumanoidRootPart, v876, 0)
														task.wait(0.05)
														firetouchinterest(HumanoidRootPart, v876, 1)
													end)
												end

												task.wait(0.1)
												n25 += 1

												continue
											end
										end

										break
									end

									if Character then
										if Character:FindFirstChild("HumanoidRootPart") then
											Character.HumanoidRootPart.CFrame = CFrame_
										end
									end

									task.wait(0.5)
								end
							end
						end

						task.wait(0.5)
					end

					u854 = nil
				end)
			end
		end
	})
end

do
	local t43 = {
		"Left Hip",
		"Left Shoulder",
		"Neck",
		"Right Hip",
		"Right Shoulder"
	}
	local t44 = {
		"Ragdoll",
		"Stun",
		"RotateDisabled",
		"RagdollWakeupImmunity",
		"RagdollWakeupImmunityLess",
		"StopLoopTpFix",
		"TrueStun",
		"Waiting",
		"waitbeforecheckingforground"
	}
	local t45 = {
		"Ragdoll",
		"TrueStun",
		"Stun",
		"RotateDisabled",
		"Waiting"
	}

	local function v885(p104)
		for _, v in ipairs(t44) do
			local v888 = p104:FindFirstChild(v)

			if v888 then
				v888.Parent = nil
			end
		end
	end
	local function v889(p105)
		local Torso = p105:FindFirstChild("Torso")

		if not Torso then
			return
		end

		for _, child in ipairs(Torso:GetChildren()) do
			if child:IsA("BallSocketConstraint") then
				if child.Name:match("^SocketConstraint") then
					child.Enabled = false
					child.Parent = nil
				end
			end
		end

		for _, v in ipairs(t43) do
			local v895 = Torso:FindFirstChild(v)

			if v895 and v895:IsA("Motor6D") and not v895.Part0 then
				v895.Part0 = Torso
			end
		end
	end
	local function v896(p106)
		local HumanoidRootPart = p106:FindFirstChild("HumanoidRootPart")

		if not HumanoidRootPart then
			return
		end

		for _, child in ipairs(HumanoidRootPart:GetChildren()) do
			if not child.Name:match("^CacheAttachment") then
				if not child.Name:match("^SocketConstraint") then
					continue
				end
			end

			child.Parent = nil
		end

		for _, child in ipairs(HumanoidRootPart:GetChildren()) do
			if child:IsA("BodyVelocity") or child:IsA("BodyForce") or child:IsA("BodyPosition") then
				child.Parent = nil
			end
		end
	end
	local function v902(p107)
		local Humanoid = p107:FindFirstChildOfClass("Humanoid")

		if not Humanoid then
			return
		end

		local HumanoidRootPart = p107:FindFirstChild("HumanoidRootPart")

		v885(p107)
		Humanoid.PlatformStand = false
		Humanoid.AutoRotate = true
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
		Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

		if HumanoidRootPart then
			HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, HumanoidRootPart.AssemblyLinearVelocity.Y, 0)
		end

		v889(p107)
		v896(p107)
		Humanoid.WalkSpeed = 14
		Humanoid.JumpPower = 50

		if shared then
			shared.WalkSpeedChangeTick = nil
		end

		task.delay(0.1, function()
			if Humanoid then
				if Humanoid.Parent and Humanoid.Health > 0 then
					Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
				end
			end
		end)
	end

	local u905 = false
	local t46 = {}

	local function v907()
		for _, v in ipairs(t46) do
			if v then
				v:Disconnect()
			end
		end

		table.clear(t46)
	end
	local function v910(p108)
		if not u905 then
			return
		end

		v907()

		local Humanoid = p108:FindFirstChildOfClass("Humanoid")

		if not Humanoid then
			return
		end

		local HumanoidRootPart = p108:FindFirstChild("HumanoidRootPart")

		if not HumanoidRootPart then
			return
		end

		local u913 = false
		local connection2 = p108.ChildAdded:Connect(function(child)
			if u913 or not u905 then
				return
			end

			if typeof(child) == "Instance" then
				local Name = child.Name

				for _, v in ipairs(t45) do
					if Name == v then
						task.spawn(function()
							v902(p108)
						end)

						break
					end
				end
			end
		end)

		table.insert(t46, connection2)

		local connection3 = RunService.Heartbeat:Connect(function()
			if not u905 then
				v907()

				return
			end

			if not p108 or not p108.Parent then
				v907()

				return
			end

			if not Humanoid or not Humanoid.Parent or Humanoid.Health <= 0 then
				u913 = true
				v907()

				return
			end

			v885(p108)

			if Humanoid.PlatformStand then
				Humanoid.PlatformStand = false
				Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
			end

			if Humanoid.WalkSpeed <= 0 then
				Humanoid.WalkSpeed = 14

				if shared then
					shared.WalkSpeedChangeTick = nil
				end
			end

			if Humanoid.JumpPower <= 0 then
				Humanoid.JumpPower = 50
			end

			if not Humanoid.AutoRotate then
				Humanoid.AutoRotate = true
			end

			if not Humanoid:GetStateEnabled(Enum.HumanoidStateType.Jumping) then
				Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
			end

			if not Humanoid:GetStateEnabled(Enum.HumanoidStateType.Running) then
				Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
			end

			if not Humanoid:GetStateEnabled(Enum.HumanoidStateType.GettingUp) then
				Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
			end

			local Torso = p108:FindFirstChild("Torso")

			if Torso then
				local v920 = false

				for _, child in ipairs(Torso:GetChildren()) do
					if child:IsA("BallSocketConstraint") then
						if child.Name:match("^SocketConstraint") and child.Enabled then
							v920 = true

							break
						end
					end
				end

				if v920 then
					v889(p108)
				end
			end

			if HumanoidRootPart and HumanoidRootPart.Parent then
				for _, child in ipairs(HumanoidRootPart:GetChildren()) do
					if child:IsA("BodyVelocity") or child:IsA("BodyForce") then
						child.Parent = nil
					end
				end
			end
		end)

		table.insert(t46, connection3)
	end

	t3.UtilitiesBox:AddToggle("AntiPush", {
		Text = " Anti Push/Ragdoll",
		Default = false,
		Callback = function(p109)
			u905 = p109

			if p109 then
				if LocalPlayer.Character then
					v910(LocalPlayer.Character)
				end

				local connection2 = LocalPlayer.CharacterAdded:Connect(function(character)
					task.wait(0.5)

					if u905 then
						v910(character)
					end
				end)

				table.insert(t46, connection2)
			else
				v907()
			end
		end
	})
end

game:GetService("UserInputService")

do
	local u926 = false
	local connection2

	t3.UtilitiesBox:AddToggle("InstantInteract", {
		Text = " Instant Interact",
		Default = false,
		Callback = function(p110)
			u926 = p110

			if u926 then
				connection2 = game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt, player)
					if u926 and player == LocalPlayer then
						fireproximityprompt(prompt)
					end
				end)
			elseif connection2 then
				connection2:Disconnect()
				connection2 = nil
			end
		end
	})
end

t3.UtilitiesBox:AddToggle("DisableWatermark", {
	Text = " Disable Watermark",
	Default = false,
	Callback = function(p111)
		getgenv().DisableWatermarkUI = p111
	end
})

do
	local u928

	local function v929()
		local v930
		local huge = math.huge
		local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

		if not HumanoidRootPart then
			return nil
		end

		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= LocalPlayer and player.Character then
				local HumanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")
				local Humanoid = player.Character:FindFirstChild("Humanoid")

				if HumanoidRootPart2 and Humanoid and Humanoid.Health > 0 then
					local Magnitude = (HumanoidRootPart.Position - HumanoidRootPart2.Position).Magnitude

					if Magnitude < huge then
						huge = Magnitude
						v930 = player
					end
				end
			end
		end

		return v930
	end

	t3.UtilitiesBox:AddToggle("AutoCamLock", {
		Text = " CamLock (Auto Games)",
		Default = false,
		Callback = function(p112)
			_G.CamLockEnabled = p112

			if p112 then
				if not _G.CamLockSearchThread then
					_G.CamLockSearchThread = true
					task.spawn(function()
						while _G.CamLockSearchThread do
							if (v60("LightsOut") or v60("Mingle") or v60("SkySquidGame") or v60("SquidGame") or v60("LastDinner")) and _G.CamLockEnabled then
								u928 = v929()
							else
								u928 = nil
							end

							task.wait(0.2)
						end
					end)
				end

				if not _G.CamLockBound then
					_G.CamLockBound = true
					game:GetService("RunService"):BindToRenderStep("UwUCamLock", Enum.RenderPriority.Camera.Value + 1, function()
						if _G.CamLockEnabled and u928 and u928.Character then
							local HumanoidRootPart = u928.Character:FindFirstChild("HumanoidRootPart")
							local CurrentCamera = workspace.CurrentCamera

							if HumanoidRootPart and CurrentCamera then
								CurrentCamera.CFrame = CFrame.new(CurrentCamera.CFrame.Position, HumanoidRootPart.Position)
							end
						end
					end)
				end
			else
				_G.CamLockSearchThread = false

				if _G.CamLockBound then
					game:GetService("RunService"):UnbindFromRenderStep("UwUCamLock")
					_G.CamLockBound = false
				end

				u928 = nil
			end
		end
	})
end

t3.GameToolsBox:AddToggle("AntiAFK", {
	Text = " Anti-AFK",
	Default = false,
	Callback = function(p113)
		if not p113 then
			if getgenv().antiAfkConnection then
				getgenv().antiAfkConnection:Disconnect()
				getgenv().antiAfkConnection = nil
			end
		elseif not getgenv().antiAfkConnection then
			getgenv().antiAfkConnection = LocalPlayer.Idled:Connect(function()
				local VirtualUser = game:GetService("VirtualUser")

				VirtualUser:CaptureController()
				VirtualUser:ClickButton2(Vector2.new())
			end)
		end
	end
})
t3.GameToolsBox:AddToggle("BandageHelper", {
	Text = " Bandage Helper",
	Default = false,
	Callback = function(p114)
		if p114 then
			if _G.BandageHelperActive then
				return
			end

			_G.BandageHelperActive = true
			_G.BandageConns = {}

			local Players2 = game:GetService("Players")
			local RunService_ = game:GetService("RunService")
			local Lighting = game:GetService("Lighting")
			local StarterPlayer = game:GetService("StarterPlayer")
			local LocalPlayer2 = Players2.LocalPlayer
			local t47 = {
				"Freeze",
				"Slowed",
				"Action",
				"LightAction",
				"NoAttack"
			}
			local t48 = {
				"Stun",
				"Freeze",
				"Slowed",
				"Action",
				"LightAction",
				"Ragdoll",
				"NoAttack"
			}
			local t49 = {
				["HEALING WAVE 1"] = true,
				["HEALING WAVE 2"] = true,
				SPARKS = true,
				["STAR SPARKS"] = true,
				BandageModel = true,
				HealingOverlay = true,
				Blue = true,
				Green = true,
				VFX = true
			}

			local function v949(child)
				if not _G.BandageHelperActive then
					return
				end

				if child:IsA("ColorCorrectionEffect") then
					if child.TintColor.G > 0.6 and (child.TintColor.R < 0.5 or child.TintColor.B < 0.5) then
						child.TintColor = Color3.fromRGB(255, 255, 255)
					end

					if child.Name == "ColorSkill" or string.find(string.lower(child.Name), "heal") or string.find(string.lower(child.Name), "green") or string.find(string.lower(child.Name), "bandage") then
						child:Destroy()
					end
				elseif (child:IsA("BloomEffect") or child:IsA("BlurEffect")) and (string.find(string.lower(child.Name), "heal") or string.find(string.lower(child.Name), "bandage")) then
					child:Destroy()
				end
			end

			for _, child in ipairs(Lighting:GetChildren()) do
				v949(child)
			end

			table.insert(_G.BandageConns, Lighting.ChildAdded:Connect(v949))

			local function v952(character)
				if not character or not _G.BandageHelperActive then
					return
				end

				local Humanoid = character:WaitForChild("Humanoid", 5)

				character:WaitForChild("HumanoidRootPart", 5)

				if not Humanoid then
					return
				end

				table.insert(_G.BandageConns, (Humanoid:FindFirstChildOfClass("Animator") or Humanoid).AnimationPlayed:Connect(function(p115)
					if _G.BandageHelperActive and p115.Animation and (string.find(p115.Animation.AnimationId, "75334524397463") or p115.Animation.Name and string.find(string.lower(p115.Animation.Name), "bandage")) then
						p115:Stop()
					end
				end))
				table.insert(_G.BandageConns, character.DescendantAdded:Connect(function(descendant)
					if _G.BandageHelperActive then
						if t49[descendant.Name] or string.find(string.lower(descendant.Name), "healing") or string.find(string.lower(descendant.Name), "bandage") or string.find(string.lower(descendant.Name), "sparks") then
							descendant:Destroy()
						end
					end
				end))
			end

			if LocalPlayer2.Character then
				v952(LocalPlayer2.Character)
			end

			table.insert(_G.BandageConns, LocalPlayer2.CharacterAdded:Connect(v952))

			local function v954(p116)
				table.insert(_G.BandageConns, p116.DescendantAdded:Connect(function(descendant)
					if _G.BandageHelperActive then
						if (t49[descendant.Name] or string.find(string.lower(descendant.Name), "bandage") or string.find(string.lower(descendant.Name), "healing")) and not descendant:IsA("Script") then
							descendant:Destroy()
						end
					end
				end))
			end

			local PlayerGui = LocalPlayer2:FindFirstChildOfClass("PlayerGui")

			if PlayerGui then
				v954(PlayerGui)
			else
				table.insert(_G.BandageConns, LocalPlayer2.ChildAdded:Connect(function(child)
					if _G.BandageHelperActive and child:IsA("PlayerGui") then
						v954(child)
					end
				end))
			end

			table.insert(_G.BandageConns, RunService_.Heartbeat:Connect(function()
				if not _G.BandageHelperActive then
					return
				end

				if shared.IsInCutscene then
					shared.IsInCutscene = nil
				end

				local Character = LocalPlayer2.Character

				if not Character then
					return
				end

				local Humanoid = Character:FindFirstChildOfClass("Humanoid")
				local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

				for _, v in ipairs(t47) do
					if Character:GetAttribute(v) ~= nil then
						Character:SetAttribute(v, nil)
					end

					if Humanoid and Humanoid:GetAttribute(v) ~= nil then
						Humanoid:SetAttribute(v, nil)
					end
				end

				for _, v in ipairs(t48) do
					local v963 = Character:FindFirstChild(v)

					if v963 then
						v963:Destroy()
					end
				end

				if HumanoidRootPart and HumanoidRootPart.Anchored then
					HumanoidRootPart.Anchored = false
				end

				shared.WalkSpeedChangeTick = nil

				if Humanoid then
					local CharacterWalkSpeed = StarterPlayer.CharacterWalkSpeed or 16
					local CharacterJumpPower = StarterPlayer.CharacterJumpPower or 50

					if Humanoid.WalkSpeed < CharacterWalkSpeed then
						Humanoid.WalkSpeed = CharacterWalkSpeed
					end

					if Humanoid.JumpPower < CharacterJumpPower then
						Humanoid.JumpPower = CharacterJumpPower
					end

					if Humanoid.PlatformStand then
						Humanoid.PlatformStand = false
					end
				end
			end))
		else
			_G.BandageHelperActive = false

			if _G.BandageConns then
				for _, bandageConn in ipairs(_G.BandageConns) do
					if bandageConn then
						bandageConn:Disconnect()
					end
				end

				table.clear(_G.BandageConns)
			end
		end
	end
})

do
	local u968 = false
	local u969

	local function v970()
		for _, player in pairs(Players:GetPlayers()) do
			if player ~= LocalPlayer and player.Character then
				local Character = player.Character

				if not Character:FindFirstChild("LightsOutESP") then
					local Highlight = Instance.new("Highlight")

					Highlight.Name = "LightsOutESP"
					Highlight.FillTransparency = 0.5
					Highlight.OutlineTransparency = 0
					Highlight.FillColor = Color3.fromRGB(255, 0, 0)
					Highlight.OutlineColor = Color3.fromRGB(200, 0, 0)
					Highlight.Adornee = Character
					Highlight.Parent = Character
				end
			end
		end
	end
	local function v975()
		for _, player in pairs(Players:GetPlayers()) do
			if player.Character then
				local LightsOutESP = player.Character:FindFirstChild("LightsOutESP")

				if LightsOutESP then
					LightsOutESP:Destroy()
				end
			end
		end
	end

	t3.LightsOutBox:AddButton({
		Text = "TP To Roof",
		Func = function()
			if v60("LightsOut") then
				local Character = LocalPlayer.Character
				local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart then
					HumanoidRootPart.CFrame = CFrame.new(198, 145, -93)
					v63("Lights Out", "Teleported to roof")
				end
			else
				v63(nil, "Lights Out is not currently running.")
			end
		end
	})
	t3.LightsOutBox:AddToggle("LightsOutESP", {
		Text = " ESP All",
		Default = false,
		Callback = function(p117)
			u968 = p117

			if u968 then
				if u969 then
					return
				end

				u969 = true
				task.spawn(function()
					while u968 and u969 do
						if v60("LightsOut") then
							v970()
						else
							v975()
						end

						task.wait(2)
					end

					v975()
					u969 = nil
				end)
			else
				v975()
			end
		end
	})
end

do
	local u981 = false
	local t50 = {}
	local u983 = false

	local function v984()
		local Character = LocalPlayer.Character

		if not Character then
			return
		end

		local Humanoid = Character:FindFirstChild("Humanoid")

		if not Humanoid then
			return
		end

		local Animator = Humanoid:FindFirstChildOfClass("Animator")

		if not Animator then
			return
		end

		local connection2 = Animator.AnimationPlayed:Connect(function(p118)
			if not u981 then
				return
			end

			if p118.Animation and string.find(tostring(p118.Animation.AnimationId), "99157505926076", 1, true) then
				u983 = true

				local Humanoid2 = Character:FindFirstChild("Humanoid")

				if Humanoid2 then
					Humanoid2.AutoRotate = false
				end

				p118.Stopped:Once(function()
					u983 = false

					local Humanoid3 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")

					if Humanoid3 then
						Humanoid3.AutoRotate = true
					end
				end)
			end
		end)

		table.insert(t50, connection2)
	end

	t3.LightsOutBox:AddToggle("DashAssist", {
		Text = " Dash Assist",
		Default = false,
		Callback = function(p119)
			u981 = p119

			if u981 then
				v984()

				local connection2 = LocalPlayer.CharacterAdded:Connect(function()
					task.wait(0.5)

					if u981 then
						v984()
					end
				end)

				table.insert(t50, connection2)

				local connection3 = game:GetService("RunService").Heartbeat:Connect(function()
					if u981 then
						if u983 then
							if not v60("LightsOut") then
								return
							end

							local Character = LocalPlayer.Character
							local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

							if not HumanoidRootPart then
								return
							end

							local v995
							local huge = math.huge

							for _, player in pairs(Players:GetPlayers()) do
								if player ~= LocalPlayer and player.Character then
									if player.Character:FindFirstChild("HumanoidRootPart") then
										if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
											local Magnitude = (player.Character.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude

											if Magnitude < huge then
												huge = Magnitude
												v995 = player
											end
										end
									end
								end
							end

							if v995 and v995.Character then
								if v995.Character:FindFirstChild("HumanoidRootPart") then
									local Position = v995.Character.HumanoidRootPart.Position

									HumanoidRootPart.CFrame = CFrame.lookAt(HumanoidRootPart.Position, Vector3.new(Position.X, HumanoidRootPart.Position.Y, Position.Z))
								end
							end

							return
						end
					end
				end)

				table.insert(t50, connection3)
			else
				u983 = false

				for _, v in pairs(t50) do
					pcall(function()
						v:Disconnect()
					end)
				end

				table.clear(t50)
			end
		end
	})
end

do
	local u1003 = false
	local u1004

	t3.LightsOutBox:AddToggle("AutoTPRoofUnder30", {
		Text = " Auto TP Roof Health Under 30",
		Default = false,
		Callback = function(p120)
			u1003 = p120

			if u1003 then
				if u1004 then
					return
				end

				u1004 = true
				task.spawn(function()
					local v1005 = false

					while u1004 do
						if not u1003 then
							break
						end

						if v60("LightsOut") then
							local Character = LocalPlayer.Character
							local Humanoid = Character and Character:FindFirstChild("Humanoid")
							local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

							if Humanoid and HumanoidRootPart and Humanoid.Health > 0 and Humanoid.Health <= 30 and not v1005 then
								HumanoidRootPart.CFrame = CFrame.new(198, 145, -93)
								v1005 = true
							end
						else
							v1005 = false
						end

						task.wait(0.5)
					end

					u1004 = nil
				end)
			end
		end
	})
end

t3.LightsOutBox:AddToggle("LightsOutFullBright", {
	Text = " Full Bright",
	Default = false,
	Callback = function(p121)
		_G.LightsOutFullBrightEnabled = p121

		if p121 then
			if not _G.LightsOutFullBrightCacheThread then
				_G.LightsOutFullBrightCacheThread = true
				task.spawn(function()
					_G.CachedBrightObjects = {}

					while _G.LightsOutFullBrightCacheThread do
						if _G.LightsOutFullBrightEnabled and v60("LightsOut") then
							table.clear(_G.CachedBrightObjects)

							for _, descendant in ipairs(workspace:GetDescendants()) do
								if descendant:IsA("Light") or descendant:IsA("BasePart") and descendant.Name == "ChangeColorLightsOut" then
									table.insert(_G.CachedBrightObjects, descendant)
								end
							end
						end

						task.wait(2)
					end
				end)
			end

			if not _G.LightsOutFullBrightRenderThread then
				_G.LightsOutFullBrightRenderThread = game:GetService("RunService").RenderStepped:Connect(function()
					if _G.LightsOutFullBrightEnabled then
						if v60("LightsOut") then
							local Lighting = game:GetService("Lighting")

							Lighting.Ambient = Color3.fromRGB(150, 150, 150)
							Lighting.OutdoorAmbient = Color3.fromRGB(150, 150, 150)
							Lighting.Brightness = 1
							Lighting.ClockTime = 14

							local Atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")

							if Atmosphere then
								Atmosphere.Density = 0
							end

							local ColorCorrectionEffect = Lighting:FindFirstChildOfClass("ColorCorrectionEffect")

							if ColorCorrectionEffect then
								ColorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255)
								ColorCorrectionEffect.Brightness = 0
								ColorCorrectionEffect.Contrast = 0
								ColorCorrectionEffect.Saturation = 0
							end

							if _G.CachedBrightObjects then
								for _, cachedBrightObject in ipairs(_G.CachedBrightObjects) do
									if cachedBrightObject and cachedBrightObject.Parent then
										if cachedBrightObject:IsA("Light") then
											cachedBrightObject.Enabled = true

											if cachedBrightObject.Color.G < 0.2 and cachedBrightObject.Color.B < 0.2 then
												cachedBrightObject.Color = Color3.fromRGB(255, 255, 255)
											end
										elseif cachedBrightObject:IsA("BasePart") and cachedBrightObject.Color.G < 0.2 and cachedBrightObject.Color.B < 0.2 then
											cachedBrightObject.Color = Color3.fromRGB(255, 255, 255)
										end
									end
								end
							end
						end
					end
				end)
			end
		else
			_G.LightsOutFullBrightCacheThread = false

			if _G.LightsOutFullBrightRenderThread then
				_G.LightsOutFullBrightRenderThread:Disconnect()
				_G.LightsOutFullBrightRenderThread = nil
			end

			if _G.CachedBrightObjects then
				table.clear(_G.CachedBrightObjects)
			end
		end
	end
})
t3.GuardBox:AddButton({
	Text = " Free Perm Guard",
	Func = function()
		LocalPlayer:SetAttribute("__OwnsPermGuard", true)
		v63(" Guard", "Free Perm Guard Activated")
	end
})

do
	local u1016 = false
	local thread2

	t3.GuardBox:AddToggle("GuardAutoQTE", {
		Text = " Auto QTE Event (Guard)",
		Default = false,
		Callback = function(p122)
			u1016 = p122

			if u1016 and not thread2 then
				thread2 = task.spawn(function()
					local t51 = {}

					while u1016 do
						if LocalPlayer:GetAttribute("IsGuard") then
							local v1019 = v68()

							if v1019 and v1019.ActiveButtons then
								for k, activeButton in pairs(v1019.ActiveButtons) do
									if not t51[k] and activeButton then
										t51[k] = true
										task.delay(0.01, function()
											if u1016 and v1019.ActiveButtons and v1019.ActiveButtons[k] then
												pcall(function()
													v1019.Pressed(false, v1019.ActiveButtons[k])
												end)
											end
										end)
									end
								end

								for k in pairs(t51) do
									if not v1019.ActiveButtons[k] then
										t51[k] = nil
									end
								end
							end
						else
							table.clear(t51)
						end

						task.wait(0.05)
					end

					thread2 = nil
				end)
			end
		end
	})
end

do
	local u1023 = false
	local u1024

	local function v1025(p123)
		return p123:FindFirstChild("TypeOfGuard") ~= nil
	end
	local function v1026()
		local Character = LocalPlayer.Character

		if not Character then
			return nil
		end

		local t52 = {
			G3SG1 = true,
			["Glock 17"] = true,
			["Five Seven"] = true,
			["Colt M1911"] = true,
			Uzi = true,
			MP5K = true,
			["Thompson M1A1"] = true,
			["Colt Python 6"] = true,
			M4A1 = true,
			["FN Fal"] = true,
			HK416 = true,
			Deagle = true,
			P90 = true
		}

		for _, child in ipairs(Character:GetChildren()) do
			if t52[child.Name] then
				return child
			end
		end

		return nil
	end

	t3.GuardBox:AddToggle("AutoShootGuard", {
		Text = " Auto Shoot",
		Default = false,
		Callback = function(p124)
			u1023 = p124

			if u1023 then
				if u1024 then
					return
				end

				u1024 = true
				task.spawn(function()
					while u1023 and u1024 do
						local Live = workspace:FindFirstChild("Live")
						local v1032 = v1026()
						local Character = LocalPlayer.Character
						local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

						if Live and v1032 and HumanoidRootPart then
							for _, child in ipairs(Live:GetChildren()) do
								if child:IsA("Model") then
									local HumanoidRootPart2 = child:FindFirstChild("HumanoidRootPart")
									local Humanoid = child:FindFirstChild("Humanoid")

									if HumanoidRootPart2 then
										if Humanoid and Humanoid.Health > 0 and child ~= Character then
											local v1039 = false
											local GuardCanKillLockOn = HumanoidRootPart2:FindFirstChild("GuardCanKillLockOn")

											if GuardCanKillLockOn and GuardCanKillLockOn:IsA("BillboardGui") then
												v1039 = true
											end

											if v1039 then
												local s5 = "Unknown"

												for _, player in pairs(Players:GetPlayers()) do
													if player.Character == child then
														s5 = player.Name

														break
													end
												end

												local t53 = {
													v1032,
													{
														ClientRayNormal = Vector3.yAxis,
														FiredGun = true,
														bulletCF = CFrame.new(),
														ClientRayInstance = HumanoidRootPart2,
														SecondaryHitTargets = {},
														ClientRayPosition = HumanoidRootPart2.Position,
														HitTargets = {
															[s5] = "Torso"
														},
														bulletSizeC = Vector3.new(0.01, 0.01, 100),
														NoMuzzleFX = false,
														FirePosition = HumanoidRootPart.Position + Vector3.new(0, 1.5, 0)
													}
												}

												pcall(function()
													game:GetService("ReplicatedStorage").Remotes.FiredGunClient:FireServer(unpack(t53))
												end)
											end
										end
									end
								end
							end
						end

						game:GetService("RunService").Heartbeat:Wait()
					end

					u1024 = nil
				end)
			end
		end
	})

	local u1045 = false
	local u1046

	t3.GuardBox:AddToggle("InfiniteAmmoGuard", {
		Text = " Infinite Ammo",
		Default = false,
		Callback = function(p125)
			u1045 = p125

			if u1045 then
				if u1046 then
					return
				end

				u1046 = true
				task.spawn(function()
					while u1045 and u1046 do
						if LocalPlayer:GetAttribute("IsGuard") then
							local v1047 = v1026()

							if v1047 then
								local t54 = {
									v1047,
									{
										ReloadingGun = true
									}
								}

								pcall(function()
									game:GetService("ReplicatedStorage").Remotes.FiredGunClient:FireServer(unpack(t54))
								end)
							end
						end

						task.wait(1)
					end

					u1046 = nil
				end)
			end
		end
	})
end

do
	local u1049 = false
	local u1050

	local function v1051()
		local Character = LocalPlayer.Character

		if not Character then
			return nil
		end

		for _, v in pairs({
			"Colt M1911",
			"Uzi",
			"Five Seven",
			"MP5K",
			"Colt Python 6",
			"Deagle",
			"P90",
			"FN Fal",
			"M4A1",
			"HK416"
		}) do
			local v1055 = Character:FindFirstChild(v)

			if v1055 then
				return v1055
			end
		end

		return nil
	end

	local n26 = 0

	t3.AdminAbuseBox:AddButton({
		Text = " RLGL TP Start",
		Func = function()
			if not v60("AdminAbuseRedLightGreenLight") then
				v63(nil, "Admin Abuse RLGL is not currently running.")

				return
			end

			if tick() - n26 < 10 then
				v63(nil, "Please wait before teleporting again (" .. math.ceil(10 - (tick() - n26)) .. "s)")

				return
			end

			v78(CFrame.new(-1375, -30, 22))
			n26 = tick()
			v63(nil, "Teleported to Start")
		end
	})
	t3.AdminAbuseBox:AddButton({
		Text = " RLGL TP End",
		Func = function()
			if not v60("AdminAbuseRedLightGreenLight") then
				v63(nil, "Admin Abuse RLGL is not currently running.")

				return
			end

			if tick() - n26 < 10 then
				v63(nil, "Please wait before teleporting again (" .. math.ceil(10 - (tick() - n26)) .. "s)")

				return
			end

			v78(CFrame.new(-1361, -28, 701))
			n26 = tick()
			v63(nil, "Teleported to End")
		end
	})
	t3.AdminAbuseBox:AddToggle("AutoShootAA", {
		Text = " Auto Shoot PBRS (AA)",
		Default = false,
		Callback = function(p126)
			u1049 = p126

			if u1049 then
				if u1050 then
					return
				end

				u1050 = true
				task.spawn(function()
					while u1049 and u1050 do
						if v1051() and LocalPlayer.Character then
							if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
								local v1057
								local v1058, v1059, v1060 = pairs(workspace:GetChildren())
								local v1061 = geniter(v1058, v1059, v1060)

								while true do
									local v1062 = table.pack(v1061())

									if not v1062[1] then
										break
									end

									local v1063 = v1062[3]

									if v1063:IsA("Model") or v1063:IsA("Folder") then
										local Live = v1063:FindFirstChild("Live")

										if Live and Live:IsA("Folder") then
											v1057 = Live

											break
										end
									end
								end

								if not v1057 then
									local v1065, v1066, v1067 = pairs(workspace:GetDescendants())
									local v1068 = geniter(v1065, v1066, v1067)

									while true do
										local v1069 = table.pack(v1068())

										if v1069[1] then
											local v1070 = v1069[3]

											if v1070.Name == "Live" and v1070:IsA("Folder") then
												v1057 = v1070

												break
											end
										else
											break
										end
									end
								end

								if v1057 then
									local v1071, v1072, v1073 = pairs(v1057:GetChildren())

									for _, v in v1071, v1072, v1073 do
										if v:IsA("Model") then
											if string.match(string.lower(v.Name), "peabert") then
												local BasePart = v:FindFirstChildWhichIsA("BasePart", true)

												if BasePart then
													local v1077 = v1051()

													if v1077 then
														local t55 = {
															v1077,
															{
																ClientRayNormal = Vector3.yAxis,
																FiredGun = true,
																bulletCF = CFrame.new(BasePart.Position),
																ClientRayInstance = BasePart,
																SecondaryHitTargets = {},
																ClientRayPosition = BasePart.Position,
																HitTargets = {
																	[v.Name] = BasePart.Name
																},
																bulletSizeC = Vector3.new(0.01, 0.01, 10),
																NoMuzzleFX = false,
																FirePosition = LocalPlayer.Character.HumanoidRootPart.Position
															}
														}

														pcall(function()
															game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("FiredGunClient"):FireServer(unpack(t55))
														end)
														task.wait(0.025)
													end
												end
											end
										end
									end
								end
							end
						end

						task.wait(0.1)
					end

					u1050 = nil
				end)
			end
		end
	})
end

do
	local Menu = t2.UISettings:AddLeftGroupbox("Menu")

	Menu:AddButton("Unload", function()
		lib:Unload()
	end)
	Menu:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {
		Default = "G",
		NoUI = true,
		Text = "Menu keybind"
	})

	local u1080 = false

	Menu:AddToggle("UnlockMouseToggle", {
		Text = "Unlock Mouse When Menu Open",
		Default = false,
		Callback = function(p127)
			u1080 = p127

			if lib then
				lib.UnlockMouseWhileOpen = p127
			end

			if not p127 and lib and lib.ScreenGui then
				for _, child in ipairs(lib.ScreenGui:GetChildren()) do
					if child:IsA("TextButton") then
						if child.Size == UDim2.fromScale(0, 0) then
							child.Modal = false
						end
					end
				end
			end
		end
	})
	task.spawn(function()
		local RunService_ = game:GetService("RunService")
		local GuiService = game:GetService("GuiService")

		RunService_:BindToRenderStep("AggressiveMouseLock", Enum.RenderPriority.Last.Value + 2, function()
			if lib and not lib.Unloaded then
				local u1085 = false

				pcall(function()
					if type(lib.Toggled) == "boolean" then
						u1085 = not lib.Toggled
					elseif lib.MainGui then
						u1085 = not lib.MainGui.Enabled
					end
				end)

				if not GuiService.MenuIsOpen then
					if not u1085 then
						if not u1080 and lib.ScreenGui then
							for _, child in ipairs(lib.ScreenGui:GetChildren()) do
								if child:IsA("TextButton") and child.Size == UDim2.fromScale(0, 0) then
									child.Modal = false
								end
							end
						end
					end
				end
			end
		end)
	end)
end

pcall(function()
	lib.ToggleKeybind = lib.Options.MenuKeybind
end)
lib2:SetLibrary(lib)
lib3:SetLibrary(lib)
lib3:IgnoreThemeSettings()
lib3:SetIgnoreIndexes({})
lib2:SetFolder("UwUInk")
lib3:SetFolder("UwUInk/main")
lib3:BuildConfigSection(t2.UISettings)
lib2:ApplyToTab(t2.UISettings)
lib3:LoadAutoloadConfig()
pcall(function()
	local Sound = Instance.new("Sound")

	Sound.SoundId = "rbxassetid://8323804973"
	Sound.Volume = 2
	Sound.Parent = game:GetService("SoundService")
	Sound:Play()
	Sound.Ended:Connect(function()
		Sound:Destroy()
	end)
end)
lib:Notify("Please Showcase My Script On Tiktok or Somewhere", 10)

if v40 then
	task.wait(1)
	lib:Notify("<font color=\"#F87171\"><b>GAME VERSION CHANGE DETECTED</b></font>\n<font color=\"#FCCCA7\">Some features may be patched. Please wait for an update.</font>", 10)
end

task.spawn(function()
	local HttpService2 = game:GetService("HttpService")

	local function v1090(p128)
		return HttpService2:UrlEncode(p128)
	end

	local v1091 = v1090(game:GetService("Players").LocalPlayer.Name)
	local inkGame = v1090("Ink Game")

	while true do
		local v1093 = "https://platinstudio.xyz" .. "/iwasactive?user=" .. v1091 .. "&game=" .. inkGame

		pcall(function()
			game:HttpGetAsync(v1093)
		end)
		task.wait(25)
	end
end)
