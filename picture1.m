clc;close;
clear all;
data = xlsread('C:\Users\jj\Desktop\a1.xlsx','Sheet2','B3:B5403')';
data = data + 274.15;  % ���¶�ת��Ϊ�������¶�
%% Ƥ�����¶ȱ仯����
x_1 = 1:length(data);
subplot(1,2,1),plot(x_1,data,'r','LineWidth',2);
hold on;
tt = 1650;yy = data(1,1650);
plot(tt,yy,'k.','MarkerSize',20);

title('Ƥ�����仯����');
xlabel('ʱ��(s)');ylabel('�¶�(K)');
axis([0,5500,310,324]);
box off;
%% Ƥ�����¶Ȳ��
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
title('Ƥ������¶Ȳ�ֱ仯����');
xlabel('ʱ��(s)');ylabel('�¶Ȳ��(K)');
axis([0,5500,0,0.045]);
box off;