function output1=control_law(in)
global k1 k2 k3
time=in(1);
q=in(2:4);x=q(1);y=q(2);t1=q(3);
qr=in(5:7);xr=qr(1);yr=qr(2);t1r=qr(3);
dqr=in(8:10);dxr=dqr(1);dyr=dqr(2);dt1r=dqr(3);


u1r=sqrt(dxr^2+dyr^2);



T=[cos(t1r) sin(t1r) 0;-sin(t1r) cos(t1r) 0;0 0 1];
e=T*[x-xr;y-yr;t1-t1r];
z1=e(1);z2=e(2);z3=tan(e(3));
% w1=-k1*abs(u1r)*(z1+z2*z3);
% w2=1*abs(u1r)*(z2-z1*z3);
% w3=-k2*u1r*z2-k3*abs(u1r)*z3;


w1=-abs(u1r)*(k1*z1+k2*z2*z3);
w2=-1*abs(u1r)*(k2*z2-k1*z1*z3);
w3=-k2*u1r*z2/k3-abs(u1r)*z3;

u1=(w1+u1r)/cos(e(3));
u2=w2/cos(e(3));
u3=w3+dt1r;

% u1=u1r-k1*abs(u1r)*z1;
% u3=dt1r-k2*u1r*z2-k3*abs(u1r)*tan(z3);



u=[u1;u2;u3];

output1=[u;e];
