function u_dot=dynamic_model(in)

uu=in(1:3);
tau=in(4:6);
t=in(7);
u=uu(1);v=uu(2);r=uu(3);
fx=tau(1);fy=tau(2);taur=tau(3);
m11=215;m22=265;m33=80;
xu=70;
xuu=100;
yv=100;
yvv=200;
nr=50;
nrr=100;

m11=m11+15*m11*(t>15)*(t<30);
m22=m22+15*m22*(t>15)*(t<30);
m33=m33+15*m33*(t>15)*(t<30);



% % uncertainties
% mnew=[m11;m22;m33]+[2.5*m11*(t>20)*(t<30);2.5*m22*(t>20)*(t<30);2.5*m33*(t>20)*(t<30)];
% tau=diag([mnew(1),mnew(2),mnew(3)])*(dvc-C+[kp1*E1^1;kp2*E2^1;kp3*E3^1]);
% out=[tau;EE];


% % disturbances
% tau=diag([m11,m22,m33])*(dvc-C+[kp1*E1^1;kp2*E2^1;kp3*E3^1]);
% tau1=tau+[2000*(t<70)*(t>30);2000*(t<70)*(t>30);2000*(t<70)*(t>30)];  
% out=[tau1;EE];


% % together
% mnew=[m11;m22;m33]+[2.5*m11*(t>15)*(t<35);2.5*m22*(t>15)*(t<35);2.5*m33*(t>15)*(t<35)];
% tau=diag([mnew(1),mnew(2),mnew(3)])*(dvc-C+[kp1*E1^1;kp2*E2^1;kp3*E3^1]);
% tau1=tau+[50000*(t<35)*(t>15);50000*(t<15)*(t>35);50000*(t<15)*(t>35)];  
% out=[tau1;EE];

u_dot=[(m22/m11)*v*r-(xu/m11)*u-1*(xuu/m11)*u*abs(u)+(1/m11)*fx;
    1*(-(m11/m22)*u*r-(yv/m22)*v-1*(yvv/m22)*v*abs(v)+(1/m22)*fy);
    ((m11-m22)/m33)*v*u-(nr/m33)*r-1*(nrr/m33)*r*abs(r)+(1/m33)*taur];
