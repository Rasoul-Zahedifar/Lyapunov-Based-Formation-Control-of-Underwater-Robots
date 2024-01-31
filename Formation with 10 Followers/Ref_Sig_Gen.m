function out1=Ref_Sig_Gen(in1)

t=in1;


nn=10; ff=16; %for sin , circular
%nn=2;  ff=3;  %for sin & circular
%******* sin *******%
% yr=nn*sin(t/ff);            xr=t;
% yd =nn/ff*cos(t/ff);        xd=1;
% ydd =-nn/ff^2*sin(t/ff);    xdd=0;
% yddd =-nn/ff^3*cos(t/ff);   xddd=0;


%******* circular *******%
yr=nn*sin(t/ff);            xr=nn*cos(t/ff);
yd =nn/ff*cos(t/ff);        xd=-nn/ff*sin(t/ff);
ydd =-nn/ff^2*sin(t/ff);    xdd=-nn/ff^2*cos(t/ff);
yddd =-nn/ff^3*cos(t/ff);   xddd=nn/ff^3*sin(t/ff);

% % 
% T=50; a=18; b=-pi/6;ss=2;
% T=50; a=24; b=0;ss=2;
% T=50; a=36; b=pi/6;ss=2;
% yr=ss*(5+cos(a*t/50))*sin((6*t/T)+b);         xr=ss*(5+cos(a*t/50))*cos((6*t/T)+b);  
% yd =ss*((6*cos(b + (6*t)/T)*(cos((a*t)/50) + 5))/T - (a*sin((a*t)/50)*sin(b + (6*t)/T))/50);
% xd =ss*(- (a*sin((a*t)/50)*cos(b + (6*t)/T))/50 - (6*sin(b + (6*t)/T)*(cos((a*t)/50) + 5))/T);
% ydd =ss*(- (a^2*cos((a*t)/50)*sin(b + (6*t)/T))/2500 - (36*sin(b + (6*t)/T)*(cos((a*t)/50) + 5))/T^2 - (6*a*sin((a*t)/50)*cos(b + (6*t)/T))/(25*T));
% xdd =ss*((6*a*sin((a*t)/50)*sin(b + (6*t)/T))/(25*T) - (36*cos(b + (6*t)/T)*(cos((a*t)/50) + 5))/T^2 - (a^2*cos((a*t)/50)*cos(b + (6*t)/T))/2500);
% yddd =ss*((a^3*sin((a*t)/50)*sin(b + (6*t)/T))/125000 - (216*cos(b + (6*t)/T)*(cos((a*t)/50) + 5))/T^3 - (9*a^2*cos((a*t)/50)*cos(b + (6*t)/T))/(1250*T) + (54*a*sin((a*t)/50)*sin(b + (6*t)/T))/(25*T^2));
% xddd =ss*((a^3*sin((a*t)/50)*cos(b + (6*t)/T))/125000 + (216*sin(b + (6*t)/T)*(cos((a*t)/50) + 5))/T^3 + (9*a^2*cos((a*t)/50)*sin(b + (6*t)/T))/(1250*T) + (54*a*sin((a*t)/50)*cos(b + (6*t)/T))/(25*T^2));
 

% yr=nn*sin(t/ff);            xr=nn*cos(t/ff/2);
% yd =nn/ff*cos(t/ff);        xd=-nn/ff/2*sin(t/ff/2);
% ydd =-nn/ff^2*sin(t/ff);    xdd=-nn/ff^2/4*cos(t/ff/2);
% yddd =-nn/ff^3*cos(t/ff);   xddd=nn/ff^3/8*sin(t/ff/2);



%%%%%%%% 8 like path:
% ss=10;
% yr=ss*sin(t/10);                    xr=ss*sin(t/5);
% yd =(ss*cos(t/10))/10;              xd=(ss*cos(t/5))/5;
% ydd =-(ss*sin(t/10))/100;           xdd=-(ss*sin(t/5))/25;
% yddd =-(ss*cos(t/10))/1000;         xddd=-(ss*cos(t/5))/125;






v = sqrt(xd^2+yd^2);

phi = atan2(yd,xd);

dphi=(ydd*xd-xdd*yd)/(xd^2+yd^2);
ddphi =(xd*(yddd*yd^2 + (2*xdd^2 - 2*ydd^2)*yd) - xd^2*(xddd*yd + 2*xdd*ydd) - xddd*yd^3 + xd^3*yddd + 2*xdd*yd^2*ydd)/(xd^2 + yd^2)^2;

qr = [xr;yr;phi];
dqr=[xd;yd;dphi];
ddqr=[xdd;ydd;ddphi];
out1= [qr;dqr;ddqr;v;dphi];