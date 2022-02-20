function varargout = snake_game(varargin)
% SNAKE_GAME MATLAB code for snake_game.fig
%      SNAKE_GAME, by itself, creates a new SNAKE_GAME or raises the existing
%      singleton*.
%
%      H = SNAKE_GAME returns the handle to a new SNAKE_GAME or the handle to
%      the existing singleton*.
%
%      SNAKE_GAME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SNAKE_GAME.M with the given input arguments.
%
%      SNAKE_GAME('Property','Value',...) creates a new SNAKE_GAME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before snake_game_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to snake_game_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help snake_game

% Last Modified by GUIDE v2.5 31-Jan-2022 22:20:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @snake_game_OpeningFcn, ...
                   'gui_OutputFcn',  @snake_game_OutputFcn, ...
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


% --- Executes just before snake_game is made visible.
function snake_game_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to snake_game (see VARARGIN)

% Choose default command line output for snake_game
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes snake_game wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes(handles.axes1);
axis('off');
% --- Outputs from this function are returned to the command line.
function varargout = snake_game_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
start_game_Callback(hObject, eventdata, handles);


% --- Executes on button press in up.
function up_Callback(hObject, eventdata, handles)
% hObject    handle to up (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in right.
global direction move;
if direction~=4
    direction=2;
    move=1;
end
function right_Callback(hObject, eventdata, handles)
% hObject    handle to right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction move;
if direction~=3
    direction=1;
    move=1;
end

% --- Executes on button press in down.
function down_Callback(hObject, eventdata, handles)
% hObject    handle to down (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in left.
global direction move;
if direction~=2
    direction=4;
    move=1;
end
function left_Callback(hObject, eventdata, handles)
% hObject    handle to left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in pause.
global direction move;
if direction~=1
    direction=3;
    move=1;
end
function pause_Callback(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global move;
move=0;

% --- Executes on button press in start_game.
function start_game_Callback(hObject, eventdata, handles)
% hObject    handle to start_game (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r g b;
global direction;
direction=3;
global points;
points=0;
set(handles.text3,'String',num2str(points));
global move;
move=0;
t=0.1;
global mode;
mode=0;
r=zeros(100,100);
g=zeros(100,100);
b=zeros(100,100);
locx=[50 50 50 50 50 50 50 50 50];
locy=[60 61 62 63 64 65 66 67 68];
update_snake(locx,locy);
while(1)    
    px=randperm(size(r,1),1);
    py=randperm(size(r,1),1);
    if sum(locx==px & locy==py)==0
        break
    end
end
r(px,py)=200;
g(px,py)=125;
b(px,py)=80;
        imshow(uint8(cat(3,r,g,b)));
        while mode==0
            imshow(uint8(cat(3,r,g,b)));
            pause(t);
            if(move)
                n=length(locx);
                for i=1:n
                  r(locx(i),locy(i))=0;
                  g(locx(i),locy(i))=0;
                  b(locx(i),locy(i))=0;
                end
                if sum((locx(1)==px)&(locy(1)==py))==1
                    locx(2:n+1)=locx(1:n);
                    locy(2:n+1)=locy(1:n);
                    while(1)    
                        px=randperm(size(r,1),1);
                        py=randperm(size(r,1),1);
                        if sum(locx==px & locy==py)==0
                            break;
                        end
                    end
                    r(px,py)=200;
                    g(px,py)=125;
                    b(px,py)=80;
                    points=points+1;
                    set(handles.text3,'String',num2str(points));
                else
                    locx(2:n)=locx(1:n-1);
                    locy(2:n)=locy(1:n-1);
                end
                    if direction==1 %right
                        if locy(1)==100 %touching border
                            locy(1)=1;
                        else
                            locy(1)=locy(1)+1;
                        end
                   elseif direction==2 %up
                        if locx(1)==1
                            locx(1)=100;
                        else
                            locx(1)=locx(1)-1;
                        end
                   elseif direction==3
                        if locy(1)==1
                            locy(1)=100;
                        else
                            locy(1)=locy(1)-1;
                        end
                   elseif direction==4
                        if locx(1)==100
                             locx(1)=1;
                        else
                            locx(1)=locx(1)+1;
                        end
                    end
                    if sum((locx(2:end)==locx(1))&(locy(2:end)==locy(1)))
                        gameover(255);

                        break
                    end
                update_snake(locx,locy);
                if points==5
                    t=0.08;
                elseif points==10
                    t=0.05;
                elseif points==15
                    t=0.03;
                elseif points==30
                    t=0.01;
                end
            end
        end
% --- Executes on button press in end_game.
function end_game_Callback(hObject, eventdata, handles)
% hObject    handle to end_game (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;

function update_snake(locx,locy)
  global r g b;
  r(locx(1),locy(1))=255;
  g(locx(1),locy(1))=0;
  b(locx(1),locy(1))=0;
  for i=2:length(locx)
      r(locx(i),locy(i))=0;
      g(locx(i),locy(i))=255;
      b(locx(i),locy(i))=0;
  end 
function gameover(c)
  c=255;
  r=zeros(100,100);
  g=zeros(100,100);
  b=zeros(100,100);
                for i=1:20
                    g(26,i+7)=c;%x
                    g(26,i+29)=c;
                    g(26,i+73)=c;
                    g(26,i+7)=c;
                    g(25+i,8)=c;%y
                    g(45,i+7)=c;
                    g(i+25,30)=c;
                    g(i+25,49)=c;
                    g(35,i+29)=c;
                    g(36,i+73)=c;
                    g(45,i+73)=c;
                    g(25+i,73)=c;
                    g(25+i,51)=c;
                    g(25+i,71)=c;
                    r(55+i,8)=c;
                    r(55+i,27)=c;
                    r(56,7+i)=c;
                    r(75,7+i)=c;
                    r(56,50+i)=c;
                    r(66,50+i)=c;
                    r(75,50+i)=c;%x
                    r(55+i,51)=c;%y
                    r(66,73+i)=c;
                    r(56,73+i)=c;%x
                    r(55+i,73)=c;    
                end
                for i=1:10
                    g(i+35,27)=c;
                    g(35,i+17)=c;
                    g(25+i,51+i)=c;
                    g(36-i,61+i)=c;
                    r(55+i,93)=c;
                    r(65+i,73+i)=c;
                    r(55+i,30)=c;
                    r(55+i,49)=c;
                    r(65+i,29+i)=c;
                    r(76-i,39+i)=c;

                end

                im=cat(3,r,g,b);
                subimage(uint8(im));
                msgbox('Your score is %d',points);


% --- Executes on button press in easy.
function easy_Callback(hObject, eventdata, handles)
% hObject    handle to easy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r g b;
global direction;
direction=3;
global points;
points=0;
set(handles.text3,'String',num2str(points));
global move;
move=0;
t=0.1;
global mode;
mode=0;
if mode==0
        r=zeros(100,100);
        g=zeros(100,100);
        b=zeros(100,100);
        locx=[50 50 50 50 50 50 50 50 50];
        locy=[60 61 62 63 64 65 66 67 68];
        update_snake(locx,locy);
        while(1)    
            px=randperm(size(r,1),1);
            py=randperm(size(r,1),1);
            if sum(locx==px & locy==py)==0
                break;
            end
        end
        r(px,py)=200;
        g(px,py)=125;
        b(px,py)=80;
        imshow(uint8(cat(3,r,g,b)));
        while mode==0
            imshow(uint8(cat(3,r,g,b)));
            pause(t);
            if(move)
                n=length(locx);
                for i=1:n
                  r(locx(i),locy(i))=0;
                  g(locx(i),locy(i))=0;
                  b(locx(i),locy(i))=0;
                end
                if sum((locx(1)==px)&(locy(1)==py))==1
                    locx(2:n+1)=locx(1:n);
                    locy(2:n+1)=locy(1:n);
                    while(1)    
                        px=randperm(size(r,1),1);
                        py=randperm(size(r,1),1);
                        if sum(locx==px & locy==py)==0
                            break;
                        end
                    end
                    r(px,py)=200;
                    g(px,py)=125;
                    b(px,py)=80;
                    points=points+1;
                    set(handles.text3,'String',num2str(points));
                else
                    locx(2:n)=locx(1:n-1);
                    locy(2:n)=locy(1:n-1);
                end
                    if direction==1
                        if locy(1)==100
                            locy(1)=1;
                        else
                            locy(1)=locy(1)+1;
                        end
                   elseif direction==2
                        if locx(1)==1
                            locx(1)=100;
                        else
                            locx(1)=locx(1)-1;
                        end
                   elseif direction==3
                        if locy(1)==1
                            locy(1)=100;
                        else
                            locy(1)=locy(1)-1;
                        end
                   elseif direction==4
                        if locx(1)==100
                             locx(1)=1;
                        else
                            locx(1)=locx(1)+1;
                        end
                    end
                    if sum((locx(2:end)==locx(1))&(locy(2:end)==locy(1)))
                        gameover(255);

                        break
                    end
                update_snake(locx,locy);
                if points==5
                    t=0.08;
                elseif points==10
                    t=0.05;
                elseif points==15
                    t=0.03;
                elseif points==30
                    t=0.01;
                end
            end
        end
end
% --- Executes on button press in hard.
function hard_Callback(hObject, eventdata, handles)
% hObject    handle to hard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r g b
global direction;
direction=3;
global points;
points=0;
set(handles.text3,'String',num2str(points));
global move;
move=0;
t=0.1;
global mode;
mode=2;
        r=zeros(100,100);
        g=zeros(100,100);
        b=zeros(100,100);
        mhx=zeros(1,520);
        mhy=zeros(1,520);
        for i=1:100
            mhx(i)=1;
            mhy(i)=i;
            mhx(100+i)=i;
            mhy(100+i)=100;
            mhx(200+i)=100;
            mhy(200+i)=i;
            mhx(300+i)=i;
            mhy(300+i)=1;
        end
        for i=1:60
            mhx(400+i)=21;
            mhy(400+i)=20+i;
            mhx(460+i)=80;
            mhy(460+i)=20+i;
        end
        locx=[50 50 50 50 50 50 50 50 50];
        locy=[60 61 62 63 64 65 66 67 68];
        update_snake(locx,locy);
        hard(mhx,mhy);
        while(1)   
            px=randperm(size(r,1),1);
            py=randperm(size(r,1),1);
            if sum(locx==px & locy==py)==0
                break;
            end
            if sum(mhx==px & mhx==py)==0
                break;
            end
        end
        r(px,py)=200;
        g(px,py)=125;
        b(px,py)=80;
        imshow(uint8(cat(3,r,g,b)));
        while mode==2
            imshow(uint8(cat(3,r,g,b)));
            pause(t);
            if(move)
                n=length(locx);
                for i=1:n
                  r(locx(i),locy(i))=0;
                  g(locx(i),locy(i))=0;
                  b(locx(i),locy(i))=0;
                end
                if sum((locx(1)==px)&(locy(1)==py))==1
                    locx(2:n+1)=locx(1:n);
                    locy(2:n+1)=locy(1:n);
                    while(1)    
                        px=randperm(size(r,1),1);
                        py=randperm(size(r,1),1);
                        if sum(locx==px & locy==py)==0
                            break;
                        end
                        if sum(mhx==px & mhx==py)==0
                            break;
                        end
                    end
                    r(px,py)=200;
                    g(px,py)=125;
                    b(px,py)=80;
                    points=points+1;
                    set(handles.text3,'String',num2str(points));
                else
                    locx(2:n)=locx(1:n-1);
                    locy(2:n)=locy(1:n-1);
                end
                    if direction==1
                        if locy(1)==100
                            locy(1)=1;
                        else
                            locy(1)=locy(1)+1;
                        end
                   elseif direction==2
                        if locx(1)==1
                            locx(1)=100;
                        else
                            locx(1)=locx(1)-1;
                        end
                   elseif direction==3
                        if locy(1)==1
                            locy(1)=100;
                        else
                            locy(1)=locy(1)-1;
                        end
                   elseif direction==4
                        if locx(1)==100
                             locx(1)=1;
                        else
                            locx(1)=locx(1)+1;
                        end
                    end
                    if sum((locx(2:end)==locx(1))&(locy(2:end)==locy(1)))
                        gameover(255);

                        break
                    end
                    if sum((mhx(1:end)==locx(1))&(mhy(1:end)==locy(1)))
                        gameover(255);

                        break
                    end
                update_snake(locx,locy);
                if points==5
                    t=0.08;
                elseif points==10
                    t=0.05;
                elseif points==15
                    t=0.03;
                elseif points==30
                    t=0.01;
                end
            end
        end
% --- Executes on button press in medium.
function medium_Callback(hObject, eventdata, handles)
% hObject    handle to medium (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r g b
global direction;
direction=3;
global points;
points=0;
set(handles.text3,'String',num2str(points));
global move;
move=0;
t=0.1;
global mode;
mode=1;
    if mode==1
        points=0;
        set(handles.text3,'String',num2str(points));
        r=zeros(100,100);
        g=zeros(100,100);
        b=zeros(100,100);
        mmx=zeros(1,400);
        mmy=zeros(1,400);
        for i=1:100
            mmx(i)=1;
            mmy(i)=i;
            mmx(100+i)=i;
            mmy(100+i)=100;
            mmx(200+i)=100;
            mmy(200+i)=i;
            mmx(300+i)=i;
            mmy(300+i)=1;
        end
        locx=[50 50 50 50 50 50 50 50 50];
        locy=[60 61 62 63 64 65 66 67 68];
        update_snake(locx,locy);
        medium(mmx,mmy);
        while(1)    
            px=randperm(size(r,1),1);
            py=randperm(size(r,1),1);
            if sum(locx==px & locy==py)==0
                break;
            end
            if sum(mmx==px & mmy==py)==0
                break;
            end
        end
        r(px,py)=200;
        g(px,py)=125;
        b(px,py)=80;
        imshow(uint8(cat(3,r,g,b)));
        while mode==1
            imshow(uint8(cat(3,r,g,b)));
            pause(t);
            if(move)
                n=length(locx);
                for i=1:n
                  r(locx(i),locy(i))=0;
                  g(locx(i),locy(i))=0;
                  b(locx(i),locy(i))=0;
                end
                if sum((locx(1)==px)&(locy(1)==py))==1
                    locx(2:n+1)=locx(1:n);
                    locy(2:n+1)=locy(1:n);
                    while(1)    
                        px=randperm(size(r,1),1);
                        py=randperm(size(r,1),1);
                        if sum(locx==px & locy==py)==0
                            break;
                        end
                        if sum(mmx==px & mmy==py)==0
                            break;
                        end
                    end
                    r(px,py)=200;
                    g(px,py)=125;
                    b(px,py)=80;
                    points=points+1;
                    set(handles.text3,'String',num2str(points));
                else
                    locx(2:n)=locx(1:n-1);
                    locy(2:n)=locy(1:n-1);
                end
                    if direction==1
                            locy(1)=locy(1)+1;
                   elseif direction==2
                            locx(1)=locx(1)-1
                   elseif direction==3
                            locy(1)=locy(1)-1;
                   elseif direction==4
                            locx(1)=locx(1)+1;
                    end
                    if sum((mmx(1:end)==locx(1))&(mmy(1:end)==locy(1)))
                        gameover(255);

                        break
                    end

                    if sum((locx(2:end)==locx(1))&(locy(2:end)==locy(1)))
                        gameover(255);

                        break
                    end
                update_snake(locx,locy);
                if points==5
                    t=0.08;
                elseif points==10
                    t=0.05;
                elseif points==15
                    t=0.03;
                elseif points==30
                    t=0.01;
                end
            end
        end
    end
function medium(mmx,mmy)
    global r g b;
   
    for i=1:100
        r(mmx(i),mmy(i))=0;
        g(mmx(i),mmy(i))=0;
        b(mmx(i),mmy(i))=255;
    end
    for i=101:200
        r(mmx(i),mmy(i))=0;
        g(mmx(i),mmy(i))=0;
        b(mmx(i),mmy(i))=255;
    end
    for i=201:300
        r(mmx(i),mmy(i))=0;
        g(mmx(i),mmy(i))=0;
        b(mmx(i),mmy(i))=255;
    end
    for i=301:400
        r(mmx(i),mmy(i))=0;
        g(mmx(i),mmy(i))=0;
        b(mmx(i),mmy(i))=255;
    end
function hard(mhx,mhy)
    global r g b
    for i=1:100
        r(mhx(i),mhy(i))=0;
        g(mhx(i),mhy(i))=0;
        b(mhx(i),mhy(i))=255;
    end
    for i=101:200
        r(mhx(i),mhy(i))=0;
        g(mhx(i),mhy(i))=0;
        b(mhx(i),mhy(i))=255;
    end
    for i=201:300
        r(mhx(i),mhy(i))=0;
        g(mhx(i),mhy(i))=0;
        b(mhx(i),mhy(i))=255;
    end
    for i=301:400
        r(mhx(i),mhy(i))=0;
        g(mhx(i),mhy(i))=0;
        b(mhx(i),mhy(i))=255;
    end
    for i=401:460
        r(mhx(i),mhy(i))=0;
        g(mhx(i),mhy(i))=0;
        b(mhx(i),mhy(i))=255;
    end
    for i=461:520
        r(mhx(i),mhy(i))=0;
        g(mhx(i),mhy(i))=0;
        b(mhx(i),mhy(i))=255;
    end