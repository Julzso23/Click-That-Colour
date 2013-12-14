function love.load()
	require("resources/lua/screen")
	require("resources/lua/objects")
	backgroundImg = love.graphics.newImage("resources/images/background.png")

	screen.init()
end

function love.update(dt)
	objects.generate(0.5, dt)
	for k, v in pairs(objects.colours) do
		v:update(dt, k)
	end
end

function love.draw()
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(backgroundImg, 0, 0, 0, screen.x(1000/1920), screen.y(1000/1080))

	for k, v in pairs(objects.colours) do
		v:draw()
	end
end

function love.mousepressed(x, y, button)
	for k, v in pairs(objects.colours) do
		v:checkCollisions(x, y, button, k)
	end
end