function varargout = test(varargin)
% TEST MATLAB code for test.fig
%      TEST, by itself, creates a new TEST or raises the existing
%      singleton*.
%
%      H = TEST returns the handle to a new TEST or the handle to
%      the existing singleton*.
%
%      TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST.M with the given input arguments.
%
%      TEST('Property','Value',...) creates a new TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test

% Last Modified by GUIDE v2.5 16-Sep-2018 17:27:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test_OpeningFcn, ...
                   'gui_OutputFcn',  @test_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before test is made visible.
function test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test (see VARARGIN)

% Choose default command line output for test
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[FileName,PathName,filespec] = uiputfile({'*.jpg','JPEG(*.jpg)';...
                                 '*.bmp','Bitmap(*.bmp)';...
                                 '*.png','(*.png)';...
                                 '*.*',  'All Files (*.*)'},...
                                 'Save Picture','Untitled');
h = getframe(handles.axes1);
imwrite(h.cdata,fullfile(PathName,FileName));
hs = msgbox('ͼƬ����ɹ���','��ʾ��Ϣ','help','modal');
ht = findobj(hs,'Type','text');
set(ht,'FontSize',15,'Unit','normal');
% �ı�Ի����С
set(hs,'Resize','on');% �Զ��ı�


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(gcf);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global temp data L
data = xlsread('C:\Users\jj\Desktop\a1.xlsx','Sheet2','B3:B5403')';  % ��������
L = [0.6 0 3.6 0]; % ����

%% �����������
prompt = {'��II���ȣ���mm��','��IV���ȣ���mm��','ʱ��Ϊ����s��','ʱ����Ϊ����s��','�����¶�Ϊ�����棩'};%������ʾ�ַ���
title = 'ȷ���¶ȷֲ��Ĳ���';%���ñ���
% numlines = 1;%ָ���������ݵ�����
defAns = {'6','5','5400','0.0002','75'};%�趨Ĭ��ֵ
Resize = 'on';%�趨�Ի���ߴ�ɵ���
canshu = inputdlg(prompt,title,[1 50;1 50;1 50;1 50;1 50],defAns,'on');%��������Ի���
d1 = canshu(1,1);d4 = canshu(2,1);n = canshu(3,1);deltat = canshu(4,1);tem = canshu(5,1);
d1 = str2num(char(d1));d4 = str2num(char(d4));
n = str2num(char(n));deltat = str2num(char(deltat));tem = str2num(char(tem));


%% �����¶ȷֲ�
L(2) = d1;L(4) = d4;
deltax = 0.1; % λ�ü��  mm
dd = ceil(sum(L) / deltax);  % �ܼ��
% T = zeros(dd,n+1);
T = zeros(dd+1,2);
T(:,1) = 25; % ��һ��ʱ��μ��������ʱ���¶�Ϊ25
T(1,:) = tem; % ��һ��λ�õ��¶�Ϊ75
% T(dd+1,:) = 37; % ���һ��λ�õ��¶�Ϊ37

T(dd+1,1) = data(1,1);

d_1 = ceil(L(1) / deltax); % ��һ��ļ��
d_2 = ceil(L(2) / deltax); % �ڶ���ļ��
d_3 = ceil(L(3) / deltax); % ������ļ��
d_4 = ceil(L(4) / deltax); % ���Ĳ�ļ��

temp = zeros(dd+1,1);
temp(:,1) = T(:,1);  % ���
flag = 1;  % ��־����

for i = 1:n*(ceil(1/deltat))  % ʱ���
    T(1,2) = 75;  % ��ʼ��
    T(dd+1,2) = data(1,flag);
%    T(dd+1,2) = 37;
    for x = 2:dd % λ�ö�
        if x <= d_1
            aa = (0.082*0.0002)*10^6/(deltax^2 * 1377 * 300);  % ��һ���ϵ��
        elseif x > d_1 && x <= (d_2 + d_1)
            aa = (0.37*0.0002)*10^6/(deltax^2*862*2100);  % �ڶ����ϵ��
%            aa = k(1,2)*deltat/(deltax^2 * c(1,2) * p(1,2));

        elseif x > (d_2 + d_1) && x <= (d_3 + d_2 + d_1)
            aa = (0.045*0.0002)*10^6/(deltax^2*74.2*1726);  % �������ϵ��
%            aa = k(1,3)*deltat/(deltax^2 * c(1,3) * p(1,3));
        else 
            aa = (0.028*0.0002)*10^6/(deltax^2*1.18*1005);  % ���Ĳ��ϵ��
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
cla reset
axes(handles.axes1);
xx = 1:length(temp);
plot(xx,data,'r','LineWidth',1);
hold on;
plot(xx,temp(152,:),'k','LineWidth',1);
legend('ʵ��Ƥ������¶�','����Ƥ������¶�');
xlabel('ʱ�䣨s��');ylabel('�¶ȣ��棩');
% axis equal
% axis off % ȥ��������

delta = abs(temp(152,:)-data) / data;  % ����������
avr = sum(delta) / length(delta);
set(handles.text2,'string',[num2str(avr*100),'%']);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global temp data
[FileName,PathName,filespec] = uiputfile({'*.xlsx',;...
                                 'All Files (*.*)'},...
                                 'Save file','Untitled');

xlswrite([PathName,FileName],temp,'Sheet1','A1');
hs = msgbox('�ļ�����ɹ���','��ʾ��Ϣ','help','modal');
ht = findobj(hs,'Type','text');
set(ht,'FontSize',15,'Unit','normal');
% �ı�Ի����С
set(hs,'Resize','on');% �Զ��ı�


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global temp data L
str = get(hObject,'string');
% axes(handles.axes1);

switch str
    case '����ͼ'
        axes(handles.axes1);
        xx = 1:length(temp);
        plot(xx,data,'r','LineWidth',1);
        hold on;
        plot(xx,temp(152,:),'k','LineWidth',1);
        legend('ʵ��Ƥ������¶�','����Ƥ������¶�');
        xlabel('ʱ�䣨s��');ylabel('�¶ȣ��棩');
%        axis([1 5410 35 50]);
    case 'ͬʱ��'
        prompt = {'��ͬλ����ʱ�䣨�����¶ȣ�s����'};%������ʾ�ַ���
        title = 'ȷ�����ͼ���ʱ��';%���ñ���
        % numlines = 1;%ָ���������ݵ�����
        defAns = {'100'};%�趨Ĭ��ֵ
        Resize = 'on';%�趨�Ի���ߴ�ɵ���
        answer = inputdlg(prompt,title,[1 50],defAns,'on');%��������Ի���
        arr = answer(1,1);
        arr = str2num(char(arr));
        
        cla reset
        
        axes(handles.axes1);
        plot(temp(:,arr),'r','LineWidth',1.5);
    case 'ͬλ��'
        deltax = 0.1; % λ�ü��  mm
        d_1 = ceil(L(1) / deltax); % ��һ��ļ��
        d_2 = ceil(L(2) / deltax); % �ڶ���ļ��
        d_3 = ceil(L(3) / deltax); % ������ļ��
        d_4 = ceil(L(4) / deltax); % ���Ĳ�ļ��
        yy = temp([d_1,d_2,d_3,d_4],:);
        xx = 1:length(yy);
        cla reset
        axes(handles.axes1);
        plot(xx,yy(1,:),xx,yy(2,:),xx,yy(3,:),xx,yy(4,:));
%         hold on
%         plot(xx,yy(2,:),'k-','LineWidth',1.5);
%         hold on
%         plot(xx,yy(3,:),'b-','LineWidth',1.5);
%         hold on 
%         plot(xx,yy(4,:),'g-','LineWidth',1.5);
%         box off
        legend('��I��','��II��','��III��','��IV��')
%        axis([0 5500 20 80]);
        xlabel('ʱ�䣨s��');ylabel('�¶ȣ��棩');
%        title('ÿ��߽��ڲ�ͬʱ����¶�');
    case '��άͼ'
        [row,col]=size(temp);
        x = 1:row;
        y = 1:col;
        [xxx,yyy] = meshgrid(x,y);
        cla reset
        axes(handles.axes1);
        meshc(xxx',yyy',temp);
%        axis([0 160 0 5500 20 80]);
        colorbar
        colormap jet
        rotate3d on;  % ������ת
    case '�ȶ�ͼ'
        num = rot90(temp);
        cla reset
        axes(handles.axes1);
        
        imagesc(num);
        colorbar
        colormap jet
        xlabel('λ�ã�mm��');ylabel('ʱ�䣨s��');
end
