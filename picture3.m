load('temp.mat');
[row,col]=size(temp);
x = 1:row;
y = 1:col;
[xxx,yyy] = meshgrid(x,y);
meshc(xxx',yyy',temp);
% xis([0 160 0 5500 20 80]);
colorbar
colormap jet
rotate3d on;