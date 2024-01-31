function out=controllaw_non_slip_trailer(in)
q=in(1:3);x=q(1);y=q(2);t1=q(3);
qr=in(4:6);xr=qr(1);yr=qr(2);t1r=qr(3);
dqr=in(7:9);dxr=dqr(1);dyr=dqr(2);dt1r=dqr(3);
ddqr=in(10:12);ddxr=ddqr(1);ddyr=ddqr(2);ddt1r=ddqr(3);
uu=in(13:15);u=uu(1);v=uu(2);w=uu(3);
duu=in(16:18);du=duu(1);dv=duu(2);dw=duu(3);
t=in(19);



J=[cos(t1) -u*sin(t1)-v*cos(t1);sin(t1) u*cos(t1)-v*sin(t1)];



dx=u*cos(t1)-v*sin(t1);
dy=u*sin(t1)+v*cos(t1);


xobs=0;yobs=10;
robs=sqrt((x-xobs)^2+(y-yobs)^2);
dd=1;
   
frepx=1*(x-xobs)*(robs^2-dd^2)/(robs^6);
frepy=1*(y-yobs)*(robs^2-dd^2)/(robs^6);

A=[-dv*sin(t1)
    dv*cos(t1)];

input=J^-1*(-A+[ddxr;ddyr]-diag([5 5])*[dx-dxr;dy-dyr]-diag([5 5])*[x-xr;y-yr]+0*[1*frepx;1*frepy]*(robs<dd));

du=input(1);
w=input(2);

out=[du;w];