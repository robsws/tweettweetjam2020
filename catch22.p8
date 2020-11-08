pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
parts={}
n=500

function updatepart(i)
	local part = parts[i]
	if part.y > 256 then
		parts[i] = nil
	else
		part.dx = part.dx * 0.9
		part.dy += part.ddy
		part.x += part.dx
		part.y += part.dy
		parts[i] = part
	end
end

function _init()
	for i=0,n do
		parts[i]=nil
	end
end

function _update()
	for i=0,n do
		rng=rnd(100)
		if parts[i] == nil then
			if rng > 99.8 then
				local xpos = flr(rnd(256))
				local initdx = flr(rnd(8))-4
				local initdy = rnd(0.5)
				local part = {x=xpos,y=0,dx=initdx,dy=initdy,ddy=0.02}
				parts[i] = part
			end
		else
			updatepart(i)
		end
	end
end

function _draw()
	cls()
	for i = 0,n do
		if parts[i] != nil then
			pset(parts[i].x,parts[i].y,11)
		end
	end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000