%% �����¶ȷֲ�

L = [0.6 6 3.6 5]; % ����
deltax = 0.1; % λ�ü��  mm
d_1 = ceil(L(1) / deltax); % ��һ��ļ��
d_2 = ceil(L(2) / deltax); % �ڶ���ļ��
d_3 = ceil(L(3) / deltax); % ������ļ��
d_4 = ceil(L(4) / deltax); % ���Ĳ�ļ��
yy = temp([d_1,d_2,d_3,d_4],:);
xx = 1:length(yy);
plot(xx,yy(1,:),'r-','LineWidth',1.5);
hold on
plot(xx,yy(2,:),'k-','LineWidth',1.5);
hold on
plot(xx,yy(3,:),'b-','LineWidth',1.5);
hold on 
plot(xx,yy(4,:),'g-','LineWidth',1.5);
box off
legend('��I��','��II��','��III��','��IV��')
axis([0 5500 20 80]);
xlabel('ʱ�䣨s��');ylabel('�¶ȣ��棩');title('ÿ��߽��ڲ�ͬʱ����¶�');