mouse = {}

function mouse.init()
	mouse.cursor = love.mouse.newCursor("resources/images/cursor.png", 0, 0)
	mouse.cursorRed = love.mouse.newCursor("resources/images/cursorRed.png", 0, 0)
	mouse.cursorBlue = love.mouse.newCursor("resources/images/cursorBlue.png", 0, 0)
	mouse.cursorColour = "blue"
	love.mouse.setCursor(mouse.cursorBlue)
end

function mouse.toggleColour(button)
	if button == "r" then
		if mouse.cursorColour == "red" then
			mouse.cursorColour = "blue"
			love.mouse.setCursor(mouse.cursorBlue)
		elseif mouse.cursorColour == "blue" then
			mouse.cursorColour = "red"
			love.mouse.setCursor(mouse.cursorRed)
		end
	end
end