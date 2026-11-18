--!strict

local NumberMath = {}

function NumberMath.clamp(value: number, minimum: number, maximum: number): number
	return math.max(minimum, math.min(maximum, value))
end

return NumberMath
