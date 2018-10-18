%% 导入温度分布

L = [0.6 6 3.6 5]; % 长度
deltax = 0.1; % 位置间隔  mm
d_1 = ceil(L(1) / deltax); % 第一层的间隔
d_2 = ceil(L(2) / deltax); % 第二层的间隔
d_3 = ceil(L(3) / deltax); % 第三层的间隔
d_4 = ceil(L(4) / deltax); % 第四层的间隔
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
legend('第I层','第II层','第III层','第IV层')
axis([0 5500 20 80]);
xlabel('时间（s）');ylabel('温度（℃）');title('每层边界在不同时间的温度');