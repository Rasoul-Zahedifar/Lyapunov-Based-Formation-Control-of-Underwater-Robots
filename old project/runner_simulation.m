
clear all
clc
close all
global dd k1 k2 k3 kk1 kk2 kk3

dd=0.5;
time=50;


u0=[0.1;0.1;0.1]';
u01=[0;0;0]';


% q0=[-10 -5 0]';
% q0_1=[-10 -0.5 pi/3]';
% q0_2=[-5 -0.5 pi/3]';

q0=[-10 -5 0]';
q0_1=[-15 -5 pi/3]';
q0_2=[-10 -10 pi/3]';


k1=10;k2=60;k3=20;
% kk1=12;kk2=15;kk3=45;
kk1=12;kk2=15;kk3=.1;


sim('Dyn_Sim')
% plot(q(:,1),q(:,2),qr(:,1),qr(:,2),'r',q1(:,1),q1(:,2),'k',q2(:,1),q2(:,2),'g');axis equal



close all
x=q(:,1);y=q(:,2);t1=q(:,3);% t0=q(:,4);
xr=qr(:,1);yr=qr(:,2);t1r=qr(:,3);% t0r=qr(:,4);

% % % robotica
% % plot(xr,yr,':r',x-0.11,y+0.1);axis equal;legend('x','y')

x1=q1(:,1);y1=q1(:,2);t11=q1(:,3);% t0=q(:,4);
x2=q2(:,1);y2=q2(:,2);t12=q2(:,3);% t0=q(:,4);

lw=2;fs=13;
figure1=figure('InvertHardcopy','off','Color',[1 1 1]);
axes('Parent',figure1,'LineWidth',lw,'FontSize',fs,'FontName','cambria');
box('on');hold('all');

plot(xr,yr,'k',x,y,'k:',x1,y1,'k--',x2,y2,'k-.','LineWidth',lw);axis equal;xlabel('x (m)','FontSize',fs,'FontName','cambria');ylabel('y (m)','FontSize',fs,'FontName','cambria');lgnd=legend('Reference Path','Leader','Follower 1','Follower 2');set(lgnd,'color','none','EdgeColor','none');

figure2=figure('InvertHardcopy','off','Color',[1 1 1]);
subplot11=subplot(3,1,1,'Parent',figure2,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');%ylim([-0.5 1.5])
subplot(3,1,1);plot(t,x-xr,'k',t,e1(:,1),':k',t,e2(:,1),'--k','Parent',subplot11,'LineWidth',lw);xlabel('t (sec)');ylabel('e_x (m)');lgnd=legend('e_x','e_1_x','e_2_x','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');
subplot12=subplot(3,1,2,'Parent',figure2,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');%ylim([-.25 0.25])
subplot(3,1,2);plot(t,y-yr,'k',t,e1(:,2),':k',t,e2(:,2),'--k','Parent',subplot12,'LineWidth',lw);xlabel('t (sec)');ylabel('e_y (m)');lgnd=legend('e_y','e_1_y','e_2_y','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');

clear mmt0 mmt1 mmt0rp mmt1rp

gg(1)=0;
mmt1(1)=t1(1);
for i=2:length(t)
        mt1(i)=(t1(i)-t1(i-1))+1;
        hh(i)=floor(mt1(i)/pi);
        ggg=hh(i);
        gg(i)=ggg+gg(i-1);
        mmt1(i)=t1(i)-pi*gg(i);
end
% 
% gg(1)=0;
% mmt0(1)=t0(1);
% for i=2:length(t);
%         mt0(i)=(t0(i)-t0(i-1))+.9;
%         hh(i)=floor(mt0(i)/pi);
%         ggg=hh(i);
%         gg(i)=ggg+gg(i-1);
%         mmt0(i)=t0(i)-pi*gg(i)-pi;
% end
% 
% for i=1:954;
%     mmt0(i)=mmt0(i)+pi;
% end
% 
gg(1)=0;
mmt1r(1)=t1r(1);
for i=2:length(t)
        mt1r(i)=(t1r(i)-t1r(i-1))+1;
        hh(i)=floor(mt1r(i)/pi);
        ggg=hh(i);
        gg(i)=ggg+gg(i-1);
        mmt1r(i)=t1r(i)-pi*gg(i);
end
% 
% gg(1)=0;
% mmt0rp(1)=t0rp(1);
% for i=2:length(t)
%         mt0rp(i)=(t0rp(i)-t0rp(i-1))+1;
%         hh(i)=floor(mt0rp(i)/pi);
%         ggg=hh(i);
%         gg(i)=ggg+gg(i-1);
%         mmt0rp(i)=t0rp(i)-pi*gg(i);
% end
% 
mmt11=mmt1-mmt1r;

% for i=949:1033;
%     mmt11(i)=mmt11(i)./2;
% end

subplot13=subplot(3,1,3,'Parent',figure2,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');%ylim([-0.75 0.5])
subplot(3,1,3);plot(t,mmt11,'k',t,e1(:,3),':k',t,e2(:,3),'--k','Parent',subplot13,'LineWidth',lw);xlabel('t (sec)');ylabel('e_\theta (m)');lgnd=legend('e_\theta','e_1_\theta','e_2_\theta','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');



% % figure3=figure('InvertHardcopy','off','Color',[1 1 1]);
% % subplot11=subplot(1,1,1,'Parent',figure3,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');%xlim([0 100])
% % subplot(1,1,1);plot(t,mmt11,'k','Parent',subplot11,'LineWidth',lw);xlabel('t (sec)');ylabel('e_\theta (rad)')
% % % subplot12=subplot(2,1,2,'Parent',figure3,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');xlim([0 100])
% % % subplot(2,1,2);plot(t_f,0.5*tau_f(:,2),'Parent',subplot12,'LineWidth',lw);xlabel('t (sec)');ylabel('\theta_0 (rad)')


figure4=figure('InvertHardcopy','off','Color',[1 1 1]);
subplot11=subplot(2,1,1,'Parent',figure4,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');%ylim([-0.5 1.5])
subplot(2,1,1);plot(t,uu(:,1),'k',t,uu1(:,1),':k',t,uu2(:,1),'--k','Parent',subplot11,'LineWidth',lw);xlabel('t (sec)');ylabel('u (m/s)');lgnd=legend('u','u_1','u_2','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');
subplot12=subplot(2,1,2,'Parent',figure4,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');%ylim([-2 2])
subplot(2,1,2);plot(t,uu(:,3),'k',t,uu1(:,3),':k',t,uu2(:,3),'--k','Parent',subplot12,'LineWidth',lw);xlabel('t (sec)');ylabel('\omega (rad/s)');lgnd=legend('\omega','\omega_1','\omega_2','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');

% figure5=figure(5);
% subplot11=subplot(3,1,1,'Parent',figure5,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');%xlim([0 100])
% subplot(3,1,1);plot(t,e(:,1),'k','Parent',subplot11,'LineWidth',lw);xlabel('t (sec)');ylabel('e_x (m)');legend('CRAVTC','RAFLDC','Orientation','horizontal')
% subplot12=subplot(3,1,2,'Parent',figure5,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');%xlim([0 100])
% subplot(3,1,2);plot(t,e(:,2),'k','Parent',subplot12,'LineWidth',lw);xlabel('t (sec)');ylabel('e_y (m)');legend('CRAVTC','RAFLDC','Orientation','horizontal')
% subplot13=subplot(3,1,3,'Parent',figure5,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');%xlim([0 100])
% subplot(3,1,3);plot(t,e(:,3),'k','Parent',subplot13,'LineWidth',lw);xlabel('t (sec)');ylabel('e_\theta (rad)');legend('CRAVTC','RAFLDC','Orientation','horizontal')
% 

% figure5=figure('InvertHardcopy','off','Color',[1 1 1]);
% subplot11=subplot(3,1,1,'Parent',figure5,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');%xlim([0 100])
% subplot(3,1,1);plot(t,e1(:,1),'k',t,e2(:,1),'--k','Parent',subplot11,'LineWidth',lw);xlabel('t (sec)');ylabel('e_x (m)');lgnd=legend('e_x','e_1x','e_2x','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');
% subplot12=subplot(3,1,2,'Parent',figure5,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');ylim([-0.025 0.025])
% subplot(3,1,2);plot(t,e1(:,2),'k',t,e2(:,2),'--k','Parent',subplot12,'LineWidth',lw);xlabel('t (sec)');ylabel('e_y (m)');lgnd=legend('e_y','e_1y','e_2y','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');
% subplot13=subplot(3,1,3,'Parent',figure5,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');ylim([-0.025 0.025])
% subplot(3,1,3);plot(t,e1(:,3),'k',t,e2(:,3),'--k','Parent',subplot13,'LineWidth',lw);xlabel('t (sec)');ylabel('e_\theta (rad)');lgnd=legend('e_\theta','e_1\theta','e_2\theta','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');



figure7=figure('InvertHardcopy','off','Color',[1 1 1]);
subplot11=subplot(2,1,1,'Parent',figure7,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');%ylim([-0.3 0.3])
subplot(2,1,1);plot(t,tau(:,1),'k',t,tau1(:,1),':k',t,tau2(:,1),'--k','Parent',subplot11,'LineWidth',lw);xlabel('t (sec)');ylabel('\tau_r (N.m)');lgnd=legend('\tau_r','\tau_r_1','\tau_r_2','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');
subplot12=subplot(2,1,2,'Parent',figure7,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');%ylim([-0.3 0.3])
subplot(2,1,2);plot(t,tau(:,2),'k',t,tau1(:,2),':k',t,tau2(:,2),'--k','Parent',subplot12,'LineWidth',lw);xlabel('t (sec)');ylabel('\tau_l (N.m)');lgnd=legend('\tau_l','\tau_l_1','\tau_l_2','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');





% dataa.time=t;
% dataa.signals.values=tau1;%[tau_b1(1:6584,1) tau_b1(1:6584,2)];
% dataa.signals.dimensions=2;
% sim('Butt_Filter2')
% 
% figure7=figure('InvertHardcopy','off','Color',[1 1 1]);
% subplot11=subplot(2,1,1,'Parent',figure7,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');ylim([-0.3 0.3])
% subplot(2,1,1);plot(t,tau(:,1),'k',t_f,tau_f(:,1),':k','Parent',subplot11,'LineWidth',lw);xlabel('t (sec)');ylabel('\tau_r (N.m)');%lgnd=legend('\tau_r','\tau_r_1','\tau_r_2','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');
% subplot12=subplot(2,1,2,'Parent',figure7,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');ylim([-0.3 0.3])
% subplot(2,1,2);plot(t,tau(:,2),'k',t_f,tau_f(:,2),':k','Parent',subplot12,'LineWidth',lw);xlabel('t (sec)');ylabel('\tau_l (N.m)');%lgnd=legend('\tau_l','\tau_l_1','\tau_l_2','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');
% % 
% dataa.time=t;
% dataa.signals.values=tau2;%[tau_b1(1:6584,1) tau_b1(1:6584,2)];
% dataa.signals.dimensions=2;
% sim('Butt_Filter2')
% 
% % figure7=figure('InvertHardcopy','off','Color',[1 1 1]);
% subplot11=subplot(2,1,1,'Parent',figure7,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');ylim([-0.3 0.3])
% subplot(2,1,1);plot(t_f,tau_f(:,1),'--k','Parent',subplot11,'LineWidth',lw);xlabel('t (sec)');ylabel('\tau_r (N.m)');lgnd=legend('\tau_r','\tau_r_1','\tau_r_2','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');
% subplot12=subplot(2,1,2,'Parent',figure7,'LineWidth',lw,'FontSize',fs,'FontName','cambria');box('on');hold('all');ylim([-0.3 0.3])
% subplot(2,1,2);plot(t_f,tau_f(:,2),'--k','Parent',subplot12,'LineWidth',lw);xlabel('t (sec)');ylabel('\tau_l (N.m)');lgnd=legend('\tau_l','\tau_l_1','\tau_l_2','Orientation','horizontal');set(lgnd,'color','none','EdgeColor','none');
% % 
% 

