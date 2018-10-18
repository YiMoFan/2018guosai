clc;clear;
num = xlsread('C:\Users\jj\Desktop\ans3.xlsx','Sheet1','B2:BQH6');
xx = 1:length(num);
plot(xx,num(1,:),'r','LineWidth',1.5);
hold on 
plot(xx,num(2,:),'k','LineWidth',1.5);
hold on
plot(xx,num(3,:),'b','LineWidth',1.5);
hold on
plot(xx,num(4,:),'g','LineWidth',1.5);
axis([1420 1600 43.9 44.15]);
% set(gca,'Xtick',[1420,1500,1600,1700]);
% set(gca,'Ytick',[43.95,44.00,44.05,44.1,44.15]);
hold on
x1 = [1420,1600];y1 = [44,44];
plot(x1,y1,'r--');
hold on
x2 = [1500,1500]; y2 = [43.9,44.15];
plot(x2,y2,'r--');
legend('II:18.3 IV:6.4','II:18.4 IV:6.4','II:18.5 IV:6.4','II:18.6 IV:6.4');
xlabel('时间（s）');ylabel('温度（℃）');
title('第II层和第IV层厚度与皮肤外侧温度关系');