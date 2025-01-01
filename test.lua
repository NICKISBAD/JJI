task.wait(1)
-- vars and functions

function EditAttack(Key, Attack)
	game:GetService("Players").LocalPlayer.ReplicatedData.techniques.innates[Key].Value = Attack
end

local keys= {"C", "B", "T", "X", "Z", "G", "V", "Y"}
local Attacks = {}
local SelectedKey = "none"
local SelectedAttack = "none"

function GetAttacks()
	for i,attack2 in pairs(game:GetService("ReplicatedStorage").Skills:GetChildren()) do
		if attack2:IsA("Folder") then
			table.insert(Attacks, attack2.Name)
		end
	end
end

GetAttacks()

-- Orion Library

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/pkplaysrblx/Orion-Library-Roblox-PE/refs/heads/main/i')))()

local Window = OrionLib:MakeWindow({Name = "this game is a joke", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
		Name = "Tab 1",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
})

Tab:AddLabel("Made by beri/NICKISBAD")

local GKey = Tab:AddLabel("Selected Key: ".. SelectedKey)
local GAtk = Tab:AddLabel("Selected Attack: ".. SelectedAttack)

Tab:AddDropdown({
	Name = "Attack Keys",
	Default = "Attack key to replace",
	Options = keys,
	Callback = function(a)
		SelectedKey = a
		GKey:Set("Selected Key: "..a)
	end	
})

Tab:AddDropdown({
	Name = "Attack to give",
	Default = "AttackName",
	Options = Attacks,
	Callback = function(b)
		SelectedAttack = b
		GAtk:Set("Selected Attack: "..b)
	end	
})

Tab:AddButton({
	Name = "Give Attack",
	Callback = function()
		EditAttack(SelectedKey, SelectedAttack)
	end
})