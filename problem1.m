clc;close;
clear all;
data = xlsread('C:\Users\jj\Desktop\a1.xlsx','Sheet2','B3:B5403')';
L = [0.6 6 3.6 5]; % ����
n = 5400;  % ʱ���
deltat = 0.0002;  % ʱ����  s
deltax = 0.1; % λ�ü��  mm
dd = ceil(sum(L) / deltax);  % �ܼ��
% T = zeros(dd,n+1);
T = zeros(dd+1,2);
T(:,1) = 25; % ��һ��ʱ��μ��������ʱ���¶�Ϊ25
T(1,:) = 75; % ��һ��λ�õ��¶�Ϊ75
% T(dd+1,:) = 37; % ���һ��λ�õ��¶�Ϊ37

T(dd+1,1) = data(1,1);

d_1 = ceil(L(1) / deltax); % ��һ��ļ��
d_2 = ceil(L(2) / deltax); % �ڶ���ļ��
d_3 = ceil(L(3) / deltax); % ������ļ��
d_4 = ceil(L(4) / deltax); % ���Ĳ�ļ��

temp(:,1) = T(:,1);  % ���
flag = 1;  % ��־����

for i = 1:n*(ceil(1/deltat))  % ʱ���
    T(1,2) = 75;  % ��ʼ��
    T(dd+1,2) = data(1,flag);
%    T(dd+1,2) = 37;
    for x = 2:dd % λ�ö�
        if x <= d_1
            aa = (0.082*deltat)*10^6/(deltax^2 * 1377 * 300);  % ��һ���ϵ��
        elseif x > d_1 && x <= (d_2 + d_1)
            aa = (0.37*deltat)*10^6/(deltax^2*862*2100);  % �ڶ����ϵ��
%            aa = k(1,2)*deltat/(deltax^2 * c(1,2) * p(1,2));

        elseif x > (d_2 + d_1) && x <= (d_3 + d_2 + d_1)
            aa = (0.045*deltat)*10^6/(deltax^2*74.2*1726);  % �������ϵ��
%            aa = k(1,3)*deltat/(deltax^2 * c(1,3) * p(1,3));
        else 
            aa = (0.028*deltat)*10^6/(deltax^2*1.18*1005);  % ���Ĳ��ϵ��
%            aa = k(1,4)*deltat/(deltax^2 * c(1,4) * p(1,4));
        end
        T(x,2) = T(x,1) + aa*(T(x+1,1) - 2*T(x,1) + T(x-1,1));  % ������ʽ��΢�ַ������
%        T(x,i+1) = T(x,i) + aa*(T(x+1,i) - 2*T(x,i) + T(x-1,i));  % ��΢�ַ��̵����
    end
    if mod(i,ceil(1/deltat)) == 0
        flag = flag + 1;
        temp(:,flag) = T(:,2);  % ���
    end
    T(:,1) = T(:,2);  % �滻
end
% data = xlsread('C:\Users\jj\Desktop\a1.xlsx','Sheet2','B3:B5403')';

%% Ƥ������¶Ȼ�ͼ
xx = 1:length(temp);
figure(1);
plot(xx,data,'r','LineWidth',1);
hold on;
plot(xx,temp(152,:),'k','LineWidth',1);
legend('ʵ��Ƥ������¶�','����Ƥ������¶�');
xlabel('ʱ�䣨s��');ylabel('�¶ȣ��棩');
title('Ƥ������¶�');
axis([1 5410 35 50]);
box off;
hold off;

%% ��ͬλ����ͬһʱ�̵Ļ�ͼ
figure(2);
subplot(2,2,1),plot(temp(:,50),'r','LineWidth',1.5);
xlabel('���λ�ã�mm��');ylabel('�¶ȣ��棩');
title('��ͬλ����ʱ��50sʱ���¶�');
axis([0 160 25 80]);
box off;
subplot(2,2,2),plot(temp(:,100),'r','LineWidth',1.5);
xlabel('���λ�ã�mm��');ylabel('�¶ȣ��棩');
title('��ͬλ����ʱ��100sʱ���¶�');
axis([0 160 25 80]);
box off;
subplot(2,2,3),plot(temp(:,500),'r','LineWidth',1.5);
xlabel('���λ�ã�mm��');ylabel('�¶ȣ��棩');
title('��ͬλ����ʱ��500sʱ���¶�');
axis([0 160 45 80]);
box off;
subplot(2,2,4),plot(temp(:,1650),'r','LineWidth',1.5);
xlabel('���λ�ã�mm��');ylabel('�¶ȣ��棩');
title('��ͬλ����ʱ��1650sʱ���¶�');
axis([0 160 45 80]);
box off;


%% ����������
delta = abs(temp(152,:)-data) / data;  % ����������
avr = sum(delta) / length(delta);
disp(['�����������Ϊ��',num2str(avr*100),'%']);


%% ���¶ȷֲ����д���ļ�
xlswrite('C:\Users\jj\Desktop\problem1.xlsx',temp([1:153],[1:5401])','Sheet1','A1');