hud = {}

function hud.init()
	hud.font = love.graphics.newFont("resources/fonts/font.ttf", screen.x(1000/40))
	love.graphics.setFont(hud.font)
end

function hud.draw()
	love.graphics.setColor(0, 0, 0, 200)
	love.graphics.printf("Score: "..score.points, screen.x(1), screen.y(1), screen.x(30), "left")
end