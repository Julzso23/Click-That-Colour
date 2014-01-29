score = {}

function score.init()
	score.points = 0
end

function score.event(e)
	if e == "miss" then
		if score.points >= 1 then
			score.points = score.points - 1
		else
			score.points = 0
		end
	end
	if e == "out" then
		if score.points >= 3 then
			score.points = score.points - 3
		else
			score.points = 0
		end
	end
	if e == "hit" then
		score.points = score.points + 5
	end
end