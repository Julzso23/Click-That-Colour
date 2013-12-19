score = {}

function score.init()
	score.points = 0
	score.bonus = 0
end

function score.event(e)
	if e == "miss" then
		if score.bonus > 0 then
			score.bonus = score.bonus - 1
		end
		
		if score.points > 1 then
			score.points = score.points - 2
		else
			score.points = 0
		end
	end
	if e == "out" then
		score.bonus = 0

		if score.points > 3 then
			score.points = score.points - 4
		else
			score.points = 0
		end
	end
	if e == "hit" then
		score.points = score.points + 5 + score.bonus
		score.bonus = score.bonus + 1
	end
end