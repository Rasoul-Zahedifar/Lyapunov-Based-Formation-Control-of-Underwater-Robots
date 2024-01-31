
clear all
clc
close all
global dd k1 k2 k3 kk1 kk2 kk3 kp1 kp2 kp3

dd=0.5;
time=50;


u0=[0.1;0.1;0.1]';
u01=[0;0;0]';

% l1d=2;sai1_d=pi/2;                   %%%%
% l2d=2;sai2_d=3*pi/2;                 %% vertical %% Formation 3
                                       %%%%%%    
% l1d=2;sai1_d=0;                      %% horizontal %% Formation 3
% l2d=2;sai2_d=pi;                     %%%%


l1d=2;sai1_d=pi/2;                   %%%%%% Formation 1
l2d=2;sai2_d=-pi/2;                  %%%%%%



gg=2;                                %%%%%%
q0=[gg gg 1]'.*[5 -4 pi/2]';         %%%%%% Formation 1
q0_1=[gg gg 1]'.*[4 -6 pi/2]';       %%%%%%
q0_2=[gg gg 1]'.*[5 -6 pi/3]';       %%%%%%


% q0=[7 -8 1*pi/3]';                 %%%%%%
% q0_1=[10 -12 1*pi/2]';             %%%%%% Formation 3
% q0_2=[5 -12 1*pi/2]';              %%%%%%





k1=10;k3=60;k2=k1;
kk1=50;kk2=70;kk3=20;
kp1=10;kp2=kp1;kp3=kp1;



sim('Dyn_Sim2')



close all
x=q(:,1);y=q(:,2);t1=q(:,3);% t0=q(:,4);
xr=qr(:,1);yr=qr(:,2);t1r=qr(:,3);% t0r=qr(:,4);

x1=q1(:,1);y1=q1(:,2);t11=q1(:,3);% t0=q(:,4);
x2=q2(:,1);y2=q2(:,2);t12=q2(:,3);% t0=q(:,4);

lw=2;fs=13;
figure1=figure('InvertHardcopy','off','Color',[1 1 1]);
axes('Parent',figure1,'LineWidth',lw,'FontSize',fs,'FontName','cambria');
box('on');hold('all');

plot(xr,yr,'Color',[0,0.9,0],'LineWidth',5);hold on
plot(x,y,'k:',x1,y1,'k--',x2,y2,'k-.','LineWidth',lw);


for i=[1 150 400:200:length(x)]
%     i=[1 50 100:50:length(x)]
    if i>0
        hold on;plot([x(i) x1(i)],[y(i) y1(i)],'r','LineWidth',2)
        hold on;plot([x1(i) x2(i)],[y1(i) y2(i)],'r','LineWidth',2)
        hold on;plot([x2(i) x(i)],[y2(i) y(i)],'r','LineWidth',2)
    end
    plot(x(i),y(i),'om','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',10)
 hold on
    plot(x1(i),y1(i),'Ob','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',7)
 hold on
   plot(x2(i),y2(i),'Ob','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',7)
end
axis equal;xlabel('x (m)','FontSize',fs,'FontName','cambria');ylabel('y (m)','FontSize',fs,'FontName','cambria');lgnd=legend('Reference Path','Leader','Follower 1','Follower 2');set(lgnd,'color','none','EdgeColor','none');



figure2=figure('InvertHardcopy','off','Color',[1 1 1]);
subplot11=subplot(3,1,1,'Parent',figure2,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');%ylim([-0.5 1.5])
subplot(3,1,1);plot(t,x-xr,'k',t,e1(:,1),':k',t,e2(:,1),'--k','Parent',subplot11,'LineWidth',lw);xlabel('t (sec)');ylabel('e_x (m)');lgnd=legend('e_x','e_1_x','e_2_x','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');
subplot12=subplot(3,1,2,'Parent',figure2,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');%ylim([-.25 0.25])
subplot(3,1,2);plot(t,y-yr,'k',t,e1(:,2),':k',t,e2(:,2),'--k','Parent',subplot12,'LineWidth',lw);xlabel('t (sec)');ylabel('e_y (m)');lgnd=legend('e_y','e_1_y','e_2_y','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');
subplot13=subplot(3,1,3,'Parent',figure2,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');%ylim([-0.75 0.5])
subplot(3,1,3);plot(t,mmt11,'k',t,e1(:,3),':k',t,e2(:,3),'--k','Parent',subplot13,'LineWidth',lw);xlabel('t (sec)');ylabel('e_\theta (m)');lgnd=legend('e_\theta','e_1_\theta','e_2_\theta','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');




figure4=figure('InvertHardcopy','off','Color',[1 1 1]);
subplot11=subplot(3,1,1,'Parent',figure4,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');
subplot(3,1,1);plot(t,uu(:,1),'k',t,uu1(:,1),':k',t,uu2(:,1),'--k','Parent',subplot11,'LineWidth',lw);xlabel('t (sec)');ylabel('u (m/s)');lgnd=legend('u','u_1','u_2','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');
subplot12=subplot(3,1,2,'Parent',figure4,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');
subplot(3,1,2);plot(t,uu(:,2),'k',t,uu1(:,2),':k',t,uu2(:,2),'--k','Parent',subplot12,'LineWidth',lw);xlabel('t (sec)');ylabel('v (m/s)');lgnd=legend('v','v_1','v_2','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');
subplot13=subplot(3,1,3,'Parent',figure4,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');
subplot(3,1,3);plot(t,uu(:,3),'k',t,uu1(:,3),':k',t,uu2(:,3),'--k','Parent',subplot13,'LineWidth',lw);xlabel('t (sec)');ylabel('\omega (rad/s)');lgnd=legend('\omega','\omega_1','\omega_2','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');






figure7=figure('InvertHardcopy','off','Color',[1 1 1]);
subplot11=subplot(3,1,1,'Parent',figure7,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');%ylim([-0.3 0.3])
subplot(3,1,1);plot(t,tau(:,1),'k',t,tau1(:,1),':k',t,tau2(:,1),'--k','Parent',subplot11,'LineWidth',lw);xlabel('t (sec)');ylabel('F_u (N)');lgnd=legend('F_u','F_u_1','F_u_2','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');
subplot12=subplot(3,1,2,'Parent',figure7,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');ylim([-1000 400])
subplot(3,1,2);plot(t,tau(:,2),'k',t,tau1(:,2),':k',t,tau2(:,2),'--k','Parent',subplot12,'LineWidth',lw);xlabel('t (sec)');ylabel('F_v (N)');lgnd=legend('F_v','F_v_1','F_v_2','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');
subplot13=subplot(3,1,3,'Parent',figure7,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');ylim([-200 200])
subplot(3,1,3);plot(t,tau(:,3),'k',t,tau1(:,3),':k',t,tau2(:,3),'--k','Parent',subplot13,'LineWidth',lw);xlabel('t (sec)');ylabel('\tau_r (N.m)');lgnd=legend('\tau_r','\tau_r_1','\tau_r_2','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');







