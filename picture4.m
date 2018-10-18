clc;clear;
num = xlsread('C:\Users\jj\Desktop\ans2.xlsx','Sheet1','B2:EHN5');
xx = 1:length(num);
plot(xx,num(1,:),'r','LineWidth',1.5);
hold on 
plot(xx,num(2,:),'k','LineWidth',1.5);
hold on
plot(xx,num(3,:),'b','LineWidth',1.5);
hold on
plot(xx,num(4,:),'g','LineWidth',1.5);
axis([700 3700 43.95 44.07]);
set(gca,'Xtick',[700,1000,2000,3000,3700]);
% set(gca,'Ytick',[43.95,44.00,44.05,44.07]);
hold on
x1 = [700,3700];y1 = [44,44];
plot(x1,y1,'r--');
hold on
x2 = [3300,3300]; y2 = [43.95,44.07];
plot(x2,y2,'r--')
xlabel('时间（s）');ylabel('温度（℃）');
title('第II层厚度与皮肤外侧温度关系');