pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
parts={}
scores={}
n=500
barx=56
bary=110
barw=10
w=128
h=32
score=0
wincol=0
fn=100
v=1
for i=0,n do
	parts[i]=nil
end
for col=8,13 do
	scores[col] = 0
end
::_::
wincol = (wincol+1)%16
if btn(0) then
	barx=max(0,barx-1)
elseif btn(1) then
	barx=min(w-barw,barx+1)
end
for i=0,n do
	if parts[i] != nil then
		local part = parts[i]
		if part.y > w then
			parts[i] = nil
		else
			part.dx = part.dx * 0.99
			part.dy += part.ddy
			part.x += part.dx
			prevy = part.y
			part.y += part.dy
			if prevy < bary and part.y >= bary and part.x >= barx and part.x < barx+barw then
				for col=8,13 do
					scores[col] = max(0,scores[col]-0.5)
				end
				scores[parts[i].col] += 1.5
				parts[i] = nil
			else
				parts[i] = part
			end
		end
	end
end
// create new firework
if rnd(100) > 95 then
	col=flr(rnd(5))+8
	xpos = flr(rnd(w))
	ypos = flr(rnd(h))
	k=0
	for i=0,n do
		if k > fn then
			break
		end
		if parts[i] == nil then
			a = rnd()
			vp = rnd()
			initdx = cos(a)*v*vp
			initdy = sin(a)*v*vp
			part = {
				x=xpos,
				y=ypos,
				dx=initdx,
				dy=initdy,
				ddy=0.02,
				col=col
			}
			parts[i] = part
			k+=1
		end
	end
end
cls()
line(barx,bary,barx+barw,bary,7)
for i = 0,n do
	if parts[i] != nil then
		pset(parts[i].x,parts[i].y,parts[i].col)
	end
end
for col,score in pairs(scores) do
	if not win and score >= 110 then
		win=true
		t=flr(time()*100)/100
		break
	end
end
if win == true then
	print("win!",60,60,wincol)
	print(t.." secs",55,68,wincol)
else
	print(flr(time()*100)/100,4,4,15)
	for col,score in pairs(scores) do
		line(10,110+col,10+score,110+col,col)
	end
end
flip()goto _
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
