clc;close;
clear all;

L = [0.6 0 3.6 5.5];
h = -159.8423;  % hϵ��
n = 3600;  % ʱ��
deltat = 0.0002;  % ʱ���� s
deltax = 0.1;  % λ�ü�� mm

for d = 9.5:0.1:25
    d
    L(2) = d;
    dd = ceil(sum(L) / deltax);
    T = zeros(dd,2);
    T(:,1) = 25;
    T(1,:) = 65;
    T(dd,1) = 37;
    
    d_1 = ceil(L(1) / deltax); % ��һ��ļ��
    d_2 = ceil(L(2) / deltax); % �ڶ���ļ��
    d_3 = ceil(L(3) / deltax); % ������ļ��
    d_4 = ceil(L(4) / deltax); % ���Ĳ�ļ��
    
    temp(:,1) = T(:,1);
    flag = 1;
    
    sum_time = 0;
    flag2 = 1;
    
    for i = 1:n*(ceil(1/deltat))
        T(1,2) = 65;
        for x = 2:dd
            if x == dd
                T(x,2) = (T(x-1,2)-deltax*h*37*1e-3) / (1-deltax*h*1e-3);
            else
                if x <= d_1
                    aa = (0.082*deltat)*10^6/(deltax^2 * 1377 * 300);  % ��һ���ϵ��
                elseif x > d_1 && x <= (d_2 + d_1)
                    aa = (0.37*deltat)*10^6/(deltax^2*862*2100);  % �ڶ����ϵ��
%                    aa = k(1,2)*deltat/(deltax^2 * c(1,2) * p(1,2));

                elseif x > (d_2 + d_1) && x <= (d_3 + d_2 + d_1)
                    aa = (0.045*deltat)*10^6/(deltax^2*74.2*1726);  % �������ϵ��
%                    aa = k(1,3)*deltat/(deltax^2 * c(1,3) * p(1,3));
                else 
                    aa = (0.028*deltat)*10^6/(deltax^2*1.18*1005);  % ���Ĳ��ϵ��
%                    aa = k(1,4)*deltat/(deltax^2 * c(1,4) * p(1,4));
                end
                T(x,2) = T(x,1) + aa*(T(x+1,1) - 2*T(x,1) + T(x-1,1));  % ������ʽ��΢�ַ������
            end
        end
%         if T(dd,2) >= 44
%             sum_time = sum_time + 1;
%         end
        if mod(i,ceil(1/deltat)) == 0
            flag = flag + 1;
            temp(:,flag) = T(:,2);
            if temp(dd,flag) >= 44
                sum_time = sum_time + 1;
            end
        end
        T(:,1) = T(:,2);
        if temp(dd,flag) > 47 || sum_time > 300
            flag2 = 0;
            break;
        end
    end
    if flag2 ~= 0
        disp(['�ú������Լ��������',num2str(d)]);
    end
    temp = [];
end