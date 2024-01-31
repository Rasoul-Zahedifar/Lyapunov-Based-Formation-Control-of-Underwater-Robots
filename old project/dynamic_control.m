function out=dynamic_control(in)


uu=in(1:3);
uc=in(4:5);
uc_dot=in(6:7);
t=in(8);


u=uu(1);v=uu(2);r=uu(3);

kp2=10000;kp1=kp2;

dvc=[uc_dot(1);uc_dot(2)];
E1=uc(1)-u;
E2=uc(2)-r;
EE=[E1;E2];


m11=215;
m22=265;
m33=80;
xu=70;
xuu=100;
yv=100;
yvv=200;
nr=50;
nrr=100;

C=[(m22)*v*r-(xu)*u-1*(xuu)*u*abs(u);
    ((m11-m22))*v*u-(nr)*r-1*(nrr)*r*abs(r)];
gain=3000;

tau=dvc-C+[kp1*E1^1;kp2*E2^1]-0*gain*[sign(E1);sign(E2)]/(norm(EE)+0.1);

out=[tau;EE];