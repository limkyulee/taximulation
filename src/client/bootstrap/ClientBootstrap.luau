--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local ModuleStarter = require(Shared.util.ModuleStarter)

local InputController = require(script.Parent.Parent.controllers.InputController)
local CameraController = require(script.Parent.Parent.controllers.CameraController)
local HudView = require(script.Parent.Parent.views.HudView)

local ClientBootstrap = {}

function ClientBootstrap.start()
	ModuleStarter.startAll("client", {
		{ name = "InputController", start = InputController.start },
		{ name = "CameraController", start = CameraController.start },
		{ name = "HudView", start = HudView.start },
	})
end

return ClientBootstrap
