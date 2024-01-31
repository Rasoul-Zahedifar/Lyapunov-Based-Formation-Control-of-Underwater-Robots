
clear all
clc
close all
global dd k1 k2 k3 kk1 kk2 kk3 kp1 kp2 kp3

dd=0.5;
time=95;


u0=[0.1;0.1;0.1]';
u01=[0;0;0]';


% l1d=3;sai1_d=pi/2;             %%
% l2d=2;sai2_d=3*pi/4;           %%
% l3d=3;sai3_d=-pi/2;            %%%% Formation 2
% l4d=2;sai4_d=-3*pi/4;          %%
% l5d=1;sai5_d=pi;               %%

% l1d=3;sai1_d=2*pi/5;           %%
% l2d=3;sai2_d=4*pi/5;           %% 
% l3d=3;sai3_d=6*pi/5;           %%%% Formation 4
% l4d=3;sai4_d=8*pi/5;           %%
% l5d=3;sai5_d=10*pi/5;          %%


l1d=2;sai1_d=pi/4;               %%  
l2d=1;sai2_d=2*pi/4;             %%     
l3d=2;sai3_d=-pi/4;              %%%% Formation 5
l4d=1;sai4_d=-2*pi/4;            %%             
l6d=-2;sai6_d=pi/4;               %%  
l7d=-2;sai7_d=-2*pi/8;             %%     


l8d=5;sai8_d=3*pi/6+3*pi/2;              %%%% Formation 5
l9d=-1;sai9_d=3*pi/6+3*pi/2;            %%     
l10d=-3;sai10_d=3*pi/6+3*pi/2;
l5d=3;sai5_d=3*pi/6+3*pi/2;


% gg=3;                                        %%%%
% q0=[gg/2 gg/2 1]'.*[7.5 -18 1*pi/2]';        %%%%
% q0_1=[gg gg 1]'.*[-3 -18 1*pi/2]';           %%%%
% q0_2=[gg gg 1]'.*[-1.5 -18 1*pi/2]';         %%%%%%%% Formation 2
% q0_3=[gg gg 1]'.*[18 -18 1*pi/2]';           %%%%
% q0_4=[gg gg 1]'.*[16.5 -18 1*pi/2]';         %%%%
% q0_5=[gg gg 1]'.*[10.5 -18 1*pi/2]';         %%%%

% q0=[10 -20 1*pi/2]';                         %%%
% q0_1=[-10 -20 0*pi/2]';                      %%%
% q0_2=[0 -20 0*pi/2]';                        %%%
% q0_3=[30 10 1*pi/1]';                        %%%%%%%% Formation 2
% q0_4=[30 0 1*pi/1]';                         %%%
% q0_5=[30 -20 1*pi/1]';                       %%%


% q0=[7.5 -18 1*pi/2]';                        %%%%
% q0_1=[-3 -18 1*pi/2]';                       %%%%
% q0_2=[-1.5 -18 1*pi/2]';                     %%%%
% q0_3=[18 -18 1*pi/2]';                       %%%%%%%% Formation 4
% q0_4=[16.5 -18 1*pi/2]';                     %%%%
% q0_5=[10.5 -18 1*pi/2]';                     %%%%



q0=[10 -18 1*pi/2]';                          %%%%
q0_1=[22 -18 1*pi/2]';                        %%%%
q0_2=[18.5 -18 1*pi/2]';                      %%%%
q0_3=[8 -18 1*pi/2]';                         %%%%%%%% Formation 5
q0_4=[5 -18 1*pi/2]';                         %%%%
q0_5=[14 -18 1*pi/2]';                        %%%%
q0_6=[22 -18 1*pi/2]';                        %%%%
q0_7=[18.5 -18 1*pi/2]';                      %%%%
q0_8=[8 -18 1*pi/2]';                         %%%%%%%% Formation 5
q0_9=[5 -18 1*pi/2]';                         %%%%
q0_10=[14 -18 1*pi/2]';





k1=10;k3=60;k2=k1;
kk1=50;kk2=70;kk3=20;
kp1=10;kp2=kp1;kp3=kp1;


sim('Dyn_Sim')

close all
x=q(:,1);y=q(:,2);t1=q(:,3);% t0=q(:,4);
xr=qr(:,1);yr=qr(:,2);t1r=qr(:,3);% t0r=qr(:,4);

x1=q1(:,1);y1=q1(:,2);t11=q1(:,3);% t0=q(:,4);
x2=q2(:,1);y2=q2(:,2);t12=q2(:,3);% t0=q(:,4);
x3=q3(:,1);y3=q3(:,2);t13=q3(:,3);% t0=q(:,4);
x4=q4(:,1);y4=q4(:,2);t14=q4(:,3);% t0=q(:,4);
x5=q5(:,1);y5=q5(:,2);t15=q5(:,3);% t0=q(:,4);
x6=q6(:,1);y6=q6(:,2);t16=q6(:,3);% t0=q(:,4);
x7=q7(:,1);y7=q7(:,2);t17=q7(:,3);% t0=q(:,4);
x8=q8(:,1);y8=q8(:,2);t18=q8(:,3);% t0=q(:,4);
x9=q9(:,1);y9=q9(:,2);t19=q9(:,3);% t0=q(:,4);
x10=q10(:,1);y10=q10(:,2);t110=q10(:,3);% t0=q(:,4);


lw=2;fs=13;
figure1=figure('InvertHardcopy','off','Color',[1 1 1]);
axes('Parent',figure1,'LineWidth',lw,'FontSize',fs,'FontName','cambria');
box('on');hold('all');

plot(xr,yr,'Color',[0,0.9,0],'LineWidth',5);hold on
plot(x,y,'k:',x1,y1,'k-.',x2,y2,'k-.',x3,y3,'k-.',x4,y4,'k-.',x5,y5,'k-.',x6,y6,'k-.',x7,y7,'k-.',x8,y8,'k-.',x9,y9,'k-.',x10,y10,'k-.','LineWidth',lw);axis equal;xlabel('x (m)','FontSize',fs,'FontName','cambria');ylabel('y (m)','FontSize',fs,'FontName','cambria');lgnd=legend('Reference Path','Leader','Followers');set(lgnd,'color','none','EdgeColor','none');

% for i=[1 55 80:300:length(x)]            %%%% Formation 4
%     if i>1                               %%%%
        
% for i=[1 45 100:300:length(x)]           %%%% Formation 2
%    if i>1                                %%%%
        
for i=[1 130:750:length(x)]             %%%% Formation 5
     if i>40                               %%%%
                  
%                   hold on;plot([x(i) x1(i)],[y(i) y1(i)],'r','LineWidth',2)
%                   hold on;plot([x1(i) x2(i)],[y1(i) y2(i)],'r','LineWidth',2)
%                   hold on;plot([x2(i) x5(i)],[y2(i) y5(i)],'r','LineWidth',2)       %%%%% Formation 2 %%%%%%%
%                   hold on;plot([x5(i) x4(i)],[y5(i) y4(i)],'r','LineWidth',2)
%                   hold on;plot([x4(i) x3(i)],[y4(i) y3(i)],'r','LineWidth',2)
%                   hold on;plot([x3(i) x(i)],[y3(i) y(i)],'r','LineWidth',2)
%                 
%                   hold on;plot([x1(i) x2(i)],[y1(i) y2(i)],'r','LineWidth',2)
%                   hold on;plot([x2(i) x3(i)],[y2(i) y3(i)],'r','LineWidth',2)
%                   hold on;plot([x4(i) x3(i)],[y4(i) y3(i)],'r','LineWidth',2)       %%%%%%% Formation 4 %%%%%%
%                   hold on;plot([x4(i) x5(i)],[y4(i) y5(i)],'r','LineWidth',2)
%                   hold on;plot([x5(i) x1(i)],[y5(i) y1(i)],'r','LineWidth',2)
                
                  hold on;plot([x1(i) x2(i)],[y1(i) y2(i)],'r','LineWidth',2)
                  hold on;plot([x3(i) x4(i)],[y3(i) y4(i)],'r','LineWidth',2)
                  hold on;plot([x2(i) x7(i)],[y2(i) y7(i)],'r','LineWidth',2)       %%%%%%% Formation 5 %%%%%%
                  hold on;plot([x4(i) x6(i)],[y4(i) y6(i)],'r','LineWidth',2)
                  hold on;plot([x3(i) x8(i)],[y3(i) y8(i)],'r','LineWidth',2)
                  hold on;plot([x1(i) x8(i)],[y1(i) y8(i)],'r','LineWidth',2)
    hold on;plot([x7(i) x10(i)],[y7(i) y10(i)],'r','LineWidth',2)
    hold on;plot([x6(i) x10(i)],[y6(i) y10(i)],'r','LineWidth',2)
    hold on;plot([x9(i) x10(i)],[y9(i) y10(i)],'r','LineWidth',2)
    hold on;plot([x8(i) x5(i)],[y8(i) y5(i)],'r','LineWidth',2)
    hold on;plot([x(i) x9(i)],[y(i) y9(i)],'r','LineWidth',2)
    hold on;plot([x(i) x8(i)],[y(i) y8(i)],'r','LineWidth',2)
     end     
     
      
           
      plot(x(i),y(i),'om','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',10)
      hold on
      plot(x1(i),y1(i),'Ob','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',7)
      hold on
      plot(x2(i),y2(i),'Ob','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',7)
      hold on
      plot(x3(i),y3(i),'Ob','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',7)
      hold on
      plot(x4(i),y4(i),'Ob','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',7)
      hold on
      plot(x5(i),y5(i),'Ob','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',7)
      hold on
      plot(x6(i),y6(i),'Ob','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',7)
      hold on
      plot(x7(i),y7(i),'Ob','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',7)
      hold on
      plot(x8(i),y8(i),'Ob','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',7)
      hold on
      plot(x9(i),y9(i),'Ob','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',7)
      hold on
      plot(x10(i),y10(i),'Ob','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',7)
end

axis equal;xlabel('x (m)','FontSize',fs,'FontName','cambria');ylabel('y (m)','FontSize',fs,'FontName','cambria');lgnd=legend('Reference Path','Leader','Followers');set(lgnd,'color','none','EdgeColor','none');



