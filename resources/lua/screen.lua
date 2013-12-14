screen = {}

function screen.init()
	screen.w = love.window.getWidth()
	screen.h = love.window.getHeight()
end

function screen.x(pos)
	return (pos/1000)*screen.w
end
function screen.y(pos)
	return (pos/1000)*screen.h
end

function screen.convert(axis, num)
	if axis == "x" then
		return (num/screen.w)*1000
	elseif axis == "y" then
		return (num/screen.h)*1000
	end
end