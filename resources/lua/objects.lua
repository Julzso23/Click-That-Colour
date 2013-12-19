objects = {}
objects.timer = 0
objects.colours = {}

obj = {}
obj.__index = obj

function obj.create(x, col)
	local o = {}
	setmetatable(o, obj)

	o.x = x
	o.y = -50
	o.size = 25
	if col == 1 then
		o.colour = "red"
	else
		o.colour = "blue"
	end
	o.spd = 250
	if x >= 500 then
		o.direction = "left"
	else
		o.direction = "right"
	end

	return o
end

function objects.generate(rate, dt)
	if objects.timer < rate then
		objects.timer = objects.timer + dt
	else
		objects.timer = 0
		table.insert(objects.colours, obj.create(math.random(1, 800)+100, math.random(1, 2)))
	end
end

function obj:checkCollisions(mX, mY, button, key)
	if button == "l" then
		if mouse.cursorColour == self.colour and (screen.convert("x", mX) - self.x)^2 + (screen.convert("y", mY) - self.y)^2 <= (self.size*2)^2 then
			table.remove(objects.colours, key)
			score.event("hit")
		else
			score.event("miss")
		end
	end
end

function obj:update(dt, key)
	if self.direction == "left" then
		self.y = self.y + self.spd*dt
		self.x = self.x - (self.spd/2)*dt
	end
	if self.direction == "down" then
		self.y = self.y + self.spd*dt
	end
	if self.direction == "right" then
		self.y = self.y + self.spd*dt
		self.x = self.x + (self.spd/2)*dt
	end

	if self.y > 1000 then
		table.remove(objects.colours, key)
		score.event("out")
	end
	if self.x > 1000 then
		self.direction = "left"
	elseif self.x < -self.size then
		self.direction = "right"
	end
end

function obj:draw()
	if self.colour == "red" then
		love.graphics.setColor(255, 0, 0)
	else
		love.graphics.setColor(0, 0, 255)
	end
	love.graphics.circle("fill", screen.x(self.x), screen.y(self.y), screen.x(self.size), 100)
end