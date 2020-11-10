pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
p={}
s={}
n=500
bx=56
by=110
bw=10
w=128
h=32
z=0
fn=100
v=1
o=print
r=rnd
for c=8,13 do s[c] = 0 end
::_::
if(btn(0))bx=max(0,bx-1)
if(btn(1))bx=min(w-bw,bx+1)
for i=0,n do
	if(p[i]!=nil)then
		e=p[i]
		if(e.y>w)then
			p[i]=nil
		else
			e.dx=e.dx*0.99
			e.dy+=e.ddy
			e.x+=e.dx
			y=e.y
			e.y+=e.dy
			if y<by and e.y>=by and e.x>=bx and e.x<bx+bw then
				for c=8,13 do s[c]=max(0,s[c]-0.5) end
				s[p[i].c]+=1.5
				p[i]=nil
			else
				p[i]=e
			end
		end
	end
end
if r(100) > 95 then
	c=flr(r(5))+8
	x=flr(r(w))
	y=flr(r(h))
	k=0
	for i=0,n do
		if(k>fn)break
		if p[i]==nil then
			a=r()
			vp=r()
			dx=cos(a)*v*vp
			dy=sin(a)*v*vp
			e={x=x,y=y,dx=cos(a)*v*vp,dy=sin(a)*v*vp,ddy=0.02,c=c}
			p[i]=e
			k+=1
		end
	end
end
cls()
line(bx,by,bx+bw,by,7)
for i = 0,n do if(p[i] != nil)pset(p[i].x,p[i].y,p[i].c)end
for c,q in pairs(s) do
	if not win and q >= 110 then
		win=true
		t=flr(time()*100)/100
		break
	end
end
if win==true then
	z=(z+1)%16
	o("win!",60,60,z)
	o(t.." secs",55,68,z)
else
	o(flr(time()*100)/100,4,4,15)
	for c,q in pairs(s) do
		line(10,110+c,10+q,110+c,c)
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
