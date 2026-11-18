--!strict

local ModuleStarter = {}

export type Startable = {
	name: string,
	start: () -> (),
}

function ModuleStarter.startAll(scopeName: string, modules: { Startable })
	for _, moduleEntry in ipairs(modules) do
		print(string.format("[%s] starting %s", scopeName, moduleEntry.name))
		moduleEntry.start()
	end
end

return ModuleStarter
