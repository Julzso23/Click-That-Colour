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
	o.colour = col
	o.spd = 500
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
		table.insert(objects.colours, obj.create(math.random(1, 800)+100, {0, 0, 255}))
	end
end

function obj:checkCollisions(mX, mY, button, key)
	if button == "l" and (screen.convert("x", mX) - self.x)^2 + (screen.convert("y", mY) - self.y)^2 <= (self.size+1)^2 then
		table.remove(objects.colours, key)
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
	end
	if self.x > 1000 then
		self.direction = "left"
	elseif self.x < -self.size then
		self.direction = "right"
	end
end

function obj:draw()
	love.graphics.setColor(self.colour)
	love.graphics.circle("fill", screen.x(self.x), screen.y(self.y), screen.x(self.size), 100)
end