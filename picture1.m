clc;close;
clear all;
data = xlsread('C:\Users\jj\Desktop\a1.xlsx','Sheet2','B3:B5403')';
data = data + 274.15;  % 将温度转换为卡尔文温度
%% 皮肤外温度变化趋势
x_1 = 1:length(data);
subplot(1,2,1),plot(x_1,data,'r','LineWidth',2);
hold on;
tt = 1650;yy = data(1,1650);
plot(tt,yy,'k.','MarkerSize',20);

title('皮肤外侧变化趋势');
xlabel('时间(s)');ylabel('温度(K)');
axis([0,5500,310,324]);
box off;
%% 皮肤外温度差分
len_data = length(data);
for i = 1:len_data
    if i == 1;
        chafen(i)=0;
    else 
        chafen(i) = data(1,i) - data(1,i-1);
    end
end
x_2 = 1:length(data);
subplot(1,2,2),plot(x_2,chafen,'r');
title('皮肤外侧温度差分变化趋势');
xlabel('时间(s)');ylabel('温度差分(K)');
axis([0,5500,0,0.045]);
box off;