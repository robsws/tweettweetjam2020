pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
parts={}
n=500
barx=56
bary=110
barw=8
w=128
score=0
wincol=0

function updatepart(i)
	local part = parts[i]
	if part.y > w then
		parts[i] = nil
	else
		part.dx = part.dx * 0.9
		part.dy += part.ddy
		part.x += part.dx
		prevy = part.y
		part.y += part.dy
		if prevy < bary and part.y >= bary and part.x >= barx and part.x < barx+barw then
			score += parts[i].score
			parts[i] = nil
		else
			parts[i] = part
		end
	end
end

function _init()
	for i=0,n do
		parts[i]=nil
	end
end

function _update()
	wincol = (wincol+1)%16
	if btn(0) then
		barx -= 1
	elseif btn(1) then
		barx += 1
	end
	for i=0,n do
		dxrng=rnd(100)
		tyrng=rnd(100)
		if tyrng < 75 then
			typ = -1
		else
			typ = 1
		end
		if parts[i] == nil then
			if dxrng > 99.8 then
				local xpos = flr(rnd(w))
				local initdx = flr(rnd(8))-4
				local initdy = rnd(0.5)
				local part = {x=xpos,y=0,dx=initdx,dy=initdy,ddy=0.02,score=typ}
				parts[i] = part
			end
		else
			updatepart(i)
		end
	end
end

function _draw()
	cls()
	line(barx,bary,barx+barw,bary,7)
	for i = 0,n do
		if parts[i] != nil then
			if parts[i].score < 0 then
				col = 8
			else
				col = 11
			end
			pset(parts[i].x,parts[i].y,col)
		end
	end
	if score >= 22 then
		print("win!", 60, 60, wincol)
	else
		print(score,10,10,7)
	end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
