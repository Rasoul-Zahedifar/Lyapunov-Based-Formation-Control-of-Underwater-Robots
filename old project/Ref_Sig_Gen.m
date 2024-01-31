function out1=Ref_Sig_Gen(in1)

t=in1;


nn=10; ff=16; %for sin , sircular
%nn=2;  ff=3;  %for sin & circular
%******* sin *******%
% yr=nn*sin(t/ff);            xr=t;
% yd =nn/ff*cos(t/ff);        xd=1;
% ydd =-nn/ff^2*sin(t/ff);    xdd=0;
% yddd =-nn/ff^3*cos(t/ff);   xddd=0;
% ydddd=nn/ff^4*sin(t/ff);    xdddd=0;

%******* circular *******%
yr=nn*sin(t/ff);            xr=nn*cos(t/ff);
yd =nn/ff*cos(t/ff);        xd=-nn/ff*sin(t/ff);
ydd =-nn/ff^2*sin(t/ff);    xdd=-nn/ff^2*cos(t/ff);
yddd =-nn/ff^3*cos(t/ff);   xddd=nn/ff^3*sin(t/ff);
ydddd=nn/ff^4*sin(t/ff);    xdddd=nn/ff^4*cos(t/ff);

% yr=nn*sin(t/ff);            xr=nn*cos(t/ff/2);
% yd =nn/ff*cos(t/ff);        xd=-nn/ff/2*sin(t/ff/2);
% ydd =-nn/ff^2*sin(t/ff);    xdd=-nn/ff^2/4*cos(t/ff/2);
% yddd =-nn/ff^3*cos(t/ff);   xddd=nn/ff^3/8*sin(t/ff/2);
% ydddd=nn/ff^4*sin(t/ff);    xdddd=nn/ff^4/16*cos(t/ff/2);


v = sqrt(xd^2+yd^2);

phi = atan2(yd,xd);

dphi=(ydd*xd-xdd*yd)/(xd^2+yd^2);
ddphi =(xd*(yddd*yd^2 + (2*xdd^2 - 2*ydd^2)*yd) - xd^2*(xddd*yd + 2*xdd*ydd) - xddd*yd^3 + xd^3*yddd + 2*xdd*yd^2*ydd)/(xd^2 + yd^2)^2;

qr = [xr;yr;phi];
dqr=[xd;yd;dphi];
ddqr=[xdd;ydd;ddphi];
out1= [qr;dqr;ddqr;v;dphi];