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

u_dot=[(m22/m11)*v*r-(xu/m11)*u-1*(xuu/m11)*u*abs(u)+(1/m11)*fx;
    1*(-(m11/m22)*u*r-(yv/m22)*v-1*(yvv/m22)*v*abs(v)+(1/m22)*fy);
    ((m11-m22)/m33)*v*u-(nr/m33)*r-1*(nrr/m33)*r*abs(r)+(1/m33)*taur];
