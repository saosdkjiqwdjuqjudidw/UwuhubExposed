-- old uwu hub version which was using luraph 14.8

local HttpService = game:GetService("HttpService")
local n1 = 0
local v3 = false

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

		if data then
			if data.LastCheckedVersion then
				n1 = tonumber(data.LastCheckedVersion) or 0
			end
		end
	end
end)

if game.PlaceId ~= 99567941238278 and n1 < game.PlaceVersion then
	v3 = true
end

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local u12 = false

pcall(function()
	local request_ = request or http_request or syn and syn.request or fluxus and fluxus.request

	if request_ then
		local v14 = request_({
			Url = "https://platinstudio.xyz/raw/InkScriptVersion",
			Method = "GET"
		})

		if v14 and v14.Success then
			if v14.Body then
				local v15 = v14.Body:gsub("%s+", "")

				if v15 ~= "" then
					if (tonumber(("v1.3"):match("%d+%.?%d*")) or 0) < (tonumber(v15:match("%d+%.?%d*")) or 0) then
						u12 = true
					end
				end
			end
		end
	end
end)

if u12 then
	local Players = game:GetService("Players")

	while not Players.LocalPlayer do
		task.wait(0.1)
	end

	Players.LocalPlayer:Kick("Outdated Script Version\nIf You Believe This Is Mistake discord.gg/uwustudios")

	return
end

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()

local lib = loadstring(game:HttpGet("https://platinstudio.xyz/raw/Footage-Wind"))()
local v22 = lib:CreateWindow({
	Title = "Uwu Hub | Ink Game",
	Icon = "bird",
	Folder = "UwuHub",
	ToggleKey = Enum.KeyCode.G,
	Size = UDim2.fromOffset(650, 480),
	Transparent = false,
	Theme = "Dark",
	Author = "discord.gg/uwustudios",
	User = {
		Enabled = true,
		Callback = function()
		end,
		Anonymous = false
	},
	OpenButton = {
		Title = "Uwu Hub",
		CornerRadius = UDim.new(1, 0),
		StrokeThickness = 3,
		Enabled = true,
		Draggable = true,
		OnlyMobile = false,
		Scale = 0.5,
		Color = ColorSequence.new(Color3.fromHex("#A5B4FC"), Color3.fromHex("#FFFFFF"))
	}
})
local t4 = {
	RLGL = v22:Tab({
		Title = "Red Light Green Light",
		Icon = "traffic-cone"
	}),
	Dalgona = v22:Tab({
		Title = "Dalgona & Pentathlon",
		Icon = "cookie"
	}),
	LightsOut = v22:Tab({
		Title = "Lights Out",
		Icon = "moon"
	}),
	HSTOW = v22:Tab({
		Title = "Hide And Seek & Tug Of War",
		Icon = "eye"
	}),
	MingleGlass = v22:Tab({
		Title = "Jump Rope & Glass Bridge",
		Icon = "swords"
	}),
	Mingle = v22:Tab({
		Title = "Mingle",
		Icon = "users"
	}),
	Rebel = v22:Tab({
		Title = "Rebel",
		Icon = "target"
	}),
	Sky = v22:Tab({
		Title = "Sky & Squid Game",
		Icon = "cloud"
	}),
	Utilities = v22:Tab({
		Title = "Utilities",
		Icon = "wrench"
	}),
	Guard = v22:Tab({
		Title = "Guard Mode",
		Icon = "shield"
	}),
	Combat = v22:Tab({
		Title = "Combat",
		Icon = "swords"
	}),
	Tools = v22:Tab({
		Title = "Tools",
		Icon = "wrench"
	}),
	Visual = v22:Tab({
		Title = "Visual",
		Icon = "eye"
	}),
	UISettings = v22:Tab({
		Title = "UI Settings",
		Icon = "settings"
	})
}
local t5 = {
	InfoBox = t4.UISettings:Section({
		Opened = true,
		Title = "| Uwu Hub Information",
		Icon = "info"
	})
}
local InfoBox = t5.InfoBox

if game.PlaceId ~= 99567941238278 then
	InfoBox:Divider()
	InfoBox:Paragraph({
		Title = "Game Version",
		Desc = "<font color=\"#A5B4FC\"><b>" .. tostring(game.PlaceVersion) .. "</b></font>"
	})
	InfoBox:Divider()
	InfoBox:Paragraph({
		Title = "Last Checked",
		Desc = "<font color=\"#A5B4FC\"><b>" .. tostring(n1) .. "</b></font>"
	})

	if v3 then
		InfoBox:Space()
		InfoBox:Divider()
		InfoBox:Paragraph({
			Title = "<font color=\"#F87171\"><b>WARNING</b></font>",
			Desc = "<font color=\"#FCCCA7\">Game Version Change Detected Features may be patched.</font>"
		})
	end
end

InfoBox:Space()
InfoBox:Section({
	Opened = true,
	Title = "<font color=\"#FBBF24\"><b>Latest Update Logs:</b></font>"
})

local s1 = "Failed to fetch logs..."

pcall(function()
	local request_ = request or http_request or syn and syn.request

	if request_ then
		local v28 = request_({
			Url = "https://platinstudio.xyz/raw/UpdateLogs",
			Method = "GET"
		})

		if not v28 or not v28.Success or not v28.Body or v28.StatusCode ~= 200 then
			v28 = request_({
				Url = "https://raw.githubusercontent.com/platinww/UwU/refs/heads/main/UI/LastUpdateLog",
				Method = "GET"
			})
		end

		if v28 and v28.Success and v28.Body then
			local s2 = ""

			for match in tostring(v28.Body):gmatch("[^\r\n]+") do
				local v31 = match:gsub("%*%*", "")

				if v31:match("^%s*%-") then
					s2 ..= "<font color=\"#A5B4FC\">></font> <font color=\"#F3F4F6\">" .. v31:gsub("^%s*%-%s*", "") .. "</font>\n"
				end
			end

			if s2 == "" then
				s1 = "<font color=\"#9CA3AF\">No recent updates found.</font>"
			else
				s1 = s2:gsub("\n$", "")
			end
		end
	end
end)
InfoBox:Divider()
InfoBox:Paragraph({
	Title = "Latest Update Logs:",
	Desc = s1
})

local Value
local n2 = 0

local function v34()
	if tick() - n2 < 0.5 then
		return Value
	end

	n2 = tick()

	local Values = Workspace:FindFirstChild("Values")
	local CurrentGame = Values and Values:FindFirstChild("CurrentGame")

	if not CurrentGame or CurrentGame.Value == "" then
		Value = nil
	else
		Value = CurrentGame.Value
	end

	return Value
end
local function v37(p1)
	return v34() == p1
end

local soundId = "rbxassetid://4590657391"

pcall(function()
	if not isfolder("UwUStudios") then
		makefolder("UwUStudios")
	end

	if not isfile("UwUStudios/notify.wav") then
		local response = game:HttpGet("https://github.com/platinww/UwU/raw/refs/heads/main/UI/notify.wav")

		writefile("UwUStudios/notify.wav", response)
	end

	if getcustomasset then
		soundId = getcustomasset("UwUStudios/notify.wav")
	end
end)

local function v40(p2, p3)
	lib:Notify({
		Title = p2 or "Uwu Hub",
		Content = p3,
		Duration = 4
	})
	pcall(function()
		local Sound = Instance.new("Sound")

		Sound.SoundId = soundId or "rbxassetid://4590657391"
		Sound.Volume = 2
		Sound.Parent = game:GetService("SoundService")
		Sound:Play()
		game:GetService("Debris"):AddItem(Sound, 3)
	end)
end

local t6 = {
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

local function v43(p4)
	if type(keypress) == "function" and type(keyrelease) == "function" then
		local v44 = t6[string.lower(tostring(p4))]

		if v44 then
			keypress(v44)
			task.wait(0.05)
			keyrelease(v44)

			return true
		end
	end

	return false
end

local HBGQTE

local function v46()
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

local function v54(p8, p9)
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
local function v56(p10)
	local Character = LocalPlayer.Character

	if Character then
		if Character:FindFirstChild("HumanoidRootPart") then
			local HumanoidRootPart = Character.HumanoidRootPart

			HumanoidRootPart.Velocity = Vector3.zero
			HumanoidRootPart.RotVelocity = Vector3.zero
			HumanoidRootPart.Anchored = true
			Character:PivotTo(p10)
			task.wait()
			HumanoidRootPart.Velocity = Vector3.zero
			HumanoidRootPart.Anchored = false

			return
		end
	end
end

local t3 = {
	lastTPTime = 0
}

t5.RLGLBox = t4.RLGL:Section({
	Opened = true,
	Title = "| Red Light Green Light",
	Icon = "hand"
})
t5.RLGLBox:Button({
	Title = "TP To End",
	Callback = function()
		if tick() - t3.lastTPTime < 10 then
			v40(" Cooldown", "Please wait " .. math.ceil(10 - (tick() - t3.lastTPTime)) .. "s before teleporting again.")

			return
		end

		if v37("RedLightGreenLight") then
			v56(CFrame.new(-45, 1025, 137))
			t3.lastTPTime = tick()
		else
			v40(nil, "Red Light Green Light is not currently running.")
		end
	end
})
t5.RLGLBox:Button({
	Title = "TP To Start",
	Callback = function()
		if tick() - t3.lastTPTime < 10 then
			v40(" Cooldown", "Please wait " .. math.ceil(10 - (tick() - t3.lastTPTime)) .. "s before teleporting again.")

			return
		end

		if v37("RedLightGreenLight") then
			v56(CFrame.new(-49, 1023, -540))
			t3.lastTPTime = tick()
		else
			v40(nil, "Red Light Green Light is not currently running.")
		end
	end
})
t5.RLGLBox:Button({
	Title = "Remove Injury",
	Callback = function()
		if not v37("RedLightGreenLight") then
			v40(nil, "Red Light Green Light is not currently running.")

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
				local v69 = Torso:FindFirstChild(v)

				if v69 and v69:IsA("Motor6D") and not v69.Part0 then
					v69.Part0 = Torso
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
			local v74 = Character:FindFirstChild(v)

			if v74 then
				v74:Destroy()
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
t5.RLGLBox:Button({
	Title = "Anti Crawl",
	Callback = function()
		if v37("RedLightGreenLight") then
			v40(nil, "Anti Crawl Enabled")
			task.spawn(function()
				while v37("RedLightGreenLight") do
					local Character = LocalPlayer.Character

					if Character and Character:FindFirstChild("Crawling") then
						Character.Crawling:Destroy()
					end

					task.wait(0.25)
				end
			end)

			return
		end

		v40(nil, "Red Light Green Light is not currently running.")
	end
})

local function v79(p11)
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
local function v83(p12, p13, p14)
	local v84 = math.min(p13.X, p14.X)
	local v85 = math.max(p13.X, p14.X)
	local v86 = math.min(p13.Z, p14.Z)
	local v87 = math.max(p13.Z, p14.Z)

	return p12.X >= v84 and p12.X <= v85 and p12.Z >= v86 and p12.Z <= v87
end
local function v88()
	local Character = LocalPlayer.Character

	if Character then
		if Character:FindFirstChild("HumanoidRootPart") then
			local Position = Character.HumanoidRootPart.Position
			local v91 = v83(Position, Vector3.new(-216, 0, 83), Vector3.new(103, 0, 168))
			local v92 = v83(Position, Vector3.new(103, 0, 168), Vector3.new(116, 0, 82))
			local v93 = v83(Position, Vector3.new(115, 0, -578), Vector3.new(-215, 0, -516))

			return v91 or v92 or v93
		end
	end

	return false
end

local t1 = {
	autoStopEnabled = false
}
local t2 = {
	freezeThread = nil
}
local u94 = false

t5.RLGLBox:Toggle({
	Title = "Freeze On Red Light",
	Default = false,
	Callback = function(p15)
		t1.autoStopEnabled = p15

		if t1.autoStopEnabled then
			if t2.freezeThread then
				return
			end

			t2.freezeThread = true
			task.spawn(function()
				while t2.freezeThread and t1.autoStopEnabled do
					if v37("RedLightGreenLight") then
						local v95 = false
						local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")

						if PlayerGui then
							local ImpactFrames = PlayerGui:FindFirstChild("ImpactFrames")

							if ImpactFrames then
								local TrafficLightEmpty = ImpactFrames:FindFirstChild("TrafficLightEmpty")

								if TrafficLightEmpty and TrafficLightEmpty.Image == "rbxassetid://88400194373338" then
									v95 = true
								end
							end
						end

						if v95 then
							if v88() then
								if u94 then
									v79(true)
									u94 = false
								end

								task.wait(0.1)

								continue
							end

							if not u94 then
								v79(false)
								u94 = true
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
						elseif u94 then
							v79(true)
							u94 = false
						end
					elseif u94 then
						v79(true)
						u94 = false
					end

					task.wait(0.1)
				end

				t2.freezeThread = nil

				if u94 then
					v79(true)
					u94 = false
				end
			end)
		end
	end
})
t1.autoTPEndEnabled = false
t2.autoTPEndThread = nil
t5.RLGLBox:Toggle({
	Title = "Auto TP End Last Second",
	Default = false,
	Callback = function(p16)
		t1.autoTPEndEnabled = p16

		if t1.autoTPEndEnabled then
			if t2.autoTPEndThread then
				return
			end

			t2.autoTPEndThread = true
			task.spawn(function()
				while t2.autoTPEndThread and t1.autoTPEndEnabled do
					if v37("RedLightGreenLight") then
						local attribute = workspace:GetAttribute("CurrentGameTime")

						if attribute and attribute <= 3 then
							if attribute > 0 then
								local v103 = true
								local Character = LocalPlayer.Character
								local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

								if HumanoidRootPart then
									local Position = HumanoidRootPart.Position

									local function v107(p17, p18, p19)
										return p17.X >= math.min(p18.X, p19.X) and p17.X <= math.max(p18.X, p19.X) and p17.Z >= math.min(p18.Z, p19.Z) and p17.Z <= math.max(p18.Z, p19.Z)
									end

									local vector3 = Vector3.new(115, 1023, 84)
									local vector32 = Vector3.new(103, 1023, 168)
									local vector33 = Vector3.new(103, 1023, 168)
									local vector34 = Vector3.new(-216, 1023, 83)

									if v107(Position, vector3, vector32) then
										if math.abs(Position.Y - 1023) < 100 then
											v103 = false
										end
									elseif v107(Position, vector33, vector34) then
										if math.abs(Position.Y - 1023) < 100 then
											v103 = false
										end

										if v103 then
											v40(nil, "Last 3 Second Left Teleporting End")
											v56(CFrame.new(-45, 1025, 137))
										end

										task.wait(5)
										task.wait(1)

										continue
									end
								end

								if v103 then
									v40(nil, "Last 3 Second Left Teleporting End")
									v56(CFrame.new(-45, 1025, 137))
								end

								task.wait(5)
								task.wait(1)

								continue
							end
						end
					end

					task.wait(1)
				end

				t2.autoTPEndThread = nil
			end)
		end
	end
})
t1.espRolesEnabled = false

local t7 = {}
local t8 = {}

local function v114(p20)
	if not t1.espRolesEnabled then
		return
	end

	if p20 == LocalPlayer then
		return
	end

	local Character = p20.Character

	if not Character then
		return
	end

	if t7[p20] then
		t7[p20]:Destroy()
		t7[p20] = nil
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
	t7[p20] = Highlight
end
local function v119()
	for _, v in pairs(t8) do
		if v and v.Connected then
			v:Disconnect()
		end
	end

	table.clear(t8)

	for _, v in pairs(t7) do
		if v and v.Parent then
			v:Destroy()
		end
	end

	table.clear(t7)
end
local function v124(p21)
	if p21 == LocalPlayer then
		return
	end

	table.insert(t8, p21:GetAttributeChangedSignal("IsHider"):Connect(function()
		if t1.espRolesEnabled then
			v114(p21)
		end
	end))
	table.insert(t8, p21:GetAttributeChangedSignal("IsHunter"):Connect(function()
		if t1.espRolesEnabled then
			v114(p21)
		end
	end))
	table.insert(t8, p21.CharacterAdded:Connect(function()
		task.wait(0.5)

		if t1.espRolesEnabled then
			v114(p21)
		end
	end))
	v114(p21)
end

t5.HSTOWBox = t4.HSTOW:Section({
	Opened = true,
	Title = "| Hide And Seek",
	Icon = "search"
})
t5.HSTOWBox:Button({
	Title = "Auto Escape",
	Callback = function()
		if not v37("HideAndSeek") then
			v40(nil, "Hide And Seek is not active")

			return
		end

		local Character = LocalPlayer.Character

		if Character and Character:FindFirstChild("HumanoidRootPart") then
			v56(CFrame.new(199, 54, -88))
			v40(" Escaped", "Teleported to safe zone")
		end
	end
})
t1.autoGetKeysEnabled = false
t2.autoGetKeysThread = nil
t5.HSTOWBox:Toggle({
	Title = "Auto Get Missing Keys",
	Default = false,
	Callback = function(p22)
		t1.autoGetKeysEnabled = p22

		if t1.autoGetKeysEnabled then
			if t2.autoGetKeysThread then
				return
			end

			t2.autoGetKeysThread = true
			task.spawn(function()
				local t9 = {
					"Circle",
					"Square",
					"Triangle"
				}

				while t1.autoGetKeysEnabled and t2.autoGetKeysThread do
					if v37("HideAndSeek") then
						local CurrentKeys = LocalPlayer:FindFirstChild("CurrentKeys")

						if CurrentKeys then
							local t10 = {}

							for _, child in ipairs(CurrentKeys:GetChildren()) do
								t10[child.Name] = true
							end

							local t11 = {}

							for _, v in ipairs(t9) do
								if not t10[v] then
									t11[v] = true
								end
							end

							local Effects = workspace:FindFirstChild("Effects")

							if Effects then
								for _, child in ipairs(Effects:GetChildren()) do
									if string.sub(child.Name, 1, 10) == "DroppedKey" and t11[string.sub(child.Name, 11)] then
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

				t2.autoGetKeysThread = nil
			end)
		else
			t2.autoGetKeysThread = nil
		end
	end
})
t1.tugOfWarAutoPullEnabled = false
t1.tugOfWarPullHelperEnabled = false
t2.tugOfWarAutoPullThread = nil

local u141 = false

local function v142(p23, p24)
	return math.abs((p23 - p24 + 180) % 360 - 180)
end
local function v143()
	v43("space")
end
local function v144()
	if u141 then
		return
	end

	u141 = true

	local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")

	if not PlayerGui then
		u141 = false

		return
	end

	local TugOfWarUIV2 = PlayerGui:WaitForChild("TugOfWarUIV2", 5)

	if not TugOfWarUIV2 then
		u141 = false

		return
	end

	local TugofWarRemake = TugOfWarUIV2:FindFirstChild("TugofWarRemake")

	if not TugofWarRemake then
		u141 = false

		return
	end

	local CircleBase = TugofWarRemake:FindFirstChild("CircleBase")

	if not CircleBase then
		u141 = false

		return
	end

	while t1.tugOfWarAutoPullEnabled or t1.tugOfWarPullHelperEnabled do
		local attribute

		pcall(function()
			attribute = LocalPlayer:GetAttribute("TugOfWarPhase")
		end)

		if attribute == "QTE" then
			break
		end

		task.wait(0.1)
	end

	if not (t1.tugOfWarAutoPullEnabled or t1.tugOfWarPullHelperEnabled) then
		u141 = false

		return
	end

	if not CircleBase.Visible then
		local now = tick()

		while (t1.tugOfWarAutoPullEnabled or t1.tugOfWarPullHelperEnabled) and not CircleBase.Visible and tick() - now < 10 do
			task.wait(0.1)
		end
	end

	if not (t1.tugOfWarAutoPullEnabled or t1.tugOfWarPullHelperEnabled) then
		u141 = false

		return
	end

	local Arrow = CircleBase:FindFirstChild("Arrow")

	if not Arrow then
		u141 = false

		return
	end

	local Medium = CircleBase:FindFirstChild("Medium")

	if not Medium then
		Medium = CircleBase:FindFirstChild("Small") or CircleBase:FindFirstChild("Large")
	end

	if not Medium then
		u141 = false

		return
	end

	local n3

	if (LocalPlayer:GetAttribute("TugOfWarStrategy") or "Standard") == "Stall" then
		n3 = 14
	else
		n3 = 18.2
	end

	t3.lastPressTime = 0

	local u154 = false
	local connection
	local connection2

	local function v157()
		if connection then
			connection:Disconnect()
			connection = nil
		end

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		u141 = false
	end

	connection2 = LocalPlayer.ChildAdded:Connect(function(child)
		if child.Name == "QTEOver" then
			v157()
		end
	end)
	connection = game:GetService("RunService").RenderStepped:Connect(function()
		if not Arrow or not Arrow.Parent or not CircleBase.Visible then
			v157()

			return
		end

		if not (t1.tugOfWarAutoPullEnabled or t1.tugOfWarPullHelperEnabled) then
			v157()

			return
		end

		if not v37("TugOfWar") then
			v157()

			return
		end

		local rotation = Arrow.Rotation % 360
		local v159 = v142(Medium.Rotation % 360, rotation) <= n3

		if t1.tugOfWarPullHelperEnabled then
			Medium.Rotation = rotation
			v159 = true
		end

		if t1.tugOfWarAutoPullEnabled then
			if not t1.tugOfWarPullHelperEnabled then
				if v159 and not u154 and tick() - t3.lastPressTime > 0.12 then
					v143()
					t3.lastPressTime = tick()
				end
			elseif tick() - t3.lastPressTime > 0.25 then
				v143()
				t3.lastPressTime = tick()
			end
		end

		u154 = v159
	end)
	task.spawn(function()
		while u141 do
			if t1.tugOfWarAutoPullEnabled then
				if v37("TugOfWar") then
					task.wait(1)

					continue
				end
			elseif t1.tugOfWarPullHelperEnabled then
				if not v37("TugOfWar") then
					break
				end

				task.wait(1)

				continue
			end

			break
		end

		v157()
	end)
end

t1.killHidersEnabled = false
t2.killThread = nil

local function v160()
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
local function v166()
	local Character = LocalPlayer.Character

	if not Character or not Character:FindFirstChild("HumanoidRootPart") then
		return nil
	end

	local Position = Character.HumanoidRootPart.Position
	local v169
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
						v169 = player
					end
				end
			end
		end
	end

	return v169
end

t5.HSTOWBox:Toggle({
	Title = "Auto Kill Hiders",
	Default = false,
	Callback = function(p25)
		t1.killHidersEnabled = p25

		if t1.killHidersEnabled then
			if not LocalPlayer:GetAttribute("IsHunter") then
				v40(" Not Hunter", "You are not a Hunter.")
				t1.killHidersEnabled = false

				return
			end

			t2.killThread = nil
			task.wait(0.2)
			t2.killThread = true
			task.spawn(function()
				local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

				HumanoidRootPart = HumanoidRootPart and LocalPlayer.Character.HumanoidRootPart.CFrame

				local v178 = false

				while t2.killThread and t1.killHidersEnabled do
					if v37("HideAndSeek") then
						if not LocalPlayer:GetAttribute("IsHunter") then
							t1.killHidersEnabled = false
							t2.killThread = nil

							break
						end

						local v179 = v166()

						if v179 then
							v178 = false

							local Character = v179.Character
							local Humanoid = Character and Character:FindFirstChild("Humanoid")
							local HumanoidRootPart2 = Character and Character:FindFirstChild("HumanoidRootPart")

							while t2.killThread and t1.killHidersEnabled and Character and Humanoid and HumanoidRootPart2 and Humanoid.Health > 0 and v37("HideAndSeek") do
								local Character2 = LocalPlayer.Character
								local HumanoidRootPart3 = Character2 and Character2:FindFirstChild("HumanoidRootPart")
								local Humanoid2 = Character2 and Character2:FindFirstChild("Humanoid")

								if not HumanoidRootPart3 or not Humanoid2 then
									break
								end

								local n4 = 0

								pcall(function()
									n4 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 1000
								end)
								HumanoidRootPart3.CFrame = (HumanoidRootPart2.CFrame + HumanoidRootPart2.AssemblyLinearVelocity * n4) * CFrame.new(0, 0, 3)
								HumanoidRootPart3.AssemblyLinearVelocity = Vector3.new(0, 0, 0)

								local v187 = v160()

								if v187 then
									if v187.Parent ~= Character2 then
										v187.Parent = Character2
									end

									pcall(function()
										v187:Activate()
									end)
								end

								task.wait(0.05)
								Character = v179.Character
								Humanoid = Character and Character:FindFirstChild("Humanoid")
								HumanoidRootPart2 = Character and Character:FindFirstChild("HumanoidRootPart")
							end
						else
							if HumanoidRootPart and not v178 then
								local Character = LocalPlayer.Character
								local HumanoidRootPart2 = Character and Character:FindFirstChild("HumanoidRootPart")

								if HumanoidRootPart2 then
									HumanoidRootPart2.CFrame = HumanoidRootPart
									v178 = true
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

				t2.killThread = nil
			end)
		else
			t2.killThread = nil
		end
	end
})
t1.infiniteStaminaEnabled = false
t2.infiniteStaminaThread = nil
t5.HSTOWBox:Toggle({
	Title = "Infinite Stamina",
	Default = false,
	Callback = function(p26)
		t1.infiniteStaminaEnabled = p26

		if t1.infiniteStaminaEnabled then
			if t2.infiniteStaminaThread then
				return
			end

			t2.infiniteStaminaThread = game:GetService("RunService").RenderStepped:Connect(function()
				if v37("HideAndSeek") then
					local Character = LocalPlayer.Character

					if Character then
						local StaminaVal = Character:FindFirstChild("StaminaVal")

						if StaminaVal and StaminaVal:IsA("NumberValue") then
							StaminaVal.Value = 100
						end
					end
				end
			end)
		elseif t2.infiniteStaminaThread then
			t2.infiniteStaminaThread:Disconnect()
			t2.infiniteStaminaThread = nil
		end
	end
})
t1.balloonESPEnabled = false
t1.autoPopBalloonsEnabled = false

local t12 = {}
local t13 = {}

local function v194()
	if v37("RedLightGreenLight") then
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
local function v198(p27)
	if v194() then
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
	local n5 = 0

	while Parent2 and Parent2.Parent and n5 < 2 and not v194() do
		task.wait(0.1)
		n5 += 0.1
	end

	local Character2 = LocalPlayer.Character
	local HumanoidRootPart2 = Character2 and Character2:FindFirstChild("HumanoidRootPart")

	if HumanoidRootPart2 then
		HumanoidRootPart2.CFrame = CFrame_
	end
end
local function v207(p28)
	local Parent = p28.Parent

	if not Parent then
		return
	end

	local Parent2 = Parent.Parent

	if not Parent2 then
		return
	end

	if t13[p28] then
		return
	end

	local Highlight = Instance.new("Highlight")

	Highlight.Name = "BalloonHighlight"
	Highlight.FillColor = Color3.fromRGB(255, 105, 180)
	Highlight.FillTransparency = 0.5
	Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
	Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	Highlight.Parent = Parent2
	t13[p28] = Highlight
end
local function v211(p29)
	if t13[p29] then
		t13[p29]:Destroy()
		t13[p29] = nil
	end
end
local function v212(descendant)
	if descendant:IsA("ProximityPrompt") and descendant.Name == "BalloonProximityPrompt" then
		t12[descendant] = true

		if t1.balloonESPEnabled then
			v207(descendant)
		end
	end
end

for _, descendant in pairs(workspace:GetDescendants()) do
	v212(descendant)
end

workspace.DescendantAdded:Connect(v212)
workspace.DescendantRemoving:Connect(function(descendant)
	if t12[descendant] then
		t12[descendant] = nil
		v211(descendant)
	end
end)
task.spawn(function()
	while true do
		task.wait(0.5)

		if t1.autoPopBalloonsEnabled then
			if not v37("HideAndSeek") then
				continue
			end

			for k in pairs(t12) do
				if v194() then
					break
				end

				if k then
					if k.Parent then
						if k.Enabled then
							local Character = LocalPlayer.Character
							local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
							local Parent = k.Parent

							if not HumanoidRootPart then
								continue
							end

							if not Parent then
								continue
							end

							if not (math.abs(HumanoidRootPart.Position.Y - Parent.Position.Y) <= 20) then
								continue
							end

							v198(k)

							continue
						end
					end
				end

				if k and k.Parent then
					continue
				end

				t12[k] = nil
				v211(k)
			end
		end
	end
end)
t5.GameToolsBox = t4.Tools:Section({
	Opened = true,
	Title = "| Game Tools",
	Icon = "hammer"
})
t5.GameToolsBox:Button({
	Title = "Won Farm",
	Callback = function()
		if game.PlaceId == 99567941238278 then
			local v219
			local ok, result = pcall(function()
				return game:HttpGet("https://platinstudio.xyz/raw/AutoFarm")
			end)

			if not ok or not result or result == "" or result:match("404: Not Found") then
				local ok2, result2 = pcall(function()
					return game:HttpGet("https://github.com/platinww/UwU/raw/refs/heads/main/WonFarm.lua")
				end)

				if ok2 and result2 and not result2:match("404: Not Found") then
					v219 = result2
				end
			else
				v219 = result
			end

			if v219 then
				loadstring(v219)()
			else
				v40(" Error", "Failed to fetch Won Farm script from all sources.")
			end
		else
			v40(" Error", "This Feature Only Workable On Lobby Regular Server")
		end
	end
})
t5.GameToolsBox:Toggle({
	Title = "Balloon ESP",
	Default = false,
	Callback = function(p30)
		t1.balloonESPEnabled = p30

		if t1.balloonESPEnabled then
			for k in pairs(t12) do
				if k and k.Parent then
					v207(k)
				end
			end
		else
			for k in pairs(t12) do
				v211(k)
			end
		end
	end
})
t5.HSTOWBox:Toggle({
	Title = "Balloon Pop Farm",
	Default = false,
	Callback = function(p31)
		t1.autoPopBalloonsEnabled = p31
	end
})
t1.hideAndSeekAutoQTEEnabled = false
t2.hideAndSeekQTEThread = nil
t5.HSTOWBox:Toggle({
	Title = "Auto QTE Event",
	Default = false,
	Callback = function(p32)
		t1.hideAndSeekAutoQTEEnabled = p32

		if t1.hideAndSeekAutoQTEEnabled then
			if not t2.hideAndSeekQTEThread then
				t2.hideAndSeekQTEThread = task.spawn(function()
					local t14 = {}

					while t1.hideAndSeekAutoQTEEnabled do
						if v37("HideAndSeek") then
							local v227 = v46()

							if v227 then
								if v227.ActiveButtons then
									for k, activeButton in pairs(v227.ActiveButtons) do
										if not t14[k] and activeButton then
											t14[k] = true

											if t1.hideAndSeekAutoQTEEnabled and v37("HideAndSeek") and v227.ActiveButtons and v227.ActiveButtons[k] then
												pcall(function()
													v227.Pressed(false, v227.ActiveButtons[k])
												end)
											end
										end
									end

									for k in pairs(t14) do
										if not v227.ActiveButtons[k] then
											t14[k] = nil
										end
									end
								end
							end
						else
							table.clear(t14)
						end

						task.wait()
					end

					t2.hideAndSeekQTEThread = nil
				end)
			end
		end
	end
})
t5.HSTOWBox:Toggle({
	Title = "Anti Spike",
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

				local function v233(p34)
					if not p34 or not p34.Parent or p34.Name == "SafeSpikePlatform" then
						return
					end

					local v234 = string.lower(p34.Name)

					if string.find(v234, "spike") or string.find(v234, "kill") or string.find(v234, "trap") or string.find(v234, "hazard") then
						if _G.CreatedSpikePlatforms[p34] then
							return
						end

						local function v235(p35, p36)
							local Part = Instance.new("Part")

							Part.Name = "SafeSpikePlatform"
							Part.Size = Vector3.new(p36.X + 1, 0.5, p36.Z + 1)
							Part.CFrame = p35 * CFrame.new(0, p36.Y / 2 + 2.5, 0)
							Part.Anchored = true
							Part.CanCollide = true
							Part.CanTouch = false
							Part.Transparency = 1
							Part.Material = Enum.Material.SmoothPlastic
							Part.Parent = workspace
							_G.CreatedSpikePlatforms[p34] = Part

							local connection

							connection = p34.Destroying:Connect(function()
								if Part and Part.Parent then
									Part:Destroy()
								end

								_G.CreatedSpikePlatforms[p34] = nil

								if connection then
									connection:Disconnect()
								end
							end)
						end

						if p34:IsA("BasePart") then
							v235(p34.CFrame, p34.Size)
						elseif p34:IsA("Model") then
							local boundingBox, v239 = p34:GetBoundingBox()

							if v239.Magnitude > 0 then
								v235(boundingBox, v239)
							end
						end
					end
				end
				local function v240()
					local HideAndSeekMap = workspace:FindFirstChild("HideAndSeekMap") or workspace
					local n6 = 0

					for _, descendant in ipairs(HideAndSeekMap:GetDescendants()) do
						if not _G.AntiSpikeThread then
							break
						end

						v233(descendant)
						n6 += 1

						if n6 % 500 == 0 then
							task.wait()
						end
					end
				end

				local connection = workspace.DescendantAdded:Connect(function(descendant)
					if _G.AntiSpikeEnabled and v37("HideAndSeek") then
						v233(descendant)
					end
				end)
				local v246 = false

				while _G.AntiSpikeThread do
					local HideAndSeek = _G.AntiSpikeEnabled and v37("HideAndSeek")

					if not HideAndSeek or v246 then
						if not HideAndSeek and v246 and _G.CreatedSpikePlatforms then
							for _, createdSpikePlatform in pairs(_G.CreatedSpikePlatforms) do
								if createdSpikePlatform and createdSpikePlatform.Parent then
									createdSpikePlatform:Destroy()
								end
							end

							table.clear(_G.CreatedSpikePlatforms)
						end
					else
						v240()
					end

					v246 = HideAndSeek
					task.wait(1)
				end

				connection:Disconnect()
			end)
		end
	end
})
t1.autoDodgeEnabled = false

local t15 = {}
local t16 = {
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

local function v252()
	for _, v in ipairs(t15) do
		if v then
			v:Disconnect()
		end
	end

	table.clear(t15)
end

local n7 = 0

local function v256(p37, p38)
	if not t1.autoDodgeEnabled or not v37("HideAndSeek") then
		return
	end

	if tick() - n7 < 0.8 then
		return
	end

	if not p37.Animation then
		return
	end

	local AnimationId = p37.Animation.AnimationId
	local v258 = false

	for _, v in ipairs(t16) do
		if string.find(AnimationId, v, 1, true) then
			v258 = true

			break
		end
	end

	if v258 then
		local Character = LocalPlayer.Character
		local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart and p38 then
			local Magnitude = (HumanoidRootPart.Position - p38.Position).Magnitude
			local Magnitude2 = (HumanoidRootPart.Position + HumanoidRootPart.Velocity * 0.7 - (p38.Position + p38.Velocity * 0.7)).Magnitude
			local v265 = Magnitude - Magnitude2
			local v266 = p38.CFrame.LookVector:Dot((HumanoidRootPart.Position - p38.Position).Unit)
			local n8 = 10
			local Humanoid = p38.Parent and p38.Parent:FindFirstChild("Humanoid")

			if Humanoid then
				local Animator = Humanoid:FindFirstChild("Animator")

				if Animator then
					for _, v in ipairs(Animator:GetPlayingAnimationTracks()) do
						if v.Animation then
							local AnimationId2 = v.Animation.AnimationId

							if string.find(AnimationId2, "76367328603905") then
								n8 = 20

								break
							elseif string.find(AnimationId2, "71214385249268") then
								n8 = 14

								break
							end
						end
					end
				end
			end

			if math.abs(HumanoidRootPart.Position.Y - p38.Position.Y) > 12 then
				return
			end

			local v273 = false

			if Magnitude <= 10 then
				v273 = true
			end

			if not v273 and Magnitude2 <= n8 and v265 > -3 then
				v273 = true
			end

			if not v273 and Magnitude <= 20 and v265 > 2 then
				v273 = true
			end

			if v273 then
				if v265 < -8 and Magnitude > 8 then
					v273 = false
				end

				if Magnitude > 14 and v266 < -0.4 then
					v273 = false
				end
			end

			if not v273 then
				return
			end

			local v274 = true
			local raycastParams = RaycastParams.new()

			raycastParams.FilterDescendantsInstances = {
				Character,
				p38.Parent
			}
			raycastParams.FilterType = Enum.RaycastFilterType.Exclude

			local hit = Workspace:Raycast(HumanoidRootPart.Position, p38.Position - HumanoidRootPart.Position, raycastParams)

			if hit and hit.Instance then
				v274 = false
			end

			if v274 then
				local DODGE = LocalPlayer.Backpack:FindFirstChild("DODGE!")

				DODGE = DODGE or Character:FindFirstChild("DODGE!")

				if DODGE then
					pcall(function()
						local t17 = { DODGE }
						local t18 = {
							buffer.create(0),
							t17
						}

						game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UsedTool"):FireServer(unpack(t18))

						local v280
						local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")

						if PlayerGui then
							for _, descendant in ipairs(PlayerGui:GetDescendants()) do
								if not ((descendant:IsA("TextLabel") or descendant:IsA("TextButton")) and descendant.Text == "DODGE!") then
									continue
								end

								if descendant.Parent then
									for _, child in ipairs(descendant.Parent:GetChildren()) do
										if child ~= descendant and (child:IsA("TextLabel") or child:IsA("TextButton")) then
											local v286 = string.upper(tostring(child.Text))

											if tonumber(v286) or v286 == "E" or v286 == "T" or v286 == "Y" then
												v280 = tostring(child.Text)

												break
											end
										end
									end
								end

								if v280 then
									break
								end
							end
						end

						if not v280 then
							local Backpack = LocalPlayer:FindFirstChild("Backpack")

							if Backpack then
								local n9 = 1

								for _, child in ipairs(Backpack:GetChildren()) do
									if child:IsA("Tool") then
										if child.Name == "DODGE!" then
											v280 = tostring(n9)

											break
										end

										n9 += 1
									end
								end
							end
						end

						if v280 then
							n7 = tick()
							v43(tostring(v280))
							task.wait(0.05)
							v43(tostring(v280))
						end
					end)
				end
			end
		end
	end
end
local function v291(player)
	if player == LocalPlayer then
		return
	end

	local function v292(character)
		task.wait(0.5)

		if not player:GetAttribute("IsHunter") then
			return
		end

		local Humanoid = character:FindFirstChild("Humanoid")
		local HumanoidRootPart = character:FindFirstChild("HumanoidRootPart")

		if Humanoid and HumanoidRootPart then
			local Animator = Humanoid:FindFirstChild("Animator")

			if Animator then
				local connection = Animator.AnimationPlayed:Connect(function(p39)
					v256(p39, HumanoidRootPart)
				end)

				table.insert(t15, connection)
			end
		end
	end

	if player.Character then
		task.spawn(v292, player.Character)
	end

	table.insert(t15, player.CharacterAdded:Connect(v292))
	table.insert(t15, player:GetAttributeChangedSignal("IsHunter"):Connect(function()
		if player.Character then
			task.spawn(v292, player.Character)
		end
	end))
end

t5.HSTOWBox:Toggle({
	Title = "Auto Dodge",
	Default = false,
	Callback = function(p40)
		t1.autoDodgeEnabled = p40
		v252()

		if t1.autoDodgeEnabled then
			for _, player in ipairs(Players:GetPlayers()) do
				v291(player)
			end

			table.insert(t15, Players.PlayerAdded:Connect(v291))
		end
	end
})
t5.HSTOWBox:Toggle({
	Title = "ESP Roles",
	Default = false,
	Callback = function(p41)
		t1.espRolesEnabled = p41

		if t1.espRolesEnabled then
			v119()

			for _, player in pairs(Players:GetPlayers()) do
				v124(player)
			end

			table.insert(t8, Players.PlayerAdded:Connect(function(player)
				task.wait(1)

				if t1.espRolesEnabled then
					v124(player)
				end
			end))
			table.insert(t8, Players.PlayerRemoving:Connect(function(player)
				if t7[player] then
					t7[player]:Destroy()
					t7[player] = nil
				end
			end))
		else
			v119()
		end
	end
})
t1.espExitDoorsEnabled = false
t2.espExitDoorsThread = nil

local t19 = {}

local function v302()
	for _, v in pairs(t19) do
		if v then
			v:Destroy()
		end
	end

	table.clear(t19)
end

t5.HSTOWBox:Toggle({
	Title = "ESP Exit Doors",
	Default = false,
	Callback = function(p42)
		t1.espExitDoorsEnabled = p42

		if t1.espExitDoorsEnabled then
			if t2.espExitDoorsThread then
				return
			end

			t2.espExitDoorsThread = true
			task.spawn(function()
				while t1.espExitDoorsEnabled and t2.espExitDoorsThread do
					if v37("HideAndSeek") then
						local HideAndSeekMap = workspace:FindFirstChild("HideAndSeekMap")
						local NEWFIXEDDOORS = HideAndSeekMap and HideAndSeekMap:FindFirstChild("NEWFIXEDDOORS")
						local Floor1 = NEWFIXEDDOORS and NEWFIXEDDOORS:FindFirstChild("Floor1")
						local EXITDOORS = Floor1 and Floor1:FindFirstChild("EXITDOORS")

						if EXITDOORS then
							for _, child in ipairs(EXITDOORS:GetChildren()) do
								if child.Name == "EXITDOOR" then
									if not child:FindFirstChild("DoorESP") then
										local Highlight = Instance.new("Highlight")

										Highlight.Name = "DoorESP"
										Highlight.FillColor = Color3.new(1, 0, 0)
										Highlight.OutlineColor = Color3.new(1, 0, 0)
										Highlight.FillTransparency = 0.5
										Highlight.OutlineTransparency = 0
										Highlight.Parent = child
										table.insert(t19, Highlight)
									end
								end
							end
						end
					else
						v302()
					end

					task.wait(1.5)
				end

				v302()
				t2.espExitDoorsThread = nil
			end)
		else
			v302()
			t2.espExitDoorsThread = nil
		end
	end
})
t1.espKeysEnabled = false
t2.espKeysThread = nil

local t20 = {}

local function v313()
	for _, v in pairs(t20) do
		if v then
			v:Destroy()
		end
	end

	table.clear(t20)
end

t5.HSTOWBox:Toggle({
	Title = "ESP Keys",
	Default = false,
	Callback = function(p43)
		t1.espKeysEnabled = p43

		if t1.espKeysEnabled then
			if t2.espKeysThread then
				return
			end

			t2.espKeysThread = true
			task.spawn(function()
				while t1.espKeysEnabled and t2.espKeysThread do
					if v37("HideAndSeek") then
						local Effects = workspace:FindFirstChild("Effects")

						if Effects then
							for _, child in ipairs(Effects:GetChildren()) do
								if string.sub(child.Name, 1, 10) == "DroppedKey" and not child:FindFirstChild("KeyESP") then
									local v319 = string.sub(child.Name, 11)
									local text = "Key"

									if v319 ~= "" then
										text = "Key " .. v319
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
									table.insert(t20, BillboardGui)
								end
							end
						end
					else
						v313()
					end

					task.wait(1.5)
				end

				v313()
				t2.espKeysThread = nil
			end)
		else
			v313()
			t2.espKeysThread = nil
		end
	end
})
t5.HSTOWBox:Space()

local function v323()
	if t1.tugOfWarAutoPullEnabled or t1.tugOfWarPullHelperEnabled then
		if t2.tugOfWarAutoPullThread then
			return
		end

		t2.tugOfWarAutoPullThread = true
		task.spawn(function()
			while t1.tugOfWarAutoPullEnabled or t1.tugOfWarPullHelperEnabled do
				if v37("TugOfWar") then
					pcall(v144)
				end

				task.wait(1)
			end

			t2.tugOfWarAutoPullThread = nil
		end)
	else
		t2.tugOfWarAutoPullThread = nil
	end
end

t5.TugBox = t4.HSTOW:Section({
	Opened = true,
	Title = "| Tug Of War",
	Icon = "anchor"
})
t5.TugBox:Toggle({
	Title = "Auto Pull",
	Default = false,
	Callback = function(p44)
		t1.tugOfWarAutoPullEnabled = p44
		v323()
	end
})
t5.TugBox:Toggle({
	Title = "Pull Helper",
	Default = false,
	Callback = function(p45)
		t1.tugOfWarPullHelperEnabled = p45
		v323()
	end
})
t1.autoQTEEnabled = false

local thread

t5.MingleBox = t4.Mingle:Section({
	Opened = true,
	Title = "| Mingle",
	Icon = "users"
})

local connection

t5.MingleBox:Toggle({
	Title = "Noclip",
	Default = false,
	Callback = function(p46)
		if connection then
			connection:Disconnect()
			connection = nil
		end

		if p46 then
			connection = RunService.Stepped:Connect(function()
				if not v37("Mingle") then
					return
				end

				local Character = LocalPlayer.Character

				if Character then
					for _, descendant in ipairs(Character:GetDescendants()) do
						if descendant:IsA("BasePart") then
							descendant.CanCollide = false
						end
					end
				end
			end)
		else
			local Character = LocalPlayer.Character

			if Character then
				for _, descendant in ipairs(Character:GetDescendants()) do
					if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" then
						descendant.CanCollide = true
					end
				end
			end
		end
	end
})
t5.MingleBox:Toggle({
	Title = "Auto QTE Event",
	Default = false,
	Callback = function(p47)
		t1.autoQTEEnabled = p47

		if t1.autoQTEEnabled and not thread then
			thread = task.spawn(function()
				local t21 = {}

				while t1.autoQTEEnabled do
					if v37("Mingle") then
						local v333 = v46()

						if v333 and v333.ActiveButtons then
							for k, activeButton in pairs(v333.ActiveButtons) do
								if not t21[k] and activeButton then
									t21[k] = true

									if t1.autoQTEEnabled and v37("Mingle") and v333.ActiveButtons and v333.ActiveButtons[k] then
										pcall(function()
											v333.Pressed(false, v333.ActiveButtons[k])
										end)
									end
								end
							end

							for k in pairs(t21) do
								if not v333.ActiveButtons[k] then
									t21[k] = nil
								end
							end
						end
					else
						table.clear(t21)
					end

					task.wait()
				end

				thread = nil
			end)
		end
	end
})
t1.antiChokeEnabled = false

local t22 = {}

local function v338()
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
		local v343, v344 = string.match(PlayersInRoom.Text, "(%d+)%/(%d+)")

		if v343 and v344 then
			return tonumber(v343) > tonumber(v344)
		end
	end

	return false
end
local function v345(p48)
	for _, v in pairs(t22) do
		if v then
			v:Disconnect()
		end
	end

	table.clear(t22)

	local Humanoid = p48:WaitForChild("Humanoid", 5)

	if not Humanoid then
		return
	end

	local Animator = Humanoid:WaitForChild("Animator", 5)

	if Animator then
		table.insert(t22, Animator.AnimationPlayed:Connect(function(p49)
			if t1.antiChokeEnabled and v37("Mingle") then
				if string.find(p49.Animation and p49.Animation.AnimationId or "", "71318091779666") and v338() then
					local HumanoidRootPart = p48:FindFirstChild("HumanoidRootPart")

					if HumanoidRootPart then
						local CFrame_ = HumanoidRootPart.CFrame
						local u352 = false
						local v353 = false
						local connection2

						connection2 = p49.Stopped:Connect(function()
							u352 = true

							if v353 and HumanoidRootPart then
								HumanoidRootPart.CFrame = CFrame_
								v40(" Auto Kick", "Choke Finished Teleporting Back")
							end

							if connection2 then
								connection2:Disconnect()
							end
						end)

						if not u352 then
							v353 = true
							HumanoidRootPart.CFrame = CFrame.new(199, 54, -88)
							v40(" Grab Teleport", "Teleported away from the grab")
						end
					end
				end
			end
		end))

		return
	end
end

t5.MingleBox:Toggle({
	Title = "Grab Teleport",
	Default = false,
	Callback = function(p50)
		t1.antiChokeEnabled = p50

		if not t1.antiChokeEnabled then
			for _, v in pairs(t22) do
				if v then
					v:Disconnect()
				end
			end

			table.clear(t22)
		elseif LocalPlayer.Character then
			v345(LocalPlayer.Character)
		end
	end
})
LocalPlayer.CharacterAdded:Connect(function(character)
	if t1.antiChokeEnabled then
		v345(character)
	end
end)
t1.mingleAntiSlowEnabled = false

local connection2

t5.MingleBox:Toggle({
	Title = "Anti Slow",
	Default = false,
	Callback = function(p51)
		t1.mingleAntiSlowEnabled = p51

		if t1.mingleAntiSlowEnabled then
			if connection2 then
				return
			end

			local t23 = {
				"Freeze",
				"Slowed",
				"Action",
				"LightAction",
				"NoAttack"
			}
			local t24 = {
				"Stun",
				"Freeze",
				"Slowed",
				"Action",
				"Ragdoll"
			}

			connection2 = game:GetService("RunService").Heartbeat:Connect(function()
				if not v37("Mingle") then
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

				for _, v in ipairs(t23) do
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

				for _, v in ipairs(t24) do
					local v373 = Character:FindFirstChild(v)

					if v373 then
						v373:Destroy()
					end
				end
			end)
		elseif connection2 then
			connection2:Disconnect()
			connection2 = nil
		end
	end
})
t5.MingleBox:Toggle({
	Title = "LG Power Hold",
	Default = false,
	Callback = function(p52)
		if p52 then
			local Players2 = game:GetService("Players")
			local RunService_ = game:GetService("RunService")
			local TweenService = game:GetService("TweenService")
			local Debris = game:GetService("Debris")
			local LocalPlayer2 = Players2.LocalPlayer

			if _G.LG_PowerHold_Cleanup then
				pcall(function()
					_G.LG_PowerHold_Cleanup()
				end)
				_G.LG_PowerHold_Cleanup = nil
			end

			local Animation = Instance.new("Animation")

			Animation.AnimationId = "rbxassetid://85743982894847"

			local Animation2 = Instance.new("Animation")

			Animation2.AnimationId = "rbxassetid://134716595236712"

			local Animation3 = Instance.new("Animation")

			Animation3.AnimationId = "rbxassetid://82142761681917"

			local LightningGodGrab

			pcall(function()
				LightningGodGrab = game:GetService("ReplicatedStorage").Effects.SetupParts.CustomEffectsFolders.LightningGodGrab
			end)

			local t25 = {}
			local t26 = {}
			local connection3
			local u386 = false
			local u387
			local t27 = {}
			local connection4
			local connection5

			local function v391()
				for _, v in pairs(t25) do
					pcall(function()
						if v then
							if v.Parent then
								v:Destroy()
							end
						end
					end)
				end

				t25 = {}
				t27 = {}
			end
			local function v394()
				if not u386 then
					return
				end

				u386 = false

				for _, v in pairs(t26) do
					pcall(function()
						v:Stop(0.2)
					end)
				end

				t26 = {}

				if connection3 then
					connection3:Disconnect()
					connection3 = nil
				end

				v391()

				local HumanoidRootPart = LocalPlayer2.Character and LocalPlayer2.Character:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart then
					local Sound = Instance.new("Sound")

					Sound.SoundId = "rbxassetid://221711200"
					Sound.Volume = 3
					Sound.Parent = HumanoidRootPart
					Sound:Play()
					Debris:AddItem(Sound, 3)
				end

				if u387 then
					local HumanoidRootPart2 = u387:FindFirstChild("HumanoidRootPart")

					if HumanoidRootPart2 then
						HumanoidRootPart2.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
					end
				end

				u387 = nil
			end

			_G.LG_PowerHold_Cleanup = function()
				if connection4 then
					connection4:Disconnect()
					connection4 = nil
				end

				if connection5 then
					connection5:Disconnect()
					connection5 = nil
				end

				if u386 then
					u386 = false

					if connection3 then
						connection3:Disconnect()
					end

					for _, v in pairs(t26) do
						pcall(function()
							v:Stop(0)
						end)
					end

					v391()
				end

				local Character = LocalPlayer2.Character

				if Character then
					local Humanoid = Character:FindFirstChild("Humanoid")
					local Animator = Humanoid and Humanoid:FindFirstChild("Animator")

					if Animator then
						for _, v in pairs(Animator:GetPlayingAnimationTracks()) do
							pcall(function()
								v:AdjustWeight(1)
							end)
						end
					end
				end
			end

			local function v407()
				local Character = LocalPlayer2.Character

				if not Character then
					return nil
				end

				local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

				if not HumanoidRootPart then
					return nil
				end

				local u410
				local n10 = 50

				local function v412(p53)
					if p53 and p53 ~= Character then
						local HumanoidRootPart2 = p53:FindFirstChild("HumanoidRootPart")
						local Humanoid = p53:FindFirstChildOfClass("Humanoid")

						if HumanoidRootPart2 and Humanoid and Humanoid.Health > 0 then
							local v415 = false
							local Animator = Humanoid:FindFirstChildOfClass("Animator")

							if Animator then
								for _, v in pairs(Animator:GetPlayingAnimationTracks()) do
									if ((v.Animation and v.Animation.AnimationId or ""):match("%d+") or "") == "111638343378220" then
										v415 = true

										break
									end
								end
							end

							if not v415 then
								local Magnitude = (HumanoidRootPart2.Position - HumanoidRootPart.Position).Magnitude

								if Magnitude < n10 then
									n10 = Magnitude
									u410 = p53
								end
							end
						end
					end
				end

				for _, player in pairs(Players2:GetPlayers()) do
					v412(player.Character)
				end

				local Live = workspace:FindFirstChild("Live") or workspace:FindFirstChild("Characters")

				if Live then
					for _, child in pairs(Live:GetChildren()) do
						v412(child)
					end
				else
					for _, child in pairs(workspace:GetChildren()) do
						if child:IsA("Model") and child:FindFirstChildOfClass("Humanoid") then
							v412(child)
						end
					end
				end

				return u410
			end
			local function v427(p54, p55)
				if not LightningGodGrab then
					return
				end

				local LeftArm = p54:FindFirstChild("Left Arm")
				local Head = p55:FindFirstChild("Head")
				local t28 = {}

				for _, v in pairs({
					"Torso",
					"Head",
					"Right Arm",
					"Left Arm",
					"Left Leg",
					"Right Leg"
				}) do
					local v433 = p55:FindFirstChild(v)

					if v433 then
						table.insert(t28, v433)
					end
				end

				if LeftArm then
					local Sound = Instance.new("Sound")

					Sound.SoundId = "rbxassetid://107968065093924"
					Sound.Volume = 2
					Sound.Parent = LeftArm
					Sound:Play()
					table.insert(t25, Sound)
					t27[Sound] = true
				end

				task.delay(0.17, function()
					if not u386 then
						return
					end

					local Lighting = LightningGodGrab:FindFirstChild("Lighting")

					if Lighting and Head then
						local clone = Lighting:Clone()

						clone.Parent = Head
						clone.Brightness = 45
						clone.Enabled = true
						table.insert(t25, clone)
						Debris:AddItem(clone, 1.97)
						TweenService:Create(clone, TweenInfo.new(0.08), {
							Brightness = 2
						}):Play()
						task.delay(1.71, function()
							if clone and clone.Parent then
								clone.Brightness = 45
								TweenService:Create(clone, TweenInfo.new(0.12), {
									Brightness = 2
								}):Play()
							end
						end)
					end

					local RightArm = LightningGodGrab:FindFirstChild("Right Arm")

					if RightArm and LeftArm then
						local BurstEmit = RightArm:FindFirstChild("BurstEmit")

						if BurstEmit then
							local clone = BurstEmit:Clone()

							clone.Parent = LeftArm
							clone.Enabled = true
							table.insert(t25, clone)
							Debris:AddItem(clone, 0.5)
						end
					end
				end)
				task.delay(0.22, function()
					if not u386 then
						return
					end

					for _, v in pairs(t28) do
						for i = 1, 3 do
							local v443 = LightningGodGrab:FindFirstChild("ToonLightning" .. i)

							if v443 then
								local clone = v443:Clone()

								clone.Parent = v
								clone.Enabled = true
								table.insert(t25, clone)
								Debris:AddItem(clone, 2.22)
								task.delay(1.82, function()
									if clone and clone.Parent then
										clone.Enabled = false
									end
								end)
							end
						end

						local Glow = LightningGodGrab:FindFirstChild("Glow")

						if Glow then
							local clone = Glow:Clone()

							clone.Parent = v
							clone.Enabled = true
							table.insert(t25, clone)
							Debris:AddItem(clone, 2.22)
							task.delay(1.82, function()
								if clone and clone.Parent then
									clone.Enabled = false
								end
							end)
						end
					end

					local RightArm = LightningGodGrab:FindFirstChild("Right Arm")

					if RightArm and LeftArm then
						for i = 1, 2 do
							local v449 = RightArm:FindFirstChild("ArmLightning" .. i)

							if v449 then
								local clone = v449:Clone()

								clone.Parent = LeftArm
								clone.Enabled = true
								table.insert(t25, clone)
								Debris:AddItem(clone, 2.07)
								task.delay(1.82, function()
									if clone and clone.Parent then
										clone.Enabled = false
									end
								end)
							end
						end
					end
				end)

				for _, v in pairs({
					0.25,
					0.48,
					0.72,
					0.95,
					1.18,
					1.42,
					1.65,
					1.88
				}) do
					task.delay(v, function()
						if not u386 or not p55.Parent then
							return
						end

						local Highlight = Instance.new("Highlight")

						Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
						Highlight.FillTransparency = 0
						Highlight.OutlineTransparency = 1
						Highlight.FillColor = Color3.fromRGB(0, 0, 0)
						Highlight.Parent = p55
						table.insert(t25, Highlight)
						Debris:AddItem(Highlight, 0.09)
						task.spawn(function()
							Highlight.Enabled = true
							Highlight.FillColor = Color3.new(0, 0, 0)
							task.wait(0.03)

							if Highlight.Parent then
								Highlight.FillColor = Color3.new(1, 1, 1)
							end

							task.wait(0.04)

							if Highlight.Parent then
								Highlight.FillColor = Color3.new(0, 0, 0)
							end
						end)
					end)
				end
			end
			local function v454(p56)
				if not p56 then
					return
				end

				for _, descendant in pairs(p56:GetDescendants()) do
					if descendant:IsA("Sound") and descendant.IsPlaying and not t27[descendant] then
						local match = descendant.SoundId:match("%d+") or ""

						if match == "115899725081193" or match == "110658412036715" then
							descendant.Volume = 0
						elseif u386 then
							descendant.Volume = 0
						end
					end
				end
			end
			local function v458()
				if connection4 then
					connection4:Disconnect()
				end

				local Character = LocalPlayer2.Character

				if not Character then
					return
				end

				local Humanoid = Character:WaitForChild("Humanoid", 10)

				if not Humanoid then
					return
				end

				local Animator = Humanoid:WaitForChild("Animator", 10)

				if Animator then
					connection4 = Animator.AnimationPlayed:Connect(function(p57)
						if p57 then
							if p57.Animation then
								local match = (p57.Animation.AnimationId or ""):match("%d+") or ""

								if match == "103062305177426" then
									pcall(function()
										p57:AdjustWeight(0.001)
									end)

									local v463 = Animator:LoadAnimation(Animation)

									v463.Priority = Enum.AnimationPriority.Action4
									v463:Play()
									v463:AdjustSpeed(0.85)

									if not u386 then
										table.insert(t26, v463)
									end

									local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

									if HumanoidRootPart then
										local Sound = Instance.new("Sound")

										Sound.SoundId = "rbxassetid://133186567809675"
										Sound.Volume = 2
										Sound.Parent = HumanoidRootPart
										Sound:Play()
										table.insert(t25, Sound)
										t27[Sound] = true
										Debris:AddItem(Sound, 3)
									end

									task.spawn(function()
										for i = 1, 10 do
											v454(Character)
											task.wait(0.1)
										end
									end)
								elseif match == "71318091779666" then
									pcall(function()
										p57:AdjustWeight(0.001)
									end)
									p57.Stopped:Connect(function()
										if u386 then
											v394()
										end
									end)

									local v467 = v407()

									if not v467 then
										local v468 = Animator:LoadAnimation(Animation2)

										v468.Priority = Enum.AnimationPriority.Action4
										v468.Looped = true
										v468:Play()
										table.insert(t26, v468)

										return
									end

									if u386 then
										v394()
									end

									u386 = true
									u387 = v467

									local v469 = Animator:LoadAnimation(Animation2)

									v469.Priority = Enum.AnimationPriority.Action4
									v469.Looped = true
									v469:Play()
									table.insert(t26, v469)

									local Humanoid2 = v467:FindFirstChildOfClass("Humanoid")
									local Animator2 = Humanoid2 and Humanoid2:FindFirstChildOfClass("Animator")

									if Animator2 then
										local v472 = Animator2:LoadAnimation(Animation3)

										v472.Priority = Enum.AnimationPriority.Action4
										v472.Looped = true
										v472:Play()
										table.insert(t26, v472)
									end

									v427(Character, v467)
									connection3 = RunService_.RenderStepped:Connect(function()
										if not v467.Parent or not Character.Parent then
											v394()

											return
										end

										local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
										local HumanoidRootPart2 = v467:FindFirstChild("HumanoidRootPart") or v467:FindFirstChild("Torso")

										if not HumanoidRootPart or not HumanoidRootPart2 then
											v394()

											return
										end

										for _, v in pairs(Animator:GetPlayingAnimationTracks()) do
											local match2 = (v.Animation and v.Animation.AnimationId or ""):match("%d+") or ""

											if match2 == "103062305177426" or match2 == "71318091779666" then
												pcall(function()
													v:AdjustWeight(0.001)
												end)
											end
										end

										if Animator2 then
											for _, v in pairs(Animator2:GetPlayingAnimationTracks()) do
												if ((v.Animation and v.Animation.AnimationId or ""):match("%d+") or "") ~= "82142761681917" and Enum.AnimationPriority.Action.Value <= v.Priority.Value then
													pcall(function()
														v:AdjustWeight(0.001)
													end)
												end
											end
										end

										v454(Character)
										v454(v467)
										HumanoidRootPart2.CFrame = HumanoidRootPart.CFrame * CFrame.new(0, 1, -3.5) * CFrame.Angles(0, math.pi, 0)
									end)
								end

								return
							end
						end
					end)

					return
				end
			end

			if LocalPlayer2.Character then
				task.spawn(v458)
			end

			connection5 = LocalPlayer2.CharacterAdded:Connect(function()
				u386 = false
				u387 = nil
				t26 = {}
				task.spawn(v458)
			end)
		elseif _G.LG_PowerHold_Cleanup then
			pcall(function()
				_G.LG_PowerHold_Cleanup()
			end)
			_G.LG_PowerHold_Cleanup = nil
		end
	end
})
t1.silentShootEnabled = false
t1.autoShootEnabled = false
t2.autoShootThread = nil

local function v480()
	local Character = LocalPlayer.Character
	local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart then
		return nil, nil
	end

	local v483
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
					v483 = child
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
						v483 = Character2
					end
				end
			end
		end
	end

	return v483, v483 and v483:FindFirstChild("HumanoidRootPart")
end
local function v497()
	local Character = LocalPlayer.Character

	if not Character then
		return nil
	end

	local Tool = Character:FindFirstChildOfClass("Tool")

	if Tool then
		if Tool:FindFirstChild("GunScript") or Tool:FindFirstChild("Client") or Tool.Name == "MP5" or Tool.Name == "Revolver" then
			return Tool
		end
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

t5.RebelBox = t4.Rebel:Section({
	Opened = true,
	Title = "| Rebel",
	Icon = "target"
})

local u503 = false
local u504

t5.RebelBox:Toggle({
	Title = "Silent Shoot",
	Default = false,
	Callback = function(p58)
		t1.silentShootEnabled = p58

		if p58 and not u503 then
			u503 = true
			pcall(function()
				u504 = hookmetamethod(game, "__namecall", function(p59, ...)
					local v505 = getnamecallmethod()
					local t29 = { ... }

					if not checkcaller() and v505 == "FireServer" and t1.silentShootEnabled and tostring(p59) == "FiredGunClient" then
						local v507, v508 = v480()

						if v507 and v508 and type(t29[2]) == "table" then
							t29[2].ClientRayInstance = v508
							t29[2].ClientRayPosition = v508.Position
							t29[2].HitTargets = {
								[v507.Name] = "Torso"
							}
							t29[2].FirePosition = v508.Position + Vector3.new(0, 1, 0)

							return u504(p59, unpack(t29))
						end
					end

					return u504(p59, ...)
				end)
			end)
		end
	end
})
t5.RebelBox:Toggle({
	Title = "Auto Shoot",
	Default = false,
	Callback = function(p60)
		t1.autoShootEnabled = p60

		if t1.autoShootEnabled then
			if t2.autoShootThread then
				return
			end

			t2.autoShootThread = true
			task.spawn(function()
				while t1.autoShootEnabled do
					if not t2.autoShootThread then
						break
					end

					local v509 = v497()

					if v509 then
						local v510, v511 = v480()

						if v510 and v511 then
							local t30 = {
								v509,
								{
									ClientRayNormal = Vector3.new(0, 1, 0),
									FiredGun = true,
									bulletCF = CFrame.new(),
									ClientRayInstance = v511,
									SecondaryHitTargets = {},
									ClientRayPosition = v511.Position,
									HitTargets = {
										[v510.Name] = "Torso"
									},
									bulletSizeC = Vector3.new(0.01, 0.01, 100),
									NoMuzzleFX = false,
									FirePosition = v511.Position + Vector3.new(0, 1, 0)
								}
							}

							pcall(function()
								game:GetService("ReplicatedStorage").Remotes.FiredGunClient:FireServer(unpack(t30))
							end)
						end
					end

					task.wait()
				end

				t2.autoShootThread = nil
			end)
		end
	end
})
t1.noRecoilSpreadEnabled = false
t2.noRecoilSpreadThread = nil
t5.RebelBox:Toggle({
	Title = "No Recoil & Spread",
	Default = false,
	Callback = function(p61)
		t1.noRecoilSpreadEnabled = p61

		if t1.noRecoilSpreadEnabled then
			if t2.noRecoilSpreadThread then
				return
			end

			t2.noRecoilSpreadThread = true
			task.spawn(function()
				while t1.noRecoilSpreadEnabled do
					if not t2.noRecoilSpreadThread then
						break
					end

					if v37("RebelChance") then
						local Character = LocalPlayer.Character

						if Character then
							for _, child in ipairs(Character:GetChildren()) do
								if child:IsA("Tool") then
									local Settings = child:FindFirstChild("GunScript") and child.GunScript:FindFirstChild("Settings")

									if Settings then
										if Settings:IsA("ModuleScript") then
											pcall(function()
												local module = require(Settings)

												if module then
													if type(module) == "table" then
														module.Spread = 0
														module.Recoil = 0
														module.MaxSpread = 0
														module.CameraRecoil = Vector3.new(0, 0, 0)
													end
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

				t2.noRecoilSpreadThread = nil
			end)
		end
	end
})
t1.skyAntiFallEnabled = false
t2.skyAntiFallThread = nil
t5.SkyBox = t4.Sky:Section({
	Opened = true,
	Title = "| Sky Squid Game",
	Icon = "cloud"
})
t5.SkyBox:Toggle({
	Title = "Sky Squid Game Anti Fall",
	Default = false,
	Callback = function(p62)
		t1.skyAntiFallEnabled = p62

		if t1.skyAntiFallEnabled then
			if t2.skyAntiFallThread then
				return
			end

			t2.skyAntiFallThread = true
			task.spawn(function()
				while t2.skyAntiFallThread do
					if not t1.skyAntiFallEnabled then
						break
					end

					if v37("SkySquidGame") or v37("SquidGame") then
						if not workspace:FindFirstChild("SkyAntiFallPlatform") then
							local vector3 = Vector3.new(91, 957, 251)
							local vector32 = Vector3.new(-70, 958, -107)
							local v520 = (vector3 + vector32) / 2
							local v521 = math.abs(vector3.X - vector32.X)
							local v522 = math.abs(vector3.Z - vector32.Z)
							local Part = Instance.new("Part")

							Part.Name = "SkyAntiFallPlatform"
							Part.Size = Vector3.new(v521 + 30, 1, v522 + 30)
							Part.Position = Vector3.new(v520.X, v520.Y + 4, v520.Z)
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

				t2.skyAntiFallThread = nil
			end)
		end
	end
})
t1.fakeHitboxSquidEnabled = false

local t31 = {}
local u527 = false

local function v528(p63)
	if not p63 then
		return
	end

	local Humanoid = p63:WaitForChild("Humanoid", 5)

	if Humanoid then
		local Animator = Humanoid:WaitForChild("Animator", 5)

		if Animator then
			table.insert(t31, Animator.AnimationPlayed:Connect(function(p64)
				if not t1.fakeHitboxSquidEnabled then
					return
				end

				if not v37("SquidGame") then
					return
				end

				local v531 = tostring(p64.Animation.AnimationId)

				if string.find(v531, "116839849594540") or string.find(v531, "96924216250322") or string.find(v531, "123072675259257") then
					if u527 then
						return
					end

					local HumanoidRootPart = p63:FindFirstChild("HumanoidRootPart")

					if not HumanoidRootPart then
						return
					end

					u527 = true
					p63.Archivable = true

					local clone = p63:Clone()

					clone.Name = "Fake_" .. LocalPlayer.Name
					clone.Parent = workspace

					local HumanoidRootPart2 = clone:FindFirstChild("HumanoidRootPart")

					for _, descendant in ipairs(clone:GetDescendants()) do
						if descendant:IsA("Script") or descendant:IsA("LocalScript") then
							descendant:Destroy()
						end
					end

					local function v537(child)
						if child:IsA("BodyVelocity") or child:IsA("LinearVelocity") or child:IsA("VectorForce") or child:IsA("BodyPosition") or child:IsA("AlignPosition") or child:IsA("BodyForce") then
							task.wait()

							if HumanoidRootPart2 then
								child:Clone().Parent = HumanoidRootPart2
							end

							child:Destroy()
						end
					end

					for _, child in ipairs(HumanoidRootPart:GetChildren()) do
						v537(child)
					end

					local connection3 = HumanoidRootPart.ChildAdded:Connect(v537)
					local Humanoid2 = clone:FindFirstChild("Humanoid")
					local v542

					if Humanoid2 then
						v542 = (Humanoid2:FindFirstChild("Animator") or Instance.new("Animator", Humanoid2)):LoadAnimation(p64.Animation)
						v542:Play()
						v542.TimePosition = p64.TimePosition
					end

					local CurrentCamera = workspace.CurrentCamera

					CurrentCamera.CameraSubject = Humanoid2 or clone:FindFirstChild("HumanoidRootPart")

					for _, descendant in ipairs(p63:GetDescendants()) do
						if descendant:IsA("BasePart") or descendant:IsA("Decal") then
							if not descendant:GetAttribute("OrigTrans") then
								descendant:SetAttribute("OrigTrans", descendant.Transparency)
							end

							if descendant.Name ~= "HumanoidRootPart" then
								descendant.Transparency = 1
							end
						elseif descendant:IsA("BillboardGui") or descendant:IsA("SurfaceGui") then
							if descendant:GetAttribute("OrigEnabled") == nil then
								descendant:SetAttribute("OrigEnabled", descendant.Enabled)
							end

							descendant.Enabled = false
						elseif descendant:IsA("TextLabel") or descendant:IsA("ImageLabel") then
							if not descendant:GetAttribute("OrigVis") then
								descendant:SetAttribute("OrigVis", descendant.Visible)
							end

							descendant.Visible = false
						end
					end

					local HumanoidRootPart3
					local huge = math.huge

					for _, player in ipairs(Players:GetPlayers()) do
						if player ~= LocalPlayer and player.Character then
							if player.Character:FindFirstChild("HumanoidRootPart") then
								if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
									local Magnitude = (player.Character.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude

									if Magnitude < huge then
										huge = Magnitude
										HumanoidRootPart3 = player.Character.HumanoidRootPart
									end
								end
							end
						end
					end

					if HumanoidRootPart3 then
						p64:Stop()
						HumanoidRootPart.CFrame = CFrame.lookAt((HumanoidRootPart3.CFrame * CFrame.new(0, 0, 3)).Position, HumanoidRootPart3.Position)
					end

					local function v551()
						if connection3 then
							connection3:Disconnect()
						end

						if clone and clone:FindFirstChild("HumanoidRootPart") and HumanoidRootPart then
							HumanoidRootPart.CFrame = clone.HumanoidRootPart.CFrame
						end

						CurrentCamera.CameraSubject = Humanoid

						for _, descendant in ipairs(p63:GetDescendants()) do
							if (descendant:IsA("BasePart") or descendant:IsA("Decal")) and descendant:GetAttribute("OrigTrans") then
								descendant.Transparency = descendant:GetAttribute("OrigTrans")
							elseif (descendant:IsA("BillboardGui") or descendant:IsA("SurfaceGui")) and descendant:GetAttribute("OrigEnabled") ~= nil then
								descendant.Enabled = descendant:GetAttribute("OrigEnabled")
							elseif (descendant:IsA("TextLabel") or descendant:IsA("ImageLabel")) and descendant:GetAttribute("OrigVis") ~= nil then
								descendant.Visible = descendant:GetAttribute("OrigVis")
							end
						end

						if clone then
							clone:Destroy()
						end

						u527 = false
					end

					local u554 = false

					if v542 then
						local connection4

						connection4 = v542.Stopped:Connect(function()
							if not u554 then
								u554 = true
								v551()
							end

							if connection4 then
								connection4:Disconnect()
							end
						end)
					end

					task.delay(1.5, function()
						if not u554 then
							u554 = true
							v551()
						end
					end)
				end
			end))
		end
	end
end
local function v556()
	for _, v in ipairs(t31) do
		if v then
			v:Disconnect()
		end
	end

	table.clear(t31)
end

t1.skyAutoQTEEnabled = false
t2.skyQTEThread = nil
t1.antiFreezeFightEnabled = false

local connection3

t5.SkyBox:Toggle({
	Title = "Anti Freeze While Fight",
	Default = false,
	Callback = function(p65)
		t1.antiFreezeFightEnabled = p65

		if t1.antiFreezeFightEnabled then
			if connection3 then
				return
			end

			local t32 = {
				"Freeze",
				"Slowed",
				"Action",
				"LightAction",
				"NoAttack"
			}
			local t33 = {
				"Stun",
				"Freeze",
				"Slowed",
				"Action",
				"Ragdoll"
			}

			connection3 = game:GetService("RunService").Heartbeat:Connect(function()
				if not (v37("SkySquidGame") or v37("SquidGame")) then
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

				for _, v in ipairs(t32) do
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

				for _, v in ipairs(t33) do
					local v575 = Character:FindFirstChild(v)

					if v575 then
						v575:Destroy()
					end
				end
			end)
		elseif connection3 then
			connection3:Disconnect()
			connection3 = nil
		end
	end
})
t5.SkyBox:Toggle({
	Title = "Auto QTE Event",
	Default = false,
	Callback = function(p66)
		t1.skyAutoQTEEnabled = p66

		if t1.skyAutoQTEEnabled and not t2.skyQTEThread then
			t2.skyQTEThread = task.spawn(function()
				local t34 = {}

				while t1.skyAutoQTEEnabled do
					if v37("SkySquidGame") or v37("SquidGame") then
						local v577 = v46()

						if v577 and v577.ActiveButtons then
							for k, activeButton in pairs(v577.ActiveButtons) do
								if not t34[k] and activeButton then
									t34[k] = true

									if t1.skyAutoQTEEnabled and (v37("SkySquidGame") or v37("SquidGame")) and v577.ActiveButtons and v577.ActiveButtons[k] then
										pcall(function()
											v577.Pressed(false, v577.ActiveButtons[k])
										end)
									end
								end
							end

							for k in pairs(t34) do
								if not v577.ActiveButtons[k] then
									t34[k] = nil
								end
							end
						end
					else
						table.clear(t34)
					end

					task.wait()
				end

				t2.skyQTEThread = nil
			end)
		end
	end
})
t1.throwPoleAimEnabled = false

local t35 = {}
local u582 = false

local function v583()
	local Character = LocalPlayer.Character
	local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart then
		return nil
	end

	local v586
	local huge = math.huge

	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character then
			local HumanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")
			local Humanoid = player.Character:FindFirstChild("Humanoid")

			if HumanoidRootPart2 and Humanoid and Humanoid.Health > 0 then
				local Magnitude = (HumanoidRootPart2.Position - HumanoidRootPart.Position).Magnitude

				if Magnitude < huge then
					huge = Magnitude
					v586 = HumanoidRootPart2
				end
			end
		end
	end

	return v586
end
local function v593()
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

	local connection4 = Animator.AnimationPlayed:Connect(function(p67)
		if not t1.throwPoleAimEnabled then
			return
		end

		if p67.Animation and p67.Animation.AnimationId and string.find(tostring(p67.Animation.AnimationId), "112950478995075") then
			u582 = true

			local Humanoid2 = Character:FindFirstChild("Humanoid")

			if Humanoid2 then
				Humanoid2.AutoRotate = false
			end

			p67.Stopped:Once(function()
				u582 = false

				local Humanoid3 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")

				if Humanoid3 then
					Humanoid3.AutoRotate = true
				end
			end)
		end
	end)

	table.insert(t35, connection4)
end

t5.SkyBox:Toggle({
	Title = "Throw Pole AIM",
	Default = false,
	Callback = function(p68)
		t1.throwPoleAimEnabled = p68

		if t1.throwPoleAimEnabled then
			v593()

			local connection4 = LocalPlayer.CharacterAdded:Connect(function()
				task.wait(0.5)

				if t1.throwPoleAimEnabled then
					v593()
				end
			end)

			table.insert(t35, connection4)

			local connection5 = game:GetService("RunService").Heartbeat:Connect(function()
				if not t1.throwPoleAimEnabled or not u582 then
					return
				end

				if not (v37("SkySquidGame") or v37("SquidGame")) then
					return
				end

				local Character = LocalPlayer.Character
				local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

				if not HumanoidRootPart then
					return
				end

				local v604 = v583()

				if v604 then
					HumanoidRootPart.CFrame = CFrame.lookAt(HumanoidRootPart.Position, Vector3.new(v604.Position.X, HumanoidRootPart.Position.Y, v604.Position.Z))
				end
			end)

			table.insert(t35, connection5)
		else
			u582 = false

			for _, v in pairs(t35) do
				pcall(function()
					v:Disconnect()
				end)
			end

			table.clear(t35)
		end
	end
})
t5.SkyBox:Space()
t1.squidKillAuraEnabled = false
t2.squidKillAuraThread = nil
t5.SquidGameBox = t4.Sky:Section({
	Opened = true,
	Title = "| Squid Game",
	Icon = "skull"
})
t5.SquidGameBox:Toggle({
	Title = "Kill Aura",
	Default = false,
	Callback = function(p69)
		t1.squidKillAuraEnabled = p69

		if t1.squidKillAuraEnabled then
			if t2.squidKillAuraThread then
				return
			end

			t2.squidKillAuraThread = true
			task.spawn(function()
				local t36 = {
					["96924216250322"] = true,
					["116839849594540"] = true,
					["123072675259257"] = true
				}

				while t2.squidKillAuraThread do
					if not t1.squidKillAuraEnabled then
						break
					end

					if v37("SquidGame") then
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

							local v612
							local n11 = 300
							local ipairs_ = ipairs
							local Players2 = game:GetService("Players")

							for _, player in ipairs_(Players2:GetPlayers()) do
								if player ~= LocalPlayer and player.Character then
									if player.Character:FindFirstChild("HumanoidRootPart") then
										if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
											local Magnitude = (player.Character.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude

											if Magnitude < n11 then
												n11 = Magnitude
												v612 = player
											end
										end
									end
								end
							end

							if v612 and v612.Character then
								local Character2 = v612.Character
								local HumanoidRootPart2 = Character2:FindFirstChild("HumanoidRootPart")
								local Humanoid = Character2:FindFirstChild("Humanoid")

								if HumanoidRootPart2 and Humanoid then
									local v622 = false
									local Animator = Humanoid:FindFirstChildOfClass("Animator")
									local playingAnimationTracks = Animator and Animator:GetPlayingAnimationTracks() or Humanoid:GetPlayingAnimationTracks()

									for _, playingAnimationTrack in ipairs(playingAnimationTracks) do
										if playingAnimationTrack.Animation and playingAnimationTrack.Animation.AnimationId then
											local v627 = string.match(playingAnimationTrack.Animation.AnimationId, "%d+")

											if v627 and t36[v627] then
												if playingAnimationTrack.Length == 0 or playingAnimationTrack.Length - playingAnimationTrack.TimePosition > 0.5 then
													v622 = true

													break
												end
											end
										end
									end

									if v622 then
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

				t2.squidKillAuraThread = nil
			end)
		else
			t2.squidKillAuraThread = nil
		end
	end
})

local u628 = false
local u629 = false
local t37 = {}
local t38 = {}
local thread2
local PhysicsService = game:GetService("PhysicsService")

pcall(function()
	PhysicsService:RegisterCollisionGroup("LocalPlayerOnly")
	PhysicsService:RegisterCollisionGroup("FakeGlass")
	PhysicsService:CollisionGroupSetCollidable("FakeGlass", "Default", false)
	PhysicsService:CollisionGroupSetCollidable("FakeGlass", "LocalPlayerOnly", true)
end)

local function v634(p70)
	if not p70:IsA("Model") or not p70.PrimaryPart then
		return
	end

	local PrimaryPart = p70.PrimaryPart
	local attribute = PrimaryPart:GetAttribute("exploitingisevil")

	if u628 and not t37[p70] then
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

		Highlight.Adornee = p70
		Highlight.Parent = p70
		t37[p70] = Highlight
	end

	if u629 and attribute and not t38[p70] then
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
		t38[p70] = Part
	end
end
local function v639()
	for _, v in pairs(t37) do
		if v then
			if v.Parent then
				v:Destroy()
			end
		end
	end

	table.clear(t37)

	for _, v in pairs(t38) do
		if v and v.Parent then
			v:Destroy()
		end
	end

	table.clear(t38)
end
local function v644()
	if thread2 then
		return
	end

	thread2 = task.spawn(function()
		while u628 or u629 do
			if Workspace:GetAttribute("GLASSBRIDGEOVER") then
				v639()
			end

			local Character = LocalPlayer.Character

			if Character then
				local Humanoid = Character:FindFirstChild("Humanoid")

				if Humanoid then
					if Humanoid.Health <= 0 then
						v639()
					end
				end
			end

			local GlassBridge = Workspace:FindFirstChild("GlassBridge")

			if GlassBridge then
				local GlassHolder = GlassBridge:FindFirstChild("GlassHolder")

				if GlassHolder then
					for _, child in ipairs(GlassHolder:GetChildren()) do
						for _, child2 in ipairs(child:GetChildren()) do
							v634(child2)
						end
					end
				end
			end

			task.wait(2)
		end

		thread2 = nil
	end)
end

t5.MingleGlassBox = t4.MingleGlass:Section({
	Opened = true,
	Title = "| Glass Bridge",
	Icon = "footprints"
})
t5.MingleGlassBox:Toggle({
	Title = "Glass Bridge ESP",
	Default = false,
	Callback = function(p71)
		u628 = p71

		if u628 then
			v644()
		else
			v639()
		end
	end
})

local connection4

t5.MingleGlassBox:Toggle({
	Title = "Fake Safe Glass",
	Default = false,
	Callback = function(p72)
		u629 = p72

		if u629 then
			local function v654(character)
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
				v654(LocalPlayer.Character)
			end

			connection4 = LocalPlayer.CharacterAdded:Connect(v654)
			v644()
		else
			if connection4 then
				connection4:Disconnect()
				connection4 = nil
			end

			v639()
		end
	end
})
t3.lastGlassTPTime = 0
t5.MingleGlassBox:Button({
	Title = "TP To Start",
	Callback = function()
		if tick() - t3.lastGlassTPTime < 10 then
			v40(" Cooldown", "Please wait " .. math.ceil(10 - (tick() - t3.lastGlassTPTime)) .. "s before teleporting again.")

			return
		end

		if v37("GlassBridge") then
			v56(CFrame.new(36, 521, -1533))
			t3.lastGlassTPTime = tick()
		else
			v40(nil, "Glass Bridge is not currently running.")
		end
	end
})
t5.MingleGlassBox:Button({
	Title = "TP To End",
	Callback = function()
		if tick() - t3.lastGlassTPTime < 10 then
			v40(" Cooldown", "Please wait " .. math.ceil(10 - (tick() - t3.lastGlassTPTime)) .. "s before teleporting again.")

			return
		end

		if v37("GlassBridge") then
			v56(CFrame.new(-204, 521, -1536))
			t3.lastGlassTPTime = tick()
		else
			v40(nil, "Glass Bridge is not currently running.")
		end
	end
})
t5.MingleGlassBox:Space()
t3.lastRopeTPTime = 0
t5.JumpBox = t4.MingleGlass:Section({
	Opened = true,
	Title = "| Jump Rope",
	Icon = "activity"
})
t5.JumpBox:Button({
	Title = "Rope TP To Start",
	Callback = function()
		if tick() - t3.lastRopeTPTime < 10 then
			v40(" Cooldown", "Please wait " .. math.ceil(10 - (tick() - t3.lastRopeTPTime)) .. "s")

			return
		end

		if v37("JumpRope") then
			v56(CFrame.new(616, 197, 921))
			t3.lastRopeTPTime = tick()
		else
			v40(nil, "Jump Rope is not running.")
		end
	end
})
t5.JumpBox:Button({
	Title = "Rope TP To End",
	Callback = function()
		if tick() - t3.lastRopeTPTime < 10 then
			v40(" Cooldown", "Please wait " .. math.ceil(10 - (tick() - t3.lastRopeTPTime)) .. "s")

			return
		end

		if v37("JumpRope") then
			v56(CFrame.new(734, 197, 921))
			t3.lastRopeTPTime = tick()
		else
			v40(nil, "Jump Rope is not running.")
		end
	end
})
t5.JumpBox:Button({
	Title = "Delete Rope",
	Callback = function()
		if v37("JumpRope") then
			local Effects = Workspace:FindFirstChild("Effects")

			if Effects then
				local rope = Effects:FindFirstChild("rope")

				if rope then
					rope:Destroy()
					v40(" Success", "Rope deleted")
				else
					v40(" Not Found", "Rope not found in Effects.")
				end
			else
				v40(" Not Found", "Effects folder not found.")
			end
		else
			v40(nil, "Jump Rope is not running.")
		end
	end
})

local u659 = false
local Part

local function v661()
	if not u659 or not v37("JumpRope") then
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

t5.JumpBox:Toggle({
	Title = "Anti Fall",
	Default = false,
	Callback = function(p73)
		u659 = p73
		v661()
	end
})
task.spawn(function()
	while true do
		if u659 then
			v661()
		elseif not u659 and Part then
			Part:Destroy()
			Part = nil
		end

		task.wait(1)
	end
end)
t5.DalgonaBox = t4.Dalgona:Section({
	Opened = true,
	Title = "| Dalgona",
	Icon = "cookie"
})
t5.DalgonaBox:Button({
	Title = "Auto Complete Dalgona",
	Callback = function()
		if v37("Dalgona") then
			task.spawn(function()
				local v662 = LocalPlayer
				local TweenService = game:GetService("TweenService")
				local RunService_ = game:GetService("RunService")
				local UserInputService_ = game:GetService("UserInputService")

				local function createFolder(p74, p75, p76)
					local Folder = Instance.new("Folder")

					Folder.Name = p75
					Folder.Parent = p74

					if p76 then
						task.delay(p76, function()
							if Folder and Folder.Parent then
								Folder:Destroy()
							end
						end)
					end

					return Folder
				end
				local function v668(p77)
					for _, descendant in pairs(p77:GetDescendants()) do
						if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" then
							descendant.Transparency = 1
						end
					end
				end
				local function v671(p78)
					for _, descendant in pairs(p78:GetDescendants()) do
						if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" then
							descendant.Transparency = 0
							descendant.LocalTransparencyModifier = 0
						end
					end

					for _, child in pairs(p78:GetChildren()) do
						if child:IsA("Accessory") then
							local Handle = child:FindFirstChild("Handle")

							if Handle and Handle.Transparency >= 0.99 then
								Handle.Transparency = 0
							end
						end
					end
				end
				local function v677()
					for _, player in pairs(Players:GetPlayers()) do
						if player.Character then
							v671(player.Character)
						end
					end
				end
				local function v680()
					local Character = v662.Character
					local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
					local Humanoid = Character and Character:FindFirstChild("Humanoid")
					local PlayerGui = v662:FindFirstChild("PlayerGui")
					local DebrisBD = v662:FindFirstChild("DebrisBD")
					local Effects = workspace:FindFirstChild("Effects")
					local ImpactFrames = PlayerGui and PlayerGui:FindFirstChild("ImpactFrames")

					if not Character or not HumanoidRootPart or not Humanoid then
						return
					end

					local FieldOfView = workspace.CurrentCamera.FieldOfView
					local v689
					local v690
					local v691
					local v692

					if Effects then
						for _, child in pairs(Effects:GetChildren()) do
							if child:IsA("Model") then
								if child.Name:match("Outline$") then
									v690 = child

									continue
								end
							end

							if child:IsA("Model") then
								if not (child.Name:match("Outline$") or child.Name == "Pick" or child.Name == "RedDot") then
									v689 = child

									continue
								end
							end

							if child.Name == "Pick" then
								v691 = child
							elseif child.Name == "RedDot" then
								v692 = child
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
					local u700 = true
					local connection5

					task.spawn(function()
						createFolder(v662, "RecentGameStartedMessage", 0.01)

						if v689 and v689:FindFirstChild("shape") then
							TweenService:Create(v689.shape, TweenInfo.new(2, Enum.EasingStyle.Quad), {
								Position = v689.shape.Position + Vector3.new(0, 0.5, 0)
							}):Play()
						end

						if v689 then
							for _, child in pairs(v689:GetChildren()) do
								if child.Name == "DalgonaClickPart" and child:IsA("BasePart") then
									TweenService:Create(child, TweenInfo.new(2, Enum.EasingStyle.Quad), {
										Transparency = 1
									}):Play()
								end
							end
						end

						if v691 and v691.Parent then
							for _, descendant in pairs(v691:GetDescendants()) do
								if descendant:IsA("BasePart") then
									pcall(function()
										TweenService:Create(descendant, TweenInfo.new(2, Enum.EasingStyle.Quad), {
											Transparency = 1
										}):Play()
									end)
								end
							end
						end

						if v692 and v692.Parent then
							for _, descendant in pairs(v692:GetDescendants()) do
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

						v668(Character)
						DALGONATEMPREMPTE:FireServer({
							Success = true
						})
						task.wait(2)

						for _, v in pairs({
							v689,
							v690,
							v691,
							v692,
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
						u700 = false

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
					connection5 = RunService_.RenderStepped:Connect(function()
						if not u700 then
							connection5:Disconnect()

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
				local function v715()
					if v662.Character then
						if v662.Character:FindFirstChild("Remotes") then
							local Remotes = v662.Character:FindFirstChild("Remotes")

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
				v680()
				v715()
				task.spawn(function()
					repeat
						task.wait(1)
						v677()
					until not ReplicatedStorage:WaitForChild("Remotes"):FindFirstChild("DALGONATEMPREMPTE")

					v40(nil, "Dalgona Completed")
					task.spawn(function()
						local v718 = tick() + 10

						while tick() < v718 do
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

		v40(nil, "Dalgona is not currently running.")
	end
})
t5.DalgonaBox:Toggle({
	Title = "Free Lighter",
	Default = false,
	Callback = function(p79)
		if p79 then
			LocalPlayer:SetAttribute("HasLighter", true)
		else
			LocalPlayer:SetAttribute("HasLighter", nil)
		end
	end
})
t1.autoRelaxEnabled = false

local thread3

t5.DalgonaBox:Toggle({
	Title = "Auto Relax",
	Default = false,
	Callback = function(p80)
		t1.autoRelaxEnabled = p80

		if t1.autoRelaxEnabled and not thread3 then
			thread3 = task.spawn(function()
				t3.lastRelaxTime = 0

				while t1.autoRelaxEnabled do
					if v37("Dalgona") and getStressLevel() > 0 and tick() - t3.lastRelaxTime >= 2.1 then
						v43("q")
						t3.lastRelaxTime = tick()
					end

					task.wait(1)
				end

				thread3 = nil
			end)
		end
	end
})
t1.dalgonaQteEnabled = false
t2.dalgonaQteThread = nil
t5.DalgonaBox:Toggle({
	Title = "Auto QTE Event (Dalgona)",
	Default = false,
	Callback = function(p81)
		t1.dalgonaQteEnabled = p81

		if t1.dalgonaQteEnabled and not t2.dalgonaQteThread then
			t2.dalgonaQteThread = task.spawn(function()
				local t39 = {}

				while t1.dalgonaQteEnabled do
					if v37("Dalgona") then
						local v723 = v46()

						if v723 and v723.ActiveButtons then
							for k, activeButton in pairs(v723.ActiveButtons) do
								if not t39[k] and activeButton then
									t39[k] = true
									task.delay(0.01, function()
										if t1.dalgonaQteEnabled and v37("Dalgona") and v723.ActiveButtons and v723.ActiveButtons[k] then
											pcall(function()
												v723.Pressed(false, v723.ActiveButtons[k])
											end)
										end
									end)
								end
							end

							for k in pairs(t39) do
								if not v723.ActiveButtons[k] then
									t39[k] = nil
								end
							end
						end
					else
						table.clear(t39)
					end

					task.wait(0.05)
				end

				t2.dalgonaQteThread = nil
			end)
		end
	end
})
t5.PentathlonBox = t4.Dalgona:Section({
	Opened = true,
	Title = "| Pentathlon",
	Icon = "swords"
})
t5.PentathlonBox:Button({
	Title = "Auto Complete Ddakji",
	Callback = function()
		if not GUID then
			v40(nil, "Pentathlon is not currently running.")

			return
		end

		local CurrentCamera = Workspace.CurrentCamera
		local v728 = CurrentCamera.CFrame.Position + CurrentCamera.CFrame.LookVector * 10
		local ViewportSize = CurrentCamera.ViewportSize
		local v730 = CurrentCamera:ViewportPointToRay(ViewportSize.X * 0.5, ViewportSize.Y * 0.5)
		local raycastParams = RaycastParams.new()

		raycastParams.FilterType = Enum.RaycastFilterType.Include

		local PentathlonMap = Workspace:FindFirstChild("PentathlonMap")

		raycastParams.FilterDescendantsInstances = PentathlonMap and { PentathlonMap } or {}

		local hit = Workspace:Raycast(v730.Origin, v730.Direction * 500, raycastParams)

		if hit and hit.Position then
			v728 = hit.Position
		end

		if v54("Thrown", {
			Power = 1,
			Position = v728
		}) then
			v40("Pentathlon", "Ddakji Completed")
		else
			v40(" Error", "Wait for game to start")
		end
	end
})
t5.PentathlonBox:Button({
	Title = "Auto Complete Flying Stone",
	Callback = function()
		if not GUID then
			v40(nil, "Pentathlon is not currently running.")

			return
		end

		local Character = LocalPlayer.Character
		local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart then
			local v736

			for _, descendant in ipairs(Workspace:GetDescendants()) do
				if descendant.Name == "Target" and descendant:IsA("BasePart") then
					v736 = descendant

					break
				end
			end

			local v739 = HumanoidRootPart.Position + Vector3.new(0, 1.5, 0)

			if v54("Thrown", {
				Direction = v736 and CFrame.lookAt(HumanoidRootPart.Position, v736.Position, Vector3.new(0, 1, 0)).LookVector or Vector3.new(0, 0, 1),
				ThrowPower = "Perfect",
				Origin = v739
			}) then
				v40("Pentathlon", "Flying Stone Completed")
			else
				v40(" Error", "Wait for game to start")
			end
		end
	end
})
t5.PentathlonBox:Button({
	Title = "Auto Gonggi (Spam This)",
	Callback = function()
		if GUID then
			task.spawn(function()
				pcall(function()
					v54("Thrown", {})
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
						v54("GotPiece", {
							Name = v
						})
					end)
				end

				pcall(function()
					v54("Catch", {})
				end)
				pcall(function()
					v54("Caught", {})
				end)

				local u742 = false

				pcall(function()
					u742 = v54("TimeSlowFinish", {})
				end)

				if u742 then
					v40("Pentathlon", "Gonggi Part Got Completed")
				else
					v40(" Error", "Check if game started")
				end
			end)

			return
		end

		v40(nil, "Pentathlon is not currently running.")
	end
})
t5.PentathlonBox:Button({
	Title = "Auto Complete Spinning Top",
	Callback = function()
		if GUID then
			task.spawn(function()
				v54("Tied", {})
				task.wait(0.01)

				if v54("Thrown", {}) then
					v40("Pentathlon", "Spinning Top Completed")
				else
					v40(" Error", "Wait for game to start")
				end
			end)

			return
		end

		v40(nil, "Pentathlon is not currently running.")
	end
})
t5.PentathlonBox:Button({
	Title = "Auto Complete Jegi",
	Callback = function()
		if GUID then
			task.spawn(function()
				local v743 = false

				for i = 1, 6 do
					v743 = v54("Kick", {
						Lose = false
					})
					task.wait(0.01)
				end

				if v743 then
					v40("Pentathlon", "Jegi Completed")
				else
					v40(" Error", "Wait for game to start")
				end
			end)

			return
		end

		v40(nil, "Pentathlon is not currently running.")
	end
})

local function v745()
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

local t40 = {}

local function v753()
	t40 = {}

	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			table.insert(t40, player.Name)
		end
	end
end

v753()
t1.espPowersEnabled = false

local t41 = {}
local t42 = {}

local function v758(p82)
	if p82 then
		if p82.Character then
			local Head = p82.Character:FindFirstChild("Head")
			local attribute = p82:GetAttribute("_EquippedPower")

			if not t1.espPowersEnabled or not Head or not (attribute and attribute ~= "" and attribute ~= "None" and attribute ~= "Yok") then
				if t42[p82] then
					t42[p82]:Destroy()
					t42[p82] = nil
				end
			else
				local text = tostring(attribute)
				local v762 = t42[p82]

				if v762 then
					if v762.Parent ~= Head then
						v762.Parent = Head
					end

					local TextLabel = v762:FindFirstChildOfClass("TextLabel")

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
					t42[p82] = BillboardGui
				end
			end

			return
		end
	end
end
local function v766(p83)
	if t41[p83] then
		t41[p83]:Disconnect()
		t41[p83] = nil
	end

	t41[p83] = p83:GetAttributeChangedSignal("_EquippedPower"):Connect(function()
		v758(p83)
	end)
	t41[p83.Name .. "_char"] = p83.CharacterAdded:Connect(function()
		task.wait(1)

		if t1.espPowersEnabled then
			v758(p83)
		end
	end)
	v758(p83)
end
local function v767()
	for _, v in pairs(t41) do
		v:Disconnect()
	end

	table.clear(t41)

	for _, v in pairs(t42) do
		if v then
			v:Destroy()
		end
	end

	table.clear(t42)
end

t3.lastUtilitiesTPTime = 0

local function v772(p84, p85)
	local Attachment = Instance.new("Attachment")

	Attachment.Parent = p84

	if p85 then
		Attachment.WorldCFrame = CFrame.lookAt(p84.Position, p84.Position + p85)
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

t1.customPhantomEnabled = false

local u780
local clone
local n12 = 2
local u783 = false
local TweenService = game:GetService("TweenService")

game:GetService("UserInputService")

local n13 = 1

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

local function v786(p86)
	if p86 then
		if u780 then
			v40(nil, "Phantom Step is already activated!")

			return
		end

		t1.customPhantomEnabled = true
		n12 = 2
		v40(nil, "Phantom Step Activated PC Keybind Q")
		u780 = true

		local function v787()
			if n12 > 0 and not u783 then
				local Character = LocalPlayer.Character
				local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart then
					local Humanoid = Character:FindFirstChild("Humanoid")

					if Humanoid and Humanoid.Health <= 0 then
						return
					end

					local v791 = false

					for _, v in ipairs(HumanoidRootPart:GetConnectedParts(true)) do
						local Model = v:FindFirstAncestorOfClass("Model")

						if Model and Model ~= Character then
							if game:GetService("Players"):GetPlayerFromCharacter(Model) then
								v791 = true

								break
							end
						end
					end

					local t43 = {
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

					if not v791 and Humanoid then
						local Animator = Humanoid:FindFirstChildOfClass("Animator")

						if Animator then
							for _, v in ipairs(Animator:GetPlayingAnimationTracks()) do
								if v.Animation then
									local AnimationId = v.Animation.AnimationId
									local v800 = v.Animation.Name:lower()

									if t43[AnimationId] then
										v791 = true

										break
									elseif AnimationId:lower():match("carry") or v800:match("carry") or v800:match("carried") then
										v791 = true

										break
									end
								end
							end
						end
					end

					if v791 then
						return
					end

					if v37("TugOfWar") then
						return
					end

					n12 -= 1
					u783 = true
					task.delay(0.2, function()
						u783 = false
					end)
					task.delay(1.5, function()
						if n12 < 2 then
							n12 += 1
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

					local n14 = 11
					local raycastParams = RaycastParams.new()
					local filterDescendantsInstances = { Character }
					local ipairs_ = ipairs
					local Players2 = game:GetService("Players")

					for _, player in ipairs_(Players2:GetPlayers()) do
						if player ~= LocalPlayer and player.Character then
							table.insert(filterDescendantsInstances, player.Character)
						end
					end

					raycastParams.FilterDescendantsInstances = filterDescendantsInstances
					raycastParams.FilterType = Enum.RaycastFilterType.Exclude

					local Position = CFrame_.Position
					local v812 = n14
					local Position2

					for i = 1, 15 do
						local hit = workspace:Raycast(Position, MoveDirection * v812, raycastParams)

						if hit then
							if hit.Instance.CanCollide then
								Position2 = hit.Position

								break
							else
								table.insert(filterDescendantsInstances, hit.Instance)
								raycastParams.FilterDescendantsInstances = filterDescendantsInstances
								v812 -= (hit.Position - Position).Magnitude
								Position = hit.Position + MoveDirection * 0.01

								if not (v812 <= 0) then
									continue
								end
							end
						end

						break
					end

					if Position2 then
						n14 = math.max(0, (Position2 - CFrame_.Position).Magnitude - 1.5)
					end

					local v816 = CFrame_ + MoveDirection * math.max(0, n14)

					v772(HumanoidRootPart, MoveDirection)

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

					if n12 == 0 then
						if n13 == 2 then
							Sound.SoundId = getcustomasset("UwUInk/1.mp3")
							n13 = 1
						else
							Sound.SoundId = getcustomasset("UwUInk/2.mp3")
							n13 = 2
						end
					elseif math.random(1, 100) <= 30 then
						Sound.SoundId = getcustomasset("UwUInk/2.mp3")
						n13 = 2
					else
						Sound.SoundId = getcustomasset("UwUInk/1.mp3")
						n13 = 1
					end

					Sound.Volume = 2
					Sound.Parent = game:GetService("SoundService")
					Sound:Play()
					Sound.Ended:Connect(function()
						Sound:Destroy()
					end)

					local t44 = {}

					for _, descendant in ipairs(Character:GetDescendants()) do
						if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" and descendant.Transparency < 1 then
							t44[descendant] = descendant.Transparency
							descendant.Transparency = 1
						elseif descendant:IsA("Decal") and descendant.Transparency < 1 then
							t44[descendant] = descendant.Transparency
							descendant.Transparency = 1
						end
					end

					TweenService:Create(HumanoidRootPart, TweenInfo.new(0.12, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
						CFrame = v816
					}):Play()
					task.delay(0.12, function()
						for k, v in pairs(t44) do
							if k and k.Parent then
								k.Transparency = v
							end
						end

						v772(HumanoidRootPart, MoveDirection)

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

		game:GetService("ContextActionService"):BindActionAtPriority("CustomPhantomStep_Q", function(p87, p88)
			if p88 == Enum.UserInputState.Begin then
				v787()
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

								v787()
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
	elseif u780 then
		game:GetService("ContextActionService"):UnbindAction("CustomPhantomStep_Q")

		if clone then
			clone:Destroy()
		end

		u780 = nil
		t1.customPhantomEnabled = false
		v40(nil, "Phantom Step Deactivated")
	end
end

t5.TeleportBox = t4.Utilities:Section({
	Opened = true,
	Title = "| Teleport",
	Icon = "navigation"
})
t5.UtilitiesBox = t4.Utilities:Section({
	Opened = true,
	Title = "| Utilities",
	Icon = "wrench"
})
t5.UtilitiesBox:Toggle({
	Title = "Free Phantom Step",
	Default = false,
	Callback = function(p89)
		if v786 then
			v786(p89)
		end
	end
})

local s3 = ""

t5.TeleportBox:Button({
	Title = "Refresh Player List",
	Callback = function()
		v753()

		if tpDropdown then
			tpDropdown:Refresh(t40)
		end
	end
})
t5.TeleportBox:Dropdown({
	Callback = function(p90)
		s3 = p90
	end,
	Values = t40,
	Default = 1,
	Multi = false,
	Title = "Select Player"
})
t5.TeleportBox:Button({
	Title = "Teleport to Player",
	Callback = function()
		v753()

		local v834 = s3

		if not v834 or v834 == "" then
			v40(" Error", "Select a player first")

			return
		end

		local v835 = Players:FindFirstChild(v834)

		if v835 and v835.Character then
			if not v835.Character:FindFirstChild("HumanoidRootPart") then
				v40(" Error", "Player not found or has no character")

				return
			end

			v56(v835.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
			v40(" Teleported", "Teleported to " .. v834)
		else
			v40(" Error", "Player not found or has no character")
		end
	end
})
t5.TeleportBox:Button({
	Title = "Teleport 100 Stud Up",
	Callback = function()
		if tick() - t3.lastUtilitiesTPTime < 10 then
			v40(nil, "Please wait before teleporting again (" .. math.ceil(10 - (tick() - t3.lastUtilitiesTPTime)) .. "s)")

			return
		end

		local Character = LocalPlayer.Character

		if Character then
			if Character:FindFirstChild("HumanoidRootPart") then
				Character.HumanoidRootPart.CFrame *= CFrame.new(0, 100, 0)
				t3.lastUtilitiesTPTime = tick()
				v40(nil, "Successfully Teleported 100 Stud Up")
			end
		end
	end
})
t5.TeleportBox:Button({
	Title = "Teleport 50 Stud Down",
	Callback = function()
		if tick() - t3.lastUtilitiesTPTime < 10 then
			v40(nil, "Please wait before teleporting again (" .. math.ceil(10 - (tick() - t3.lastUtilitiesTPTime)) .. "s)")

			return
		end

		local Character = LocalPlayer.Character

		if Character then
			if Character:FindFirstChild("HumanoidRootPart") then
				Character.HumanoidRootPart.CFrame *= CFrame.new(0, -50, 0)
				t3.lastUtilitiesTPTime = tick()
				v40(nil, "Successfully Teleported 50 Stud Down")
			end
		end
	end
})
t1.allGamesAutoQTEEnabled = false
t2.allGamesQTEThread = nil
t5.GameToolsBox:Toggle({
	Title = "Auto QTE Event (All Games)",
	Default = false,
	Callback = function(p91)
		t1.allGamesAutoQTEEnabled = p91

		if not t1.allGamesAutoQTEEnabled or t2.allGamesQTEThread then
			if not t1.allGamesAutoQTEEnabled then
				t2.allGamesQTEThread = nil
			end
		else
			t2.allGamesQTEThread = task.spawn(function()
				local t45 = {}

				while t1.allGamesAutoQTEEnabled do
					local v839 = v46()

					if v839 and v839.ActiveButtons then
						for k, activeButton in pairs(v839.ActiveButtons) do
							if not t45[k] and activeButton then
								t45[k] = true

								if t1.allGamesAutoQTEEnabled and v839.ActiveButtons and v839.ActiveButtons[k] then
									pcall(function()
										v839.Pressed(false, v839.ActiveButtons[k])
									end)
								end
							end
						end

						for k in pairs(t45) do
							if not v839.ActiveButtons[k] then
								t45[k] = nil
							end
						end
					else
						table.clear(t45)
					end

					task.wait()
				end

				t2.allGamesQTEThread = nil
			end)
		end
	end
})
t5.GameToolsBox:Toggle({
	Title = "ESP Powers",
	Default = false,
	Callback = function(p92)
		t1.espPowersEnabled = p92

		if p92 then
			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= LocalPlayer then
					v766(player)
				end
			end

			t41._PlayerAdded = Players.PlayerAdded:Connect(function(player)
				if t1.espPowersEnabled then
					v766(player)
				end
			end)
		else
			v767()
		end
	end
})
t1.peabertESPEnabled = false

local t46 = {}
local t47 = {}

local function v847(p93)
	if not p93 or not p93.Parent then
		return
	end

	if t47[p93] then
		return
	end

	local Highlight = Instance.new("Highlight")

	Highlight.Name = "PeabertHighlight"
	Highlight.FillColor = Color3.fromRGB(0, 255, 0)
	Highlight.FillTransparency = 0.5
	Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
	Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	Highlight.Parent = p93
	t47[p93] = Highlight
end
local function v849(p94)
	if t47[p94] then
		t47[p94]:Destroy()
		t47[p94] = nil
	end
end
local function v850(p95)
	return p95:IsA("Model") and string.find(p95.Name, "FREEPEABERT")
end
local function v851(descendant)
	if v850(descendant) then
		t46[descendant] = true

		if t1.peabertESPEnabled then
			v847(descendant)
		end
	end
end

for _, descendant in pairs(workspace:GetDescendants()) do
	v851(descendant)
end

workspace.DescendantAdded:Connect(v851)
workspace.DescendantRemoving:Connect(function(descendant)
	if t46[descendant] then
		t46[descendant] = nil
		v849(descendant)
	end
end)
t5.GameToolsBox:Toggle({
	Title = "Peaberts ESP",
	Default = false,
	Callback = function(p96)
		t1.peabertESPEnabled = p96

		if t1.peabertESPEnabled then
			for k in pairs(t46) do
				if k and k.Parent then
					v847(k)
				end
			end
		else
			for k in pairs(t46) do
				v849(k)
			end
		end
	end
})

local n15 = 0

t5.GameToolsBox:Button({
	Title = "TP To Peabert",
	Callback = function()
		if tick() - n15 < 10 then
			v40(" Cooldown", string.format("Wait %.1fs", 10 - (tick() - n15)))

			return
		end

		local Character = LocalPlayer.Character
		local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

		if not HumanoidRootPart then
			return
		end

		local v859
		local huge = math.huge

		for k in pairs(t46) do
			if k and k.Parent then
				local BasePart = k:FindFirstChildWhichIsA("BasePart", true)

				if BasePart then
					local Magnitude = (HumanoidRootPart.Position - BasePart.Position).Magnitude

					if Magnitude < huge then
						huge = Magnitude
						v859 = BasePart
					end
				end
			end
		end

		if v859 then
			v56(v859.CFrame * CFrame.new(0, 0, 3))
			n15 = tick()
			v40(" Teleported", "Teleported to Peabert!")
		else
			v40(" Error", "No Peaberts found on map!")
		end
	end
})

local connection5

t5.GameToolsBox:Toggle({
	Title = "Infinite Jump",
	Default = false,
	Callback = function(p97)
		if p97 then
			if connection5 then
				return
			end

			connection5 = UserInputService.JumpRequest:Connect(function()
				local Character = LocalPlayer.Character

				if Character then
					local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")

					if Humanoid then
						Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					end
				end
			end)
		elseif connection5 then
			connection5:Disconnect()
			connection5 = nil
		end
	end
})
t5.VisualGamepassBox = t4.Visual:Section({
	Opened = true,
	Title = "| Gamepass Options",
	Icon = "credit-card"
})

local function v867(p98, p99, p100)
	local connection6

	t5.VisualGamepassBox:Toggle({
		Title = p99,
		Default = false,
		Callback = function(p101)
			if p101 then
				LocalPlayer:SetAttribute(p100, true)
				connection6 = LocalPlayer:GetAttributeChangedSignal(p100):Connect(function()
					if not LocalPlayer:GetAttribute(p100) then
						LocalPlayer:SetAttribute(p100, true)
					end
				end)
			else
				if connection6 then
					connection6:Disconnect()
				end

				LocalPlayer:SetAttribute(p100, nil)
			end
		end
	})
end

v867("VisualVIP", " Unlock VIP", "__OwnsVIPGamepass")
v867("VisualLighter", " Unlock Lighter", "HasLighter")
v867("Visual2X", " Unlock 2X Count", "__Owns2XVoteGamepass")
v867("VisualGuard", " Unlock Guard Perm", "__OwnsPermGuard")
v867("VisualGlass", " Unlock Glass Vision", "__OwnsGlassManufacturerVision")
v867("VisualPSPlus", " Unlock PS Plus", "__OwnsPSPlus")
v867("VisualEmotes", " Unlock Emote Pages", "__OwnsEmotePages")
_G.UniformColorValue = Color3.fromRGB(255, 255, 255)
t5.VisualClientBox = t4.Visual:Section({
	Opened = true,
	Title = "| Client Options",
	Icon = "monitor"
})
t5.CombatBox = t4.Combat:Section({
	Opened = true,
	Title = "| Combat Features",
	Icon = "crosshair"
})

local t48

t48 = {
	PlayerAttachEnabled = false,
	attachedTarget = nil,
	attachConnection = nil,
	autoSearchConnection = nil,
	BehindSquare = nil,
	FrontSquare = nil,
	CurrentSquare = nil,
	CurrentBodyVelocity = nil,
	AttachConfig = {
		BehindDistance = 2.5,
		FrontDistance = 16,
		SpeedThreshold = 17,
		MaxSpeed = 500,
		TransitionSpeed = 150
	},
	createSquare = function(p102)
		local Part2 = Instance.new("Part")

		Part2.Name = p102
		Part2.Size = Vector3.new(3, 0.5, 3)
		Part2.Transparency = 1
		Part2.CanCollide = false
		Part2.Anchored = true
		Part2.Massless = true
		Part2.Parent = workspace

		return Part2
	end,
	destroySquares = function()
		if t48.BehindSquare then
			t48.BehindSquare:Destroy()
			t48.BehindSquare = nil
		end

		if t48.FrontSquare then
			t48.FrontSquare:Destroy()
			t48.FrontSquare = nil
		end
	end,
	isTargetMovingForward = function(p103)
		if not p103 then
			return false
		end

		local Velocity = p103.Velocity

		if math.sqrt(Velocity.X ^ 2 + Velocity.Z ^ 2) < 2 then
			return false
		end

		local LookVector = p103.CFrame.LookVector
		local Unit = Vector3.new(Velocity.X, 0, Velocity.Z).Unit

		return Vector3.new(LookVector.X, 0, LookVector.Z).Unit:Dot(Unit) > 0.7
	end,
	updateSquares = function(p104)
		if not p104 then
			return
		end

		local Position = p104.Position
		local LookVector = p104.CFrame.LookVector
		local Y = p104.Position.Y
		local v877 = Position + -LookVector * t48.AttachConfig.BehindDistance
		local vector3 = Vector3.new(v877.X, Y - 2, v877.Z)
		local v879 = Position + LookVector * t48.AttachConfig.FrontDistance
		local vector32 = Vector3.new(v879.X, Y - 2, v879.Z)

		if t48.BehindSquare then
			t48.BehindSquare.Position = vector3
		end

		if t48.FrontSquare then
			t48.FrontSquare.Position = vector32
		end
	end,
	getTargetSquare = function(p105)
		if not p105 then
			return t48.BehindSquare
		end

		local Velocity = p105.Velocity
		local v882 = math.sqrt(Velocity.X ^ 2 + Velocity.Z ^ 2) > t48.AttachConfig.SpeedThreshold
		local v883 = t48.isTargetMovingForward(p105)

		if v882 and v883 then
			return t48.FrontSquare
		end

		return t48.BehindSquare
	end,
	applySmoothMovement = function(p106, p107)
		local Character = LocalPlayer.Character

		if not Character then
			return
		end

		local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
		local Humanoid = Character:FindFirstChildOfClass("Humanoid")

		if not HumanoidRootPart or not Humanoid then
			return
		end

		if not p106 then
			return
		end

		local Position = HumanoidRootPart.Position
		local Magnitude = (p106 - Position).Magnitude

		if Magnitude > 0.3 then
			local v889 = (p106 - Position).Unit * math.min(p107 and t48.AttachConfig.TransitionSpeed or t48.AttachConfig.MaxSpeed, Magnitude * 10)

			if t48.CurrentBodyVelocity then
				t48.CurrentBodyVelocity:Destroy()
			end

			t48.CurrentBodyVelocity = Instance.new("BodyVelocity")
			t48.CurrentBodyVelocity.MaxForce = Vector3.new(50000, 0, 50000)
			t48.CurrentBodyVelocity.Velocity = Vector3.new(v889.X, 0, v889.Z)
			t48.CurrentBodyVelocity.Parent = HumanoidRootPart
			task.wait(0.03)

			if t48.CurrentBodyVelocity then
				t48.CurrentBodyVelocity:Destroy()
				t48.CurrentBodyVelocity = nil
			end
		end

		Humanoid.AutoRotate = true
	end,
	IsHider = function(p108)
		return p108 and p108:GetAttribute("IsHider") == true
	end,
	IsSeeker = function(p109)
		return p109 and p109:GetAttribute("IsHunter") == true
	end,
	FindBestTarget = function()
		local v890 = LocalPlayer

		if not v890 then
			return nil
		end

		local v891 = t48.IsSeeker(v890)
		local v892 = t48.IsHider(v890)
		local Character = LocalPlayer.Character

		if not Character then
			return nil
		end

		local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

		if not HumanoidRootPart then
			return nil
		end

		local v895
		local huge = math.huge

		for _, player in pairs(Players:GetPlayers()) do
			if player ~= LocalPlayer and player.Character then
				local Humanoid = player.Character:FindFirstChildOfClass("Humanoid")

				if Humanoid and Humanoid.Health > 0 then
					local v900 = false

					if v891 and t48.IsHider(player) then
						v900 = true
					elseif v892 and t48.IsSeeker(player) then
						v900 = true
					elseif not (v891 or v892) then
						v900 = true
					end

					if v900 then
						local HumanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")

						if HumanoidRootPart2 then
							local Magnitude = (HumanoidRootPart2.Position - HumanoidRootPart.Position).Magnitude

							if Magnitude < huge then
								huge = Magnitude
								v895 = player
							end
						end
					end
				end
			end
		end

		return v895
	end,
	lastSquare = nil,
	attachToPlayer = function(p110)
		if p110 then
			if p110.Character then
				if t48.attachedTarget == p110 then
					return true
				end

				if t48.attachedTarget then
					t48.detach()
				end

				local Character = LocalPlayer.Character

				if not Character then
					return false
				end

				local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
				local Humanoid = Character:FindFirstChildOfClass("Humanoid")

				if not HumanoidRootPart or not Humanoid then
					return false
				end

				t48.destroySquares()
				t48.BehindSquare = t48.createSquare("BehindSquare", t48.AttachConfig.BehindDistance)
				t48.FrontSquare = t48.createSquare("FrontSquare", t48.AttachConfig.FrontDistance)
				t48.attachedTarget = p110
				t48.lastSquare = nil
				Humanoid.WalkSpeed = t48.AttachConfig.MaxSpeed
				Humanoid.AutoRotate = true
				Humanoid.PlatformStand = false

				if t48.attachConnection then
					t48.attachConnection:Disconnect()
				end

				t48.attachConnection = game:GetService("RunService").Heartbeat:Connect(function()
					if not t48.PlayerAttachEnabled or not t48.attachedTarget then
						t48.detach()

						return
					end

					if not t48.attachedTarget or not t48.attachedTarget.Character then
						t48.detach()

						return
					end

					local Character2 = t48.attachedTarget.Character
					local HumanoidRootPart2 = Character2:FindFirstChild("HumanoidRootPart")
					local Humanoid2 = Character2:FindFirstChildOfClass("Humanoid")

					if not HumanoidRootPart2 or not Humanoid2 or Humanoid2.Health <= 0 then
						local v909 = t48.FindBestTarget()

						if not v909 or v909 == t48.attachedTarget then
							t48.detach()
							v40("Combat", "No new target found")
						else
							t48.attachToPlayer(v909)
						end

						return
					end

					t48.updateSquares(HumanoidRootPart2)

					local v910 = t48.getTargetSquare(HumanoidRootPart2)

					if v910 then
						local v911 = t48.lastSquare ~= nil and t48.lastSquare ~= v910
						local Position = v910.Position

						t48.applySmoothMovement(Vector3.new(Position.X, Position.Y + 2.5, Position.Z), v911)
						t48.lastSquare = v910
					end
				end)

				return true
			end
		end

		return false
	end,
	detach = function()
		if t48.attachConnection then
			t48.attachConnection:Disconnect()
			t48.attachConnection = nil
		end

		if t48.CurrentBodyVelocity then
			t48.CurrentBodyVelocity:Destroy()
			t48.CurrentBodyVelocity = nil
		end

		t48.destroySquares()

		local Character = LocalPlayer.Character

		if Character then
			local Humanoid = Character:FindFirstChildOfClass("Humanoid")

			if Humanoid then
				Humanoid.PlatformStand = false
				Humanoid.AutoRotate = true
				Humanoid.WalkSpeed = 16
			end

			local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

			if HumanoidRootPart then
				HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			end
		end

		t48.attachedTarget = nil
		t48.CurrentSquare = nil
		t48.lastSquare = nil
	end,
	startAutoSearch = function()
		if t48.autoSearchConnection then
			t48.autoSearchConnection:Disconnect()
		end

		t48.autoSearchConnection = game:GetService("RunService").Heartbeat:Connect(function()
			if not t48.PlayerAttachEnabled then
				return
			end

			if t48.attachedTarget then
				return
			end

			if tick() % 1 < 0.05 then
				local v916 = t48.FindBestTarget()

				if v916 then
					t48.attachToPlayer(v916)
					v40("Combat", "Attached to player")
				end
			end
		end)
	end,
	TogglePlayerAttach = function(p111)
		t48.PlayerAttachEnabled = p111

		if p111 then
			local v917 = t48.FindBestTarget()

			if v917 then
				t48.attachToPlayer(v917)
				t48.startAutoSearch()
				v40("Combat", "Attached to player")
			else
				v40("Combat", "No players found")
				t48.PlayerAttachEnabled = false
			end
		else
			if t48.autoSearchConnection then
				t48.autoSearchConnection:Disconnect()
				t48.autoSearchConnection = nil
			end

			t48.detach()
		end
	end
}
t5.CombatBox:Toggle({
	Title = "Player Attach",
	Default = false,
	Callback = function(p112)
		t48.TogglePlayerAttach(p112)
	end
})

local function v918()
	local v919
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
					v919 = player
				end
			end
		end
	end

	return v919
end

t5.CombatBox:Toggle({
	Title = "CamLock (Auto Games)",
	Default = false,
	Callback = function(p113)
		_G.CamLockEnabled = p113

		if p113 then
			if not _G.CamLockSearchThread then
				_G.CamLockSearchThread = true
				task.spawn(function()
					while _G.CamLockSearchThread do
						if (v37("LightsOut") or v37("Mingle") or v37("SkySquidGame") or v37("SquidGame") or v37("LastDinner")) and _G.CamLockEnabled then
							camLockClosestPlayer = v918()
						else
							camLockClosestPlayer = nil
						end

						task.wait(0.2)
					end
				end)
			end

			if not _G.CamLockBound then
				_G.CamLockBound = true
				game:GetService("RunService"):BindToRenderStep("UwUCamLock", Enum.RenderPriority.Camera.Value + 1, function()
					if _G.CamLockEnabled and camLockClosestPlayer and camLockClosestPlayer.Character then
						local HumanoidRootPart = camLockClosestPlayer.Character:FindFirstChild("HumanoidRootPart")
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

			camLockClosestPlayer = nil
		end
	end
})

local u929 = false

local function v930(p114)
	if p114.PacketId == 27 then
		local AsBuffer = p114.AsBuffer

		if buffer and buffer.writeu32 then
			buffer.writeu32(AsBuffer, 1, 4294967295)
			p114:SetData(AsBuffer)
		end
	end
end

t5.CombatBox:Toggle({
	Title = "Desync",
	Default = false,
	Callback = function(p115)
		if not pcall(function()
			return raknet and raknet.add_send_hook
		end) then
			v40("Combat", "Unsupported Executor")

			return
		end

		if not p115 then
			if u929 then
				pcall(function()
					raknet.remove_send_hook(v930)
					u929 = false
				end)
			end
		elseif not u929 then
			pcall(function()
				raknet.add_send_hook(v930)
				u929 = true
			end)
		end
	end
})
t5.VisualClientBox:Toggle({
	Title = "Set Uniform Skin",
	Default = false,
	Callback = function(p116)
		_G.SetUniformSkinEnabled = p116
		LocalPlayer:SetAttribute("ClothingColorToggle", p116)

		if p116 and _G.UniformColorValue then
			LocalPlayer:SetAttribute("ClothingColor", _G.UniformColorValue)
		end
	end
})
t5.VisualClientBox:Colorpicker({
	Default = Color3.fromRGB(255, 255, 255),
	Title = "Uniform Skin Color",
	Callback = function(p117)
		_G.UniformColorValue = p117

		if _G.SetUniformSkinEnabled then
			LocalPlayer:SetAttribute("ClothingColor", _G.UniformColorValue)
		end
	end
})
_G.CustomPlayerNumber = 456
_G.CustomPlayerNumberEnabled = false
t5.VisualClientBox:Input({
	Default = "456",
	Numeric = true,
	Finished = false,
	Title = "Custom Player Number",
	Tooltip = "Change your overhead/chat number (e.g. 456)",
	Callback = function(p118)
		_G.CustomPlayerNumber = tonumber(p118) or 456
	end
})
t5.VisualClientBox:Toggle({
	Title = "Enable Custom Tag",
	Default = false,
	Callback = function(p119)
		_G.CustomPlayerNumberEnabled = p119

		if p119 then
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
t5.VisualClientBox:Input({
	Default = "100",
	Numeric = true,
	Finished = false,
	Title = "Custom Wins",
	Tooltip = "Change your visual total wins",
	Callback = function(p120)
		_G.CustomWinsValue = tonumber(p120) or 100
	end
})
t5.VisualClientBox:Toggle({
	Title = "Enable Custom Wins",
	Default = false,
	Callback = function(p121)
		_G.CustomWinsEnabled = p121

		if p121 then
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
t5.VisualClientBox:Input({
	Default = "10",
	Numeric = true,
	Finished = false,
	Title = "Custom Win Streak",
	Tooltip = "Change your visual win streak",
	Callback = function(p122)
		_G.CustomWinStreakValue = tonumber(p122) or 10
	end
})
t5.VisualClientBox:Toggle({
	Title = "Enable Custom Win Streak",
	Default = false,
	Callback = function(p123)
		_G.CustomWinStreakEnabled = p123

		if p123 then
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

local t49 = { "Loading..." }

t5.EmoteBox = t4.Visual:Section({
	Opened = true,
	Title = "| Emote Player",
	Icon = "smile"
})

local v939 = t5.EmoteBox:Dropdown({
	Values = t49,
	Default = 1,
	Multi = false,
	Title = "Emote List"
})
local u940 = false
local u941

t5.EmoteBox:Button({
	Title = "Play / Stop Emote",
	Callback = function()
		local Character = LocalPlayer.Character
		local Humanoid = Character and Character:FindFirstChild("Humanoid")

		if not Humanoid then
			return
		end

		if u940 then
			u940 = false
			Humanoid.Jump = true

			if u941 then
				u941:Stop()
				u941 = nil
			end
		end
	end
})
task.spawn(function()
	local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
	local t50 = {}

	pcall(function()
		local Animations = ReplicatedStorage2:FindFirstChild("Animations")

		if Animations then
			for _, descendant in pairs(Animations:GetDescendants()) do
				if descendant:IsA("Animation") and not table.find(t50, descendant.Name) then
					table.insert(t50, descendant.Name)
				end
			end
		end
	end)
	pcall(function()
		local data = game:GetService("HttpService"):JSONDecode(LocalPlayer:GetAttribute("_EmoteInventory"))

		if data then
			for k, v in pairs(data) do
				local v952 = type(v) == "string" and v or type(k) == "string" and k or tostring(v)

				if not table.find(t50, v952) then
					table.insert(t50, v952)
				end
			end
		end
	end)

	if #t50 == 0 then
		t50 = {
			"Floss",
			"DefaultDance",
			"TakeTheL",
			"CrabRave",
			"Distraction",
			"CoffinDance",
			"RickRoll"
		}
	end

	table.sort(t50, function(p124, p125)
		return tostring(p124) < tostring(p125)
	end)
	t49 = t50
	v939:SetValues(t49)
	v939:SetValue(t49[1])

	while task.wait(0.5) do
		if u940 then
			local Character = LocalPlayer.Character

			if Character then
				local Humanoid = Character:FindFirstChild("Humanoid")

				if Humanoid and Humanoid.MoveDirection.Magnitude > 0 then
					u940 = false

					if u941 then
						u941:Stop()
						u941 = nil
					end
				end
			end
		end
	end
end)
t1.fpsBoosterEnabled = false
t5.GameToolsBox:Toggle({
	Title = "FPS Booster / Anti-Lag",
	Default = false,
	Callback = function(p126)
		t1.fpsBoosterEnabled = p126

		local Lighting = game:GetService("Lighting")
		local Terrain = workspace:FindFirstChildOfClass("Terrain")

		if t1.fpsBoosterEnabled then
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
				elseif descendant:IsA("Decal") or descendant:IsA("Texture") and descendant.Name ~= "TOWDecal" then
					descendant.Transparency = 1
				elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") then
					descendant.Lifetime = NumberRange.new(0)
				elseif descendant:IsA("Explosion") then
					descendant.BlastPressure = 1
					descendant.BlastRadius = 1
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
t2.autoVoteThread = false
t5.AutoVoteBox = t4.Tools:Section({
	Opened = true,
	Title = "| Auto Vote",
	Icon = "check"
})
t5.AutoVoteBox:Dropdown({
	Values = {
		"None",
		"Dalgona",
		"Pentathlon"
	},
	Default = 1,
	Multi = false,
	Title = "Vote 1: Dalgona/Pentathlon"
})
t5.AutoVoteBox:Dropdown({
	Values = {
		"None",
		"Hide And Seek",
		"Tug Of War"
	},
	Default = 1,
	Multi = false,
	Title = "Vote 2: Hide/Tug"
})
t5.AutoVoteBox:Dropdown({
	Values = {
		"None",
		"Jump Rope",
		"Glass Bridge"
	},
	Default = 1,
	Multi = false,
	Title = "Vote 3: Jump/Glass"
})
t5.AutoVoteBox:Dropdown({
	Values = {
		"None",
		"Continue",
		"Rebel"
	},
	Default = 1,
	Multi = false,
	Title = "Vote 4: Rebel/Continue"
})
t5.AutoVoteBox:Toggle({
	Title = "Enable Auto Vote",
	Default = false,
	Callback = function(p127)
		t2.autoVoteThread = p127

		if p127 then
			task.spawn(function()
				while t2.autoVoteThread do
					local ReplicatedStorage2 = game:GetService("ReplicatedStorage")

					if ReplicatedStorage2:FindFirstChild("Remotes") then
						if ReplicatedStorage2.Remotes:FindFirstChild("ExtraTemporaryRemote") then
							local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 2)

							if PlayerGui then
								local VotingToPickGames = PlayerGui:FindFirstChild("VotingToPickGames", true)
								local VotingToEndGames = PlayerGui:FindFirstChild("VotingToEndGames", true)

								if VotingToPickGames then
									if VotingToPickGames:FindFirstChild("VotingBoardLeft") and VotingToPickGames:FindFirstChild("VotingBoardRight") and VotingToPickGames.VotingBoardLeft.Visible then
										local attribute = VotingToPickGames:GetAttribute("NewString")

										if attribute ~= "PentathlonOrDalgonaVote" then
											if attribute ~= "HideAndSeekOrTugOfWarVote" then
												if attribute == "GlassBridgeOrJumpRopeVote" then
												end
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

								if VotingToEndGames then
									if VotingToEndGames:FindFirstChild("VotingBoard") then
										if VotingToEndGames.VotingBoard.Visible then
											if VotingToEndGames:FindFirstChild("VotingBoard") then
												VotingToEndGames.VotingBoard.Visible = false
											end
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

local u964 = false

t2.stealThread = nil

local function v965()
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
local function v968()
	local function v969(p128)
		for _, child in ipairs(p128:GetChildren()) do
			if child.Name == "DroppedBandage" then
				local PrimaryPart = child:IsA("Model") and (child.PrimaryPart or child:FindFirstChildWhichIsA("BasePart", true)) or child:IsA("BasePart") and child

				if PrimaryPart then
					return child, PrimaryPart
				end
			end
		end

		return nil, nil
	end

	local v973, v974 = v969(workspace)

	if v973 then
		return v973, v974
	end

	local Effects = workspace:FindFirstChild("Effects")

	if Effects then
		local v976, v977 = v969(Effects)

		if v976 then
			return v976, v977
		end
	end

	local Live = workspace:FindFirstChild("Live")

	if Live then
		local v979, v980 = v969(Live)

		if v979 then
			return v979, v980
		end
	end

	return nil, nil
end
local function v981()
	if v37("RedLightGreenLight") then
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

t5.UtilitiesBox:Toggle({
	Title = "Auto Steal Bandages",
	Default = false,
	Callback = function(p129)
		u964 = p129

		if u964 then
			if t2.stealThread then
				return
			end

			t2.stealThread = true
			task.spawn(function()
				while u964 and t2.stealThread do
					if not (v965() or v981()) then
						local v985, v986 = v968()

						if v985 then
							if v986 then
								local Character = LocalPlayer.Character
								local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

								if HumanoidRootPart then
									local CFrame_ = HumanoidRootPart.CFrame
									local CFrame_2 = v986.CFrame

									HumanoidRootPart.CFrame = CFrame_2

									local n16 = 0

									while u964 do
										if not v965() and v985.Parent then
											if n16 < 10 and not v981() then
												HumanoidRootPart.CFrame = CFrame_2

												if typeof(firetouchinterest) == "function" then
													pcall(function()
														firetouchinterest(HumanoidRootPart, v986, 0)
														task.wait(0.05)
														firetouchinterest(HumanoidRootPart, v986, 1)
													end)
												end

												task.wait(0.1)
												n16 += 1

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
					end

					task.wait(0.5)
				end

				t2.stealThread = nil
			end)
		end
	end
})

local t51 = {
	"Left Hip",
	"Left Shoulder",
	"Neck",
	"Right Hip",
	"Right Shoulder"
}
local t52 = {
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
local t53 = {
	"Ragdoll",
	"TrueStun",
	"Stun",
	"RotateDisabled",
	"Waiting"
}

local function v995(p130)
	for _, v in ipairs(t52) do
		local v998 = p130:FindFirstChild(v)

		if v998 then
			v998.Parent = nil
		end
	end
end
local function v999(p131)
	local Torso = p131:FindFirstChild("Torso")

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

	for _, v in ipairs(t51) do
		local v1005 = Torso:FindFirstChild(v)

		if v1005 and v1005:IsA("Motor6D") and not v1005.Part0 then
			v1005.Part0 = Torso
		end
	end
end
local function v1006(p132)
	local HumanoidRootPart = p132:FindFirstChild("HumanoidRootPart")

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
local function v1012(p133)
	local Humanoid = p133:FindFirstChildOfClass("Humanoid")

	if not Humanoid then
		return
	end

	local HumanoidRootPart = p133:FindFirstChild("HumanoidRootPart")

	v995(p133)
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

	v999(p133)
	v1006(p133)
	Humanoid.WalkSpeed = 14
	Humanoid.JumpPower = 50

	if shared then
		shared.WalkSpeedChangeTick = nil
	end

	task.delay(0.1, function()
		if Humanoid and Humanoid.Parent and Humanoid.Health > 0 then
			Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
		end
	end)
end

t1.antiPushEnabled = false

local t54 = {}

local function v1016()
	for _, v in ipairs(t54) do
		if v then
			v:Disconnect()
		end
	end

	table.clear(t54)
end
local function v1019(p134)
	if not t1.antiPushEnabled then
		return
	end

	v1016()

	local Humanoid = p134:FindFirstChildOfClass("Humanoid")

	if not Humanoid then
		return
	end

	local HumanoidRootPart = p134:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart then
		return
	end

	local u1022 = false
	local connection6 = p134.ChildAdded:Connect(function(child)
		if u1022 or not t1.antiPushEnabled then
			return
		end

		if typeof(child) == "Instance" then
			local Name = child.Name

			for _, v in ipairs(t53) do
				if Name == v then
					task.spawn(function()
						v1012(p134)
					end)

					break
				end
			end
		end
	end)

	table.insert(t54, connection6)

	local connection7 = RunService.Heartbeat:Connect(function()
		if not t1.antiPushEnabled then
			v1016()

			return
		end

		if not p134 or not p134.Parent then
			v1016()

			return
		end

		if not Humanoid or not Humanoid.Parent or Humanoid.Health <= 0 then
			u1022 = true
			v1016()

			return
		end

		v995(p134)

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

		local Torso = p134:FindFirstChild("Torso")

		if Torso then
			local v1029 = false

			for _, child in ipairs(Torso:GetChildren()) do
				if child:IsA("BallSocketConstraint") then
					if child.Name:match("^SocketConstraint") and child.Enabled then
						v1029 = true

						break
					end
				end
			end

			if v1029 then
				v999(p134)
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

	table.insert(t54, connection7)
end

t5.UtilitiesBox:Toggle({
	Title = "Anti Push/Ragdoll",
	Default = false,
	Callback = function(p135)
		t1.antiPushEnabled = p135

		if p135 then
			if LocalPlayer.Character then
				v1019(LocalPlayer.Character)
			end

			local connection6 = LocalPlayer.CharacterAdded:Connect(function(character)
				task.wait(0.5)

				if t1.antiPushEnabled then
					v1019(character)
				end
			end)

			table.insert(t54, connection6)
		else
			v1016()
		end
	end
})
game:GetService("UserInputService")
t1.instantInteractEnabled = false

local connection6

t5.UtilitiesBox:Toggle({
	Title = "Instant Interact",
	Default = false,
	Callback = function(p136)
		t1.instantInteractEnabled = p136

		if t1.instantInteractEnabled then
			connection6 = game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt, player)
				if t1.instantInteractEnabled and player == LocalPlayer then
					fireproximityprompt(prompt)
				end
			end)
		elseif connection6 then
			connection6:Disconnect()
			connection6 = nil
		end
	end
})
t5.GameToolsBox:Toggle({
	Title = "Anti-AFK",
	Default = false,
	Callback = function(p137)
		if not p137 then
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
t5.GameToolsBox:Toggle({
	Title = "Bandage Helper",
	Default = false,
	Callback = function(p138)
		if p138 then
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
			local t55 = {
				"Freeze",
				"Slowed",
				"Action",
				"LightAction",
				"NoAttack"
			}
			local t56 = {
				"Stun",
				"Freeze",
				"Slowed",
				"Action",
				"LightAction",
				"Ragdoll",
				"NoAttack"
			}
			local t57 = {
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

			local function v1045(child)
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
				v1045(child)
			end

			table.insert(_G.BandageConns, Lighting.ChildAdded:Connect(v1045))

			local function v1048(character)
				if not character or not _G.BandageHelperActive then
					return
				end

				local Humanoid = character:WaitForChild("Humanoid", 5)

				character:WaitForChild("HumanoidRootPart", 5)

				if not Humanoid then
					return
				end

				table.insert(_G.BandageConns, (Humanoid:FindFirstChildOfClass("Animator") or Humanoid).AnimationPlayed:Connect(function(p139)
					if _G.BandageHelperActive and p139.Animation and (string.find(p139.Animation.AnimationId, "75334524397463") or p139.Animation.Name and string.find(string.lower(p139.Animation.Name), "bandage")) then
						p139:Stop()
					end
				end))
				table.insert(_G.BandageConns, character.DescendantAdded:Connect(function(descendant)
					if _G.BandageHelperActive then
						if t57[descendant.Name] or string.find(string.lower(descendant.Name), "healing") or string.find(string.lower(descendant.Name), "bandage") or string.find(string.lower(descendant.Name), "sparks") then
							descendant:Destroy()
						end
					end
				end))
			end

			if LocalPlayer2.Character then
				v1048(LocalPlayer2.Character)
			end

			table.insert(_G.BandageConns, LocalPlayer2.CharacterAdded:Connect(v1048))

			local function v1050(p140)
				table.insert(_G.BandageConns, p140.DescendantAdded:Connect(function(descendant)
					if _G.BandageHelperActive and (t57[descendant.Name] or string.find(string.lower(descendant.Name), "bandage") or string.find(string.lower(descendant.Name), "healing")) and not descendant:IsA("Script") then
						descendant:Destroy()
					end
				end))
			end

			local PlayerGui = LocalPlayer2:FindFirstChildOfClass("PlayerGui")

			if PlayerGui then
				v1050(PlayerGui)
			else
				table.insert(_G.BandageConns, LocalPlayer2.ChildAdded:Connect(function(child)
					if _G.BandageHelperActive then
						if child:IsA("PlayerGui") then
							v1050(child)
						end
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

				for _, v in ipairs(t55) do
					if Character:GetAttribute(v) ~= nil then
						Character:SetAttribute(v, nil)
					end

					if Humanoid and Humanoid:GetAttribute(v) ~= nil then
						Humanoid:SetAttribute(v, nil)
					end
				end

				for _, v in ipairs(t56) do
					local v1059 = Character:FindFirstChild(v)

					if v1059 then
						v1059:Destroy()
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
t1.espLightsOutEnabled = false

local u1064

local function v1065()
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
local function v1070()
	for _, player in pairs(Players:GetPlayers()) do
		if player.Character then
			local LightsOutESP = player.Character:FindFirstChild("LightsOutESP")

			if LightsOutESP then
				LightsOutESP:Destroy()
			end
		end
	end
end

t5.LightsOutBox = t4.LightsOut:Section({
	Opened = true,
	Title = "| Lights Out",
	Icon = "moon"
})
t5.LightsOutBox:Button({
	Title = "TP To Roof",
	Callback = function()
		if v37("LightsOut") then
			local Character = LocalPlayer.Character
			local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

			if HumanoidRootPart then
				HumanoidRootPart.CFrame = CFrame.new(198, 145, -93)
				v40("Lights Out", "Teleported to roof")
			end
		else
			v40(nil, "Lights Out is not currently running.")
		end
	end
})
t5.LightsOutBox:Toggle({
	Title = "ESP All",
	Default = false,
	Callback = function(p141)
		t1.espLightsOutEnabled = p141

		if t1.espLightsOutEnabled then
			if u1064 then
				return
			end

			u1064 = true
			task.spawn(function()
				while t1.espLightsOutEnabled do
					if not u1064 then
						break
					end

					if v37("LightsOut") then
						v1065()
					else
						v1070()
					end

					task.wait(2)
				end

				v1070()
				u1064 = nil
			end)
		else
			v1070()
		end
	end
})
t1.dashAssistEnabled = false

local t58 = {}
local u1077 = false

local function v1078()
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

	local connection7 = Animator.AnimationPlayed:Connect(function(p142)
		if not t1.dashAssistEnabled then
			return
		end

		if p142.Animation and string.find(tostring(p142.Animation.AnimationId), "99157505926076", 1, true) then
			u1077 = true

			local Humanoid2 = Character:FindFirstChild("Humanoid")

			if Humanoid2 then
				Humanoid2.AutoRotate = false
			end

			p142.Stopped:Once(function()
				u1077 = false

				local Humanoid3 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")

				if Humanoid3 then
					Humanoid3.AutoRotate = true
				end
			end)
		end
	end)

	table.insert(t58, connection7)
end

t5.LightsOutBox:Toggle({
	Title = "Dash Assist",
	Default = false,
	Callback = function(p143)
		t1.dashAssistEnabled = p143

		if t1.dashAssistEnabled then
			v1078()

			local connection7 = LocalPlayer.CharacterAdded:Connect(function()
				task.wait(0.5)

				if t1.dashAssistEnabled then
					v1078()
				end
			end)

			table.insert(t58, connection7)

			local connection8 = game:GetService("RunService").Heartbeat:Connect(function()
				if not t1.dashAssistEnabled or not u1077 then
					return
				end

				if not v37("LightsOut") then
					return
				end

				local Character = LocalPlayer.Character
				local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

				if not HumanoidRootPart then
					return
				end

				local v1089
				local huge = math.huge

				for _, player in pairs(Players:GetPlayers()) do
					if player ~= LocalPlayer and player.Character then
						if player.Character:FindFirstChild("HumanoidRootPart") then
							if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
								local Magnitude = (player.Character.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude

								if Magnitude < huge then
									huge = Magnitude
									v1089 = player
								end
							end
						end
					end
				end

				if v1089 and v1089.Character then
					if v1089.Character:FindFirstChild("HumanoidRootPart") then
						local Position = v1089.Character.HumanoidRootPart.Position

						HumanoidRootPart.CFrame = CFrame.lookAt(HumanoidRootPart.Position, Vector3.new(Position.X, HumanoidRootPart.Position.Y, Position.Z))
					end
				end
			end)

			table.insert(t58, connection8)
		else
			u1077 = false

			for _, v in pairs(t58) do
				pcall(function()
					v:Disconnect()
				end)
			end

			table.clear(t58)
		end
	end
})
t1.autoTPRoofUnder30Enabled = false
t2.autoTPRoofUnder30Thread = nil
t5.LightsOutBox:Toggle({
	Title = "Auto TP Roof Health Under 30",
	Default = false,
	Callback = function(p144)
		t1.autoTPRoofUnder30Enabled = p144

		if t1.autoTPRoofUnder30Enabled then
			if t2.autoTPRoofUnder30Thread then
				return
			end

			t2.autoTPRoofUnder30Thread = true
			task.spawn(function()
				local v1097 = false

				while t2.autoTPRoofUnder30Thread and t1.autoTPRoofUnder30Enabled do
					if v37("LightsOut") then
						local Character = LocalPlayer.Character
						local Humanoid = Character and Character:FindFirstChild("Humanoid")
						local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

						if Humanoid and HumanoidRootPart and Humanoid.Health > 0 and Humanoid.Health <= 30 and not v1097 then
							HumanoidRootPart.CFrame = CFrame.new(198, 145, -93)
							v1097 = true
						end
					else
						v1097 = false
					end

					task.wait(0.5)
				end

				t2.autoTPRoofUnder30Thread = nil
			end)
		end
	end
})
t5.LightsOutBox:Toggle({
	Title = "Full Bright",
	Default = false,
	Callback = function(p145)
		_G.LightsOutFullBrightEnabled = p145

		if p145 then
			if not _G.LightsOutFullBrightCacheThread then
				_G.LightsOutFullBrightCacheThread = true
				task.spawn(function()
					_G.CachedBrightObjects = {}

					local connection7 = workspace.DescendantAdded:Connect(function(descendant)
						if _G.LightsOutFullBrightEnabled and v37("LightsOut") and (descendant:IsA("Light") or descendant:IsA("BasePart") and descendant.Name == "ChangeColorLightsOut") then
							table.insert(_G.CachedBrightObjects, descendant)
						end
					end)
					local v1102 = false

					while _G.LightsOutFullBrightCacheThread do
						local LightsOut = _G.LightsOutFullBrightEnabled and v37("LightsOut")

						if LightsOut and not v1102 then
							table.clear(_G.CachedBrightObjects)

							local LightsOutMap = workspace:FindFirstChild("LightsOutMap") or workspace
							local n17 = 0

							for _, descendant in ipairs(LightsOutMap:GetDescendants()) do
								if not _G.LightsOutFullBrightCacheThread then
									break
								end

								if descendant:IsA("Light") or descendant:IsA("BasePart") and descendant.Name == "ChangeColorLightsOut" then
									table.insert(_G.CachedBrightObjects, descendant)
								end

								n17 += 1

								if n17 % 500 == 0 then
									task.wait()
								end
							end
						elseif not LightsOut then
							if v1102 then
								table.clear(_G.CachedBrightObjects)
							end
						end

						v1102 = LightsOut
						task.wait(2)
					end

					connection7:Disconnect()
				end)
			end

			if not _G.LightsOutFullBrightRenderThread then
				_G.LightsOutFullBrightRenderThread = game:GetService("RunService").RenderStepped:Connect(function()
					if _G.LightsOutFullBrightEnabled then
						if v37("LightsOut") then
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
t5.GuardBox = t4.Guard:Section({
	Opened = true,
	Title = "| Guard Mode",
	Icon = "shield"
})
t5.GuardBox:Button({
	Title = "Free Perm Guard",
	Callback = function()
		LocalPlayer:SetAttribute("__OwnsPermGuard", true)
		v40(" Guard", "Free Perm Guard Activated")
	end
})
t1.guardQteEnabled = false
t2.guardQteThread = nil
t5.GuardBox:Toggle({
	Title = "Auto QTE Event (Guard)",
	Default = false,
	Callback = function(p146)
		t1.guardQteEnabled = p146

		if t1.guardQteEnabled and not t2.guardQteThread then
			t2.guardQteThread = task.spawn(function()
				local t59 = {}

				while t1.guardQteEnabled do
					if LocalPlayer:GetAttribute("IsGuard") then
						local v1114 = v46()

						if v1114 and v1114.ActiveButtons then
							for k, activeButton in pairs(v1114.ActiveButtons) do
								if not t59[k] and activeButton then
									t59[k] = true

									if t1.guardQteEnabled and v1114.ActiveButtons and v1114.ActiveButtons[k] then
										pcall(function()
											v1114.Pressed(false, v1114.ActiveButtons[k])
										end)
									end
								end
							end

							for k in pairs(t59) do
								if not v1114.ActiveButtons[k] then
									t59[k] = nil
								end
							end
						end
					else
						table.clear(t59)
					end

					task.wait()
				end

				t2.guardQteThread = nil
			end)
		end
	end
})
t1.autoKillRedArrowEnabled = false
t2.autoKillRedArrowThread = nil

local function v1118(p147)
	return p147:FindFirstChild("TypeOfGuard") ~= nil
end
local function v1119()
	local Character = LocalPlayer.Character

	if not Character then
		return nil
	end

	local t60 = {
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
		if t60[child.Name] then
			return child
		end
	end

	return nil
end

t5.GuardBox:Toggle({
	Title = "Auto Shoot",
	Default = false,
	Callback = function(p148)
		t1.autoKillRedArrowEnabled = p148

		if t1.autoKillRedArrowEnabled then
			if t2.autoKillRedArrowThread then
				return
			end

			t2.autoKillRedArrowThread = true
			task.spawn(function()
				while t1.autoKillRedArrowEnabled and t2.autoKillRedArrowThread do
					local Live = workspace:FindFirstChild("Live")
					local v1125 = v1119()
					local Character = LocalPlayer.Character
					local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

					if Live then
						if v1125 and HumanoidRootPart then
							for _, child in ipairs(Live:GetChildren()) do
								if child:IsA("Model") then
									local HumanoidRootPart2 = child:FindFirstChild("HumanoidRootPart")
									local Humanoid = child:FindFirstChild("Humanoid")

									if HumanoidRootPart2 and Humanoid and Humanoid.Health > 0 and child ~= Character then
										local v1132 = false
										local GuardCanKillLockOn = HumanoidRootPart2:FindFirstChild("GuardCanKillLockOn")

										if GuardCanKillLockOn then
											if GuardCanKillLockOn:IsA("BillboardGui") then
												v1132 = true
											end
										end

										if v1132 then
											local s4 = "Unknown"

											for _, player in pairs(Players:GetPlayers()) do
												if player.Character == child then
													s4 = player.Name

													break
												end
											end

											local t61 = {
												v1125,
												{
													ClientRayNormal = Vector3.yAxis,
													FiredGun = true,
													bulletCF = CFrame.new(),
													ClientRayInstance = HumanoidRootPart2,
													SecondaryHitTargets = {},
													ClientRayPosition = HumanoidRootPart2.Position,
													HitTargets = {
														[s4] = "Torso"
													},
													bulletSizeC = Vector3.new(0.01, 0.01, 100),
													NoMuzzleFX = false,
													FirePosition = HumanoidRootPart.Position + Vector3.new(0, 1.5, 0)
												}
											}

											pcall(function()
												game:GetService("ReplicatedStorage").Remotes.FiredGunClient:FireServer(unpack(t61))
											end)
										end
									end
								end
							end
						end
					end

					game:GetService("RunService").Heartbeat:Wait()
				end

				t2.autoKillRedArrowThread = nil
			end)
		end
	end
})
t1.infiniteAmmoGuardEnabled = false
t2.infiniteAmmoGuardThread = nil
t5.GuardBox:Toggle({
	Title = "Infinite Ammo",
	Default = false,
	Callback = function(p149)
		t1.infiniteAmmoGuardEnabled = p149

		if t1.infiniteAmmoGuardEnabled then
			if t2.infiniteAmmoGuardThread then
				return
			end

			t2.infiniteAmmoGuardThread = true
			task.spawn(function()
				while t1.infiniteAmmoGuardEnabled and t2.infiniteAmmoGuardThread do
					if LocalPlayer:GetAttribute("IsGuard") then
						local v1138 = v1119()

						if v1138 then
							local t62 = {
								v1138,
								{
									ReloadingGun = true
								}
							}

							pcall(function()
								game:GetService("ReplicatedStorage").Remotes.FiredGunClient:FireServer(unpack(t62))
							end)
						end
					end

					task.wait(1)
				end

				t2.infiniteAmmoGuardThread = nil
			end)
		end
	end
})
t1.autoShootAAEnabled = false
t2.autoShootAAThread = nil

local function v1140()
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
		local v1144 = Character:FindFirstChild(v)

		if v1144 then
			return v1144
		end
	end

	return nil
end

t3.lastAARLGLTPTime = 0
t5.AdminAbuseBox = t4.Tools:Section({
	Opened = true,
	Title = "| Admin Abuse Tools",
	Icon = "terminal"
})
t5.AdminAbuseBox:Button({
	Title = "RLGL TP Start",
	Callback = function()
		if not v37("AdminAbuseRedLightGreenLight") then
			v40(nil, "Admin Abuse RLGL is not currently running.")

			return
		end

		if tick() - t3.lastAARLGLTPTime < 10 then
			v40(nil, "Please wait before teleporting again (" .. math.ceil(10 - (tick() - t3.lastAARLGLTPTime)) .. "s)")

			return
		end

		v56(CFrame.new(-1375, -30, 22))
		t3.lastAARLGLTPTime = tick()
		v40(nil, "Teleported to Start")
	end
})
t5.AdminAbuseBox:Button({
	Title = "RLGL TP End",
	Callback = function()
		if not v37("AdminAbuseRedLightGreenLight") then
			v40(nil, "Admin Abuse RLGL is not currently running.")

			return
		end

		if not (tick() - t3.lastAARLGLTPTime < 10) then
			v56(CFrame.new(-1361, -28, 701))
			t3.lastAARLGLTPTime = tick()
			v40(nil, "Teleported to End")

			return
		end

		v40(nil, "Please wait before teleporting again (" .. math.ceil(10 - (tick() - t3.lastAARLGLTPTime)) .. "s)")
	end
})
t5.AdminAbuseBox:Toggle({
	Title = "Auto Shoot PBRS (AA)",
	Default = false,
	Callback = function(p150)
		t1.autoShootAAEnabled = p150

		if t1.autoShootAAEnabled then
			if t2.autoShootAAThread then
				return
			end

			t2.autoShootAAThread = true
			task.spawn(function()
				while t1.autoShootAAEnabled and t2.autoShootAAThread do
					if v1140() and LocalPlayer.Character then
						if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
							local v1145

							for _, child in pairs(workspace:GetChildren()) do
								if child:IsA("Model") or child:IsA("Folder") then
									local Live = child:FindFirstChild("Live")

									if Live then
										if Live:IsA("Folder") then
											v1145 = Live

											break
										end
									end
								end
							end

							if not v1145 then
								for _, descendant in pairs(workspace:GetDescendants()) do
									if descendant.Name == "Live" and descendant:IsA("Folder") then
										v1145 = descendant

										break
									end
								end
							end

							if v1145 then
								for _, child in pairs(v1145:GetChildren()) do
									if child:IsA("Model") then
										if string.match(string.lower(child.Name), "peabert") then
											local BasePart = child:FindFirstChildWhichIsA("BasePart", true)

											if BasePart then
												local v1154 = v1140()

												if v1154 then
													local t63 = {
														v1154,
														{
															ClientRayNormal = Vector3.yAxis,
															FiredGun = true,
															bulletCF = CFrame.new(BasePart.Position),
															ClientRayInstance = BasePart,
															SecondaryHitTargets = {},
															ClientRayPosition = BasePart.Position,
															HitTargets = {
																[child.Name] = BasePart.Name
															},
															bulletSizeC = Vector3.new(0.01, 0.01, 10),
															NoMuzzleFX = false,
															FirePosition = LocalPlayer.Character.HumanoidRootPart.Position
														}
													}

													pcall(function()
														game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("FiredGunClient"):FireServer(unpack(t63))
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

				t2.autoShootAAThread = nil
			end)
		end
	end
})

local UISettings = t4.UISettings
local u1157 = false

UISettings:Section({
	Opened = true,
	Title = "Menu"
}):Toggle({
	Title = "Unlock Mouse When Menu Open",
	Default = false,
	Callback = function(p151)
		u1157 = p151

		if Library then
			Library.UnlockMouseWhileOpen = p151
		end

		if not p151 then
			if Library and Library.ScreenGui then
				for _, child in ipairs(Library.ScreenGui:GetChildren()) do
					if child:IsA("TextButton") and child.Size == UDim2.fromScale(0, 0) then
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
		if Library and not Library.Unloaded then
			local u1162 = false

			pcall(function()
				if type(Library.Toggled) == "boolean" then
					u1162 = not Library.Toggled
				elseif Library.MainGui then
					u1162 = not Library.MainGui.Enabled
				end
			end)

			if not (GuiService.MenuIsOpen or u1162 or u1157 or not Library.ScreenGui) then
				for _, child in ipairs(Library.ScreenGui:GetChildren()) do
					if child:IsA("TextButton") and child.Size == UDim2.fromScale(0, 0) then
						child.Modal = false
					end
				end
			end
		end
	end)
end)
pcall(function()
end)

local v1165 = t4.UISettings:Section({
	Opened = true,
	Title = "| Configuration",
	Icon = "settings"
})

local function v1166()
	pcall(function()
		local HttpService2 = game:GetService("HttpService")
		local t64 = {}

		for k, v in pairs(t1) do
			if type(v) == "boolean" or type(v) == "number" or type(v) == "string" then
				t64[k] = v
			end
		end

		if isfolder and not isfolder("UwuHub") then
			pcall(makefolder, "UwuHub")
		end

		if writefile then
			writefile("UwuHub/config.json", HttpService2:JSONEncode(t64))
			v40("Config", "Configuration saved successfully!")
		else
			v40("Config", "Your executor does not support writefile!")
		end
	end)
end
local function v1171()
	pcall(function()
		local HttpService2 = game:GetService("HttpService")

		if isfile and isfile("UwuHub/config.json") and readfile then
			local json = readfile("UwuHub/config.json")
			local data = HttpService2:JSONDecode(json)

			if data and type(data) == "table" then
				for k, v in pairs(data) do
					t1[k] = v
				end

				if updateCustomCursor then
					updateCustomCursor()
				end

				v40("Config", "Configuration loaded successfully!")
			end
		else
			v40("Config", "No saved config found!")
		end
	end)
end

v1165:Button({
	Title = "Save Config",
	Callback = function()
		v1166()
	end
})
v1165:Button({
	Title = "Load Config",
	Callback = function()
		v1171()
	end
})
v1165:Toggle({
	Title = "Set Auto Load",
	Default = false,
	Callback = function(p152)
		pcall(function()
			if isfolder then
				if not isfolder("UwuHub") then
					pcall(makefolder, "UwuHub")
				end
			end

			if writefile then
				writefile("UwuHub/autoload.txt", p152 and "true" or "false")
			end

			v40("Config", "Auto load set to " .. tostring(p152))
		end)
	end
})
v1165:Keybind({
	Title = "UI Toggle Keybind",
	Default = "G",
	Callback = function(p153)
		pcall(function()
			if typeof(p153) == "string" then
				v22.ToggleKey = Enum.KeyCode[p153]
			else
				v22.ToggleKey = p153
			end
		end)
	end
})
t4.UISettings:Section({
	Opened = true,
	Title = "| Theme Settings",
	Icon = "palette"
}):Dropdown({
	Title = "Select Theme",
	Values = {
		"Dark",
		"Light",
		"Rose",
		"Rose Pine",
		"Aqua",
		"Catppuccin",
		"Red",
		"Purple",
		"Midnight"
	},
	Default = "Dark",
	Callback = function(p154)
		if not p154 or type(p154) ~= "string" then
			return
		end

		pcall(function()
			if lib and lib.SetTheme then
				lib:SetTheme(p154)
			end
		end)
	end
})
pcall(function()
	if isfile and isfile("UwuHub/autoload.txt") and readfile and readfile("UwuHub/autoload.txt") == "true" then
		v1171()
	end
end)

local v1177 = t4.UISettings:Section({
	Opened = true,
	Title = "Custom Cursor"
})

t1.customCursorEnabled = true
t1.customCursorTextEnabled = true
t1.customCursorRGBEnabled = true

local ScreenGui
local connection7

local function v1180()
	task.spawn(function()
		if t1.customCursorEnabled then
			if ScreenGui then
				if ScreenGui:FindFirstChild("CursorImage") then
					ScreenGui.CursorImage.Image = "rbxassetid://10769687353"
				end

				if ScreenGui:FindFirstChild("CursorText") then
					ScreenGui.CursorText.Visible = t1.customCursorTextEnabled
				end
			else
				ScreenGui = Instance.new("ScreenGui")
				ScreenGui.Name = "UwUCustomCursor"
				ScreenGui.DisplayOrder = 99999
				ScreenGui.IgnoreGuiInset = true

				local ImageLabel = Instance.new("ImageLabel")

				ImageLabel.Name = "CursorImage"
				ImageLabel.BackgroundTransparency = 1
				ImageLabel.Image = "rbxassetid://10769687353"
				ImageLabel.Size = UDim2.new(0, 32, 0, 32)
				ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
				ImageLabel.Parent = ScreenGui

				local TextLabel = Instance.new("TextLabel")

				TextLabel.Name = "CursorText"
				TextLabel.BackgroundTransparency = 1
				TextLabel.Text = "UwU"
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.TextStrokeTransparency = 0
				TextLabel.Font = Enum.Font.GothamBold
				TextLabel.TextSize = 14
				TextLabel.Size = UDim2.new(0, 100, 0, 20)
				TextLabel.AnchorPoint = Vector2.new(0.5, 0)
				TextLabel.Visible = t1.customCursorTextEnabled
				TextLabel.Parent = ScreenGui

				local CoreGui = game:GetService("CoreGui")
				local ok, parent = pcall(function()
					return gethui and gethui()
				end)
				local ok2, parent2 = pcall(function()
					return CoreGui.Name and CoreGui
				end)

				if ok and parent then
					ScreenGui.Parent = parent
				elseif ok2 and parent2 then
					ScreenGui.Parent = parent2
				else
					local LocalPlayer2 = game:GetService("Players").LocalPlayer

					if LocalPlayer2 then
						local PlayerGui = LocalPlayer2:FindFirstChild("PlayerGui")

						if PlayerGui then
							ScreenGui.Parent = PlayerGui
						else
							ScreenGui.Parent = LocalPlayer2:WaitForChild("PlayerGui", 10)
						end
					end
				end
			end

			if not connection7 then
				local UserInputService_ = game:GetService("UserInputService")
				local RunService_ = game:GetService("RunService")

				UserInputService_.MouseIconEnabled = false
				connection7 = RunService_.RenderStepped:Connect(function()
					pcall(function()
						UserInputService_.MouseIconEnabled = false

						if ScreenGui then
							local mouseLocation = UserInputService_:GetMouseLocation()
							local CursorImage = ScreenGui:FindFirstChild("CursorImage")

							if CursorImage then
								CursorImage.Position = UDim2.new(0, mouseLocation.X, 0, mouseLocation.Y)
								CursorImage.Rotation += 2.5

								if t1.customCursorRGBEnabled then
									CursorImage.ImageColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
								else
									CursorImage.ImageColor3 = Color3.new(1, 1, 1)
								end
							end

							local CursorText = ScreenGui:FindFirstChild("CursorText")

							if CursorText then
								CursorText.Position = UDim2.new(0, mouseLocation.X, 0, mouseLocation.Y + 20)

								if t1.customCursorRGBEnabled then
									CursorText.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
								else
									CursorText.TextColor3 = Color3.new(1, 1, 1)
								end
							end
						end
					end)
				end)
			end
		else
			pcall(function()
				game:GetService("UserInputService").MouseIconEnabled = true
			end)

			if connection7 then
				connection7:Disconnect()
				connection7 = nil
			end

			if ScreenGui then
				ScreenGui:Destroy()
				ScreenGui = nil
			end
		end
	end)
end

v1177:Toggle({
	Title = "Disable RGB Effect",
	Default = false,
	Callback = function(p155)
		t1.customCursorRGBEnabled = not p155
	end
})
v1177:Toggle({
	Title = "Enable Custom Cursor",
	Default = true,
	Callback = function(p156)
		t1.customCursorEnabled = p156
		v1180()
	end
})
v1177:Toggle({
	Title = "Under Cursor Text",
	Default = true,
	Callback = function(p157)
		t1.customCursorTextEnabled = p157
		v1180()
	end
})
v1180()
lib:Notify({
	Title = "Uwu Hub",
	Content = "Please Showcase My Script On Tiktok or Somewhere",
	Duration = 10
})

if v3 then
	task.wait(1)
	lib:Notify({
		Title = "Warning",
		Content = "GAME VERSION CHANGE DETECTED. Some features may be patched.",
		Duration = 10
	})
end

task.spawn(function()
	local HttpService2 = game:GetService("HttpService")

	local function v1196(p158)
		return HttpService2:UrlEncode(p158)
	end

	local v1197 = v1196(game:GetService("Players").LocalPlayer.Name)
	local inkGame = v1196("Ink Game")

	while true do
		local v1199 = "https://platinstudio.xyz" .. "/iwasactive?user=" .. v1197 .. "&game=" .. inkGame

		pcall(function()
			game:HttpGetAsync(v1199)
		end)
		task.wait(25)
	end
end)
task.spawn(function()
	local Players2 = game:GetService("Players")

	game:GetService("StarterGui")

	local Workspace2 = game:GetService("Workspace")

	if _G.PH_Detector_Cleanup then
		pcall(function()
			_G.PH_Detector_Cleanup()
		end)
		_G.PH_Detector_Cleanup = nil
	end

	local t65 = {}
	local t66 = {}

	local function v1204(p159)
		for _, descendant in pairs(p159:GetDescendants()) do
			if not descendant:IsA("JointInstance") or not descendant.Part1 or not descendant.Part0 then
				continue
			end

			local Parent = descendant.Part1.Parent
			local Parent2 = descendant.Part0.Parent

			if Parent and Parent:IsA("Model") and Parent:FindFirstChild("Humanoid") and Parent ~= p159 then
				return Parent
			end

			if Parent2 and Parent2:IsA("Model") and Parent2:FindFirstChild("Humanoid") and Parent2 ~= p159 then
				return Parent2
			end
		end

		local HumanoidRootPart = p159:FindFirstChild("HumanoidRootPart")

		if not HumanoidRootPart then
			return nil
		end

		local function v1210(p160)
			if p160 then
				if p160:IsA("Model") and p160 ~= p159 and p160:FindFirstChild("Humanoid") and p160:FindFirstChild("HumanoidRootPart") and (p160.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude < 6 then
					local Humanoid = p160:FindFirstChild("Humanoid")
					local Animator = Humanoid and Humanoid:FindFirstChild("Animator")

					if Animator then
						for _, v in pairs(Animator:GetPlayingAnimationTracks()) do
							if (v.Animation and v.Animation.AnimationId:match("%d+") or "") == "82142761681917" then
								return p160
							end
						end
					end
				end
			end

			return nil
		end

		for _, player in pairs(Players2:GetPlayers()) do
			local v1217 = v1210(player.Character)

			if v1217 then
				return v1217
			end
		end

		local Live = Workspace2:FindFirstChild("Live") or Workspace2:FindFirstChild("Characters")

		if Live then
			for _, child in pairs(Live:GetChildren()) do
				local v1221 = v1210(child)

				if v1221 then
					return v1221
				end
			end
		else
			for _, child in pairs(Workspace2:GetChildren()) do
				local v1224 = v1210(child)

				if v1224 then
					return v1224
				end
			end
		end

		return nil
	end
	local function v1225(p161, p162)
		if t65[p161] then
			return
		end

		t65[p161] = true

		local connection8 = p161.AnimationPlayed:Connect(function(p163)
			if not p163 or not p163.Animation then
				return
			end

			if (p163.Animation.AnimationId:match("%d+") or "") == "71318091779666" then
				task.delay(0.2, function()
					v1204(p162)
				end)
			end
		end)

		table.insert(t66, connection8)
	end
	local function v1227(character)
		if character:IsA("Model") then
			local Humanoid = character:WaitForChild("Humanoid", 3)

			if Humanoid then
				local Animator = Humanoid:WaitForChild("Animator", 3)

				if Animator then
					v1225(Animator, character)
				end
			end
		end
	end

	_G.PH_Detector_Cleanup = function()
		for _, v in pairs(t66) do
			if v then
				v:Disconnect()
			end
		end

		t66 = {}
		t65 = {}
	end

	for _, player in pairs(Players2:GetPlayers()) do
		if player.Character then
			task.spawn(v1227, player.Character)
		end

		local connection8 = player.CharacterAdded:Connect(v1227)

		table.insert(t66, connection8)
	end

	local connection8 = Players2.PlayerAdded:Connect(function(player)
		local connection8 = player.CharacterAdded:Connect(v1227)

		table.insert(t66, connection8)
	end)

	table.insert(t66, connection8)

	for _, child in pairs(Workspace2:GetChildren()) do
		task.spawn(v1227, child)
	end

	local connection9 = Workspace2.ChildAdded:Connect(v1227)

	table.insert(t66, connection9)
end)
