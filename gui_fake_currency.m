function varargout = gui_fake_currency(varargin)
% GUI_FAKE_CURRENCY MATLAB code for gui_fake_currency.fig
%      GUI_FAKE_CURRENCY, by itself, creates a new GUI_FAKE_CURRENCY or raises the existing
%      singleton*.
%
%      H = GUI_FAKE_CURRENCY returns the handle to a new GUI_FAKE_CURRENCY or the handle to
%      the existing singleton*.
%
%      GUI_FAKE_CURRENCY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_FAKE_CURRENCY.M with the given input arguments.
%
%      GUI_FAKE_CURRENCY('Property','Value',...) creates a new GUI_FAKE_CURRENCY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_fake_currency_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_fake_currency_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_fake_currency

% Last Modified by GUIDE v2.5 17-Oct-2019 12:50:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_fake_currency_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_fake_currency_OutputFcn, ...
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


% --- Executes just before gui_fake_currency is made visible.
function gui_fake_currency_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_fake_currency (see VARARGIN)

% Choose default command line output for gui_fake_currency
handles.output = hObject;

% Update handles structure

set(handles.axes1,'xtick',[],'ytick',[])
set(handles.axes2,'xtick',[],'ytick',[])
set(handles.axes3,'xtick',[],'ytick',[])
set(handles.axes4,'xtick',[],'ytick',[])

guidata(hObject, handles);
% UIWAIT makes gui_fake_currency wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_fake_currency_OutputFcn(hObject, eventdata, handles) 
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
currency_train

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cd TEST
[J  P]=uigetfile('*.*','select the test Image');
I1=imread(strcat(P,J));
cd ..
% I=imresize(I1,[700 300]);
axes(handles.axes1),imshow(I1),title('Selected Test Image')
handles.I=I1;
guidata(hObject, handles);
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=handles.I;

I2=imsharpen(I);
axes(handles.axes2),imshow(I2),title('Sharpen Image')

handles.I2=I2;
guidata(hObject, handles);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I2=handles.I2;
if size(I2,3)>1
    I3=rgb2gray(I2);
end
axes(handles.axes3),imshow(I3),title('Gray Scale Image')

handles.I3=I3;
guidata(hObject, handles);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

I3=handles.I3;

edge_detected=edge(I3,'sobel');

axes(handles.axes4),imshow(edge_detected),title('Detected Edges')

guidata(hObject, handles);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I3=handles.I2;
I3=imresize(I3,[700 300]);
fq2=FEATURES(I3);  

load SS

st{1}='100';st{2}='500';st{3}='2000';st{4}='FAKE CURRENCY';
rst1=cnnresnettest(fq2(:)',4,SS);

msgbox(['Currency is ', st{rst1}]);
set(handles.edit1,'string',st( rst1))
NET.addAssembly('System.Speech');
speak = System.Speech.Synthesis.SpeechSynthesizer;
speak.Volume = 100;
speak.Speak(['Currency type is  ','   ', st{rst1}]);

guidata(hObject, handles);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1),imshow([255])
axes(handles.axes2),imshow([255])
axes(handles.axes3),imshow([255])
axes(handles.axes4),imshow([255])
set(handles.edit1,'string','')

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close 


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
