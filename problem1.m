clc;close;
clear all;
data = xlsread('C:\Users\jj\Desktop\a1.xlsx','Sheet2','B3:B5403')';
L = [0.6 6 3.6 5]; % 长度
n = 5400;  % 时间段
deltat = 0.0002;  % 时间间隔  s
deltax = 0.1; % 位置间隔  mm
dd = ceil(sum(L) / deltax);  % 总间隔
% T = zeros(dd,n+1);
T = zeros(dd+1,2);
T(:,1) = 25; % 第一个时间段即第零秒的时候温度为25
T(1,:) = 75; % 第一个位置的温度为75
% T(dd+1,:) = 37; % 最后一个位置的温度为37

T(dd+1,1) = data(1,1);

d_1 = ceil(L(1) / deltax); % 第一层的间隔
d_2 = ceil(L(2) / deltax); % 第二层的间隔
d_3 = ceil(L(3) / deltax); % 第三层的间隔
d_4 = ceil(L(4) / deltax); % 第四层的间隔

temp(:,1) = T(:,1);  % 结果
flag = 1;  % 标志列数

for i = 1:n*(ceil(1/deltat))  % 时间段
    T(1,2) = 75;  % 初始化
    T(dd+1,2) = data(1,flag);
%    T(dd+1,2) = 37;
    for x = 2:dd % 位置段
        if x <= d_1
            aa = (0.082*deltat)*10^6/(deltax^2 * 1377 * 300);  % 第一层的系数
        elseif x > d_1 && x <= (d_2 + d_1)
            aa = (0.37*deltat)*10^6/(deltax^2*862*2100);  % 第二层的系数
%            aa = k(1,2)*deltat/(deltax^2 * c(1,2) * p(1,2));

        elseif x > (d_2 + d_1) && x <= (d_3 + d_2 + d_1)
            aa = (0.045*deltat)*10^6/(deltax^2*74.2*1726);  % 第三层的系数
%            aa = k(1,3)*deltat/(deltax^2 * c(1,3) * p(1,3));
        else 
            aa = (0.028*deltat)*10^6/(deltax^2*1.18*1005);  % 第四层的系数
%            aa = k(1,4)*deltat/(deltax^2 * c(1,4) * p(1,4));
        end
        T(x,2) = T(x,1) + aa*(T(x+1,1) - 2*T(x,1) + T(x-1,1));  % 迭代公式，微分方程求解
%        T(x,i+1) = T(x,i) + aa*(T(x+1,i) - 2*T(x,i) + T(x-1,i));  % 常微分方程的求解
    end
    if mod(i,ceil(1/deltat)) == 0
        flag = flag + 1;
        temp(:,flag) = T(:,2);  % 输出
    end
    T(:,1) = T(:,2);  % 替换
end
% data = xlsread('C:\Users\jj\Desktop\a1.xlsx','Sheet2','B3:B5403')';

%% 皮肤外侧温度画图
xx = 1:length(temp);
figure(1);
plot(xx,data,'r','LineWidth',1);
hold on;
plot(xx,temp(152,:),'k','LineWidth',1);
legend('实际皮肤外侧温度','计算皮肤外侧温度');
xlabel('时间（s）');ylabel('温度（℃）');
title('皮肤外侧温度');
axis([1 5410 35 50]);
box off;
hold off;

%% 不同位置在同一时刻的画图
figure(2);
subplot(2,2,1),plot(temp(:,50),'r','LineWidth',1.5);
xlabel('相对位置（mm）');ylabel('温度（℃）');
title('不同位置在时间50s时的温度');
axis([0 160 25 80]);
box off;
subplot(2,2,2),plot(temp(:,100),'r','LineWidth',1.5);
xlabel('相对位置（mm）');ylabel('温度（℃）');
title('不同位置在时间100s时的温度');
axis([0 160 25 80]);
box off;
subplot(2,2,3),plot(temp(:,500),'r','LineWidth',1.5);
xlabel('相对位置（mm）');ylabel('温度（℃）');
title('不同位置在时间500s时的温度');
axis([0 160 45 80]);
box off;
subplot(2,2,4),plot(temp(:,1650),'r','LineWidth',1.5);
xlabel('相对位置（mm）');ylabel('温度（℃）');
title('不同位置在时间1650s时的温度');
axis([0 160 45 80]);
box off;


%% 计算相对误差
delta = abs(temp(152,:)-data) / data;  % 计算相对误差
avr = sum(delta) / length(delta);
disp(['计算的相对误差为：',num2str(avr*100),'%']);


%% 将温度分布结果写入文件
xlswrite('C:\Users\jj\Desktop\problem1.xlsx',temp([1:153],[1:5401])','Sheet1','A1');