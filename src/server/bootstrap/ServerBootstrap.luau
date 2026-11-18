--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local ModuleStarter = require(Shared.util.ModuleStarter)

local RideDomain = require(script.Parent.Parent.domains.RideDomain)
local DispatchDomain = require(script.Parent.Parent.domains.DispatchDomain)
local TrafficSimulation = require(script.Parent.Parent.simulation.TrafficSimulation)
local ProfileStoreAdapter = require(script.Parent.Parent.adapters.ProfileStoreAdapter)

local ServerBootstrap = {}

function ServerBootstrap.start()
	ModuleStarter.startAll("server", {
		{ name = "RideDomain", start = RideDomain.start },
		{ name = "DispatchDomain", start = DispatchDomain.start },
		{ name = "TrafficSimulation", start = TrafficSimulation.start },
		{ name = "ProfileStoreAdapter", start = ProfileStoreAdapter.start },
	})
end

return ServerBootstrap
