function out=dynamic_control(in)
global kp1 kp2 kp3

uu=in(1:3);
uc=in(4:6);
uc_dot=in(7:9);
t=in(10);


u=uu(1);v=uu(2);r=uu(3);



dvc=[uc_dot(1);uc_dot(2);uc_dot(3)];
E1=uc(1)-u;
E2=uc(2)-v;
E3=uc(3)-r;
EE=[E1;E2;E3];


m11=215;
m22=265;
m33=80;
xu=70;
xuu=100;
yv=100;
yvv=200;
nr=50;
nrr=100;

C=[(m22/m11)*v*r-(xu/m11)*u-1*(xuu/m11)*u*abs(u);
    (-(m11*u*r/m22)-(yv*v)/m22-(yvv*v*abs(v))/m22);
    ((m11-m22)/m33)*v*u-(nr/m33)*r-1*(nrr/m33)*r*abs(r)];
gain=3000;

tau=diag([m11,m22,m33])*[dvc-C+[kp1*E1^1;kp2*E2^1;kp3*E3^1]];

out=[tau;EE];