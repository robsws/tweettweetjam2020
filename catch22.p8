pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
p={}
n=500
b=56
c=110
l=8
w=128
s=0
f=0
function u(i)
	local q = p[i]
	if q.y>w then
		p[i]=nil
	else
		q.dx = q.dx*0.9
		q.dy += q.ddy
		q.x += q.dx
		y = q.y
		q.y += q.dy
		if y<c and q.y>=c and q.x>=b and q.x<b+l then
			s+=p[i].s
			p[i]=nil
		else
			p[i]=q
		end
	end
end
function _init()
	for i=0,n do
		p[i]=nil
	end
end
function _update()
	f=(f+1)%16
	if btn(0) then
		b-=1
	elseif btn(1) then
		b+=1
	end
	for i=0,n do
		d=rnd(100)
		e=rnd(100)
		if d<75 then
			t=-1
		else
			t=1
		end
		if p[i]==nil then
			if e>99.8 then
				p[i]={x=flr(rnd(w)),y=0,dx=flr(rnd(8))-4,dy=rnd(0.5),ddy=0.02,s=t}
			end
		else
			u(i)
		end
	end
end
function _draw()
	cls()
	for i=0,n do
		if p[i]!=nil then
			if p[i].s<0 then
				r=8
			else
				r=11
			end
			pset(p[i].x,p[i].y,r)
		end
	end
	line(b,c,b+l,c,7)
	if s>=22 then
		s=999
		print("win!",60,60,f)
	else
		print(s,10,10,7)
	end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
