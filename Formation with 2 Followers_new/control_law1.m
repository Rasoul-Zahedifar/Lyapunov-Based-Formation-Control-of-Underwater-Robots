function output1=control_law1(in)
global  dd kk1 kk2 kk3
t=in(1);
q=in(2:4);x0=q(1);y0=q(2);t1=q(3);
qr=in(5:7);xr=qr(1);yr=qr(2);t1r=qr(3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q1=in(8:10);t1_1=q1(3);x1=q1(1)+dd*cos(t1_1);y1=q1(2)+dd*sin(t1_1);
uc=in(11:13);uu=uc(1);vv=uc(2);ww=uc(3);
t1_1d=in(14);
l1d=in(15);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sai_d=in(16);        %%%%% Formation 3
% sai_d=in(16);          %%%%% Formation 1

x1d=x0+l1d*cos(sai_d+t1)-dd*cos(t1_1);
y1d=y0+l1d*sin(sai_d+t1)-dd*sin(t1_1);


T1=[cos(t1_1) sin(t1_1) 0;-sin(t1_1) cos(t1_1) 0;0 0 1];


eps=[x1d-x1
    y1d-y1
    t1_1d-t1_1];

e1=T1*eps;


uu1=kk1*e1(1)+uu*cos(t1-t1_1)-vv*sin(t1-t1_1)-l1d*ww*sin(sai_d+t1-t1_1);
ww1=(uu*sin(t1-t1_1)+vv*cos(t1-t1_1)+l1d*ww*cos(sai_d+t1-t1_1)+kk2*e1(2)+kk3*e1(3))/dd;


dl1d=0;
dsai_d=0;


dt1_1d=(uu*sin(t1-t1_1)-vv*cos(t1-t1_1)+l1d*(ww+dsai_d)*cos(sai_d+t1-t1_1)+dl1d*sin(sai_d+t1-t1_1)+2*kk2*e1(2))/dd;


u1=[uu1;vv;ww1];

output1=[u1;dt1_1d;e1];
