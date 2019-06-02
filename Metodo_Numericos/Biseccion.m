function varargout = Biseccion(varargin)
% BISECCION M-file for Biseccion.fig
%      BISECCION, by itself, creates a new BISECCION or raises the existing
%      singleton*.
%
%      H = BISECCION returns the handle to a new BISECCION or the handle to
%      the existing singleton*.
%
%      BISECCION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BISECCION.M with the given input arguments.
%
%      BISECCION('Property','Value',...) creates a new BISECCION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Biseccion_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Biseccion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help Biseccion

% Last Modified by GUIDE v2.5 21-May-2016 12:00:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Biseccion_OpeningFcn, ...
                   'gui_OutputFcn',  @Biseccion_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin == 0  % LAUNCH GUI

	fig = openfig(mfilename,'reuse');

	% Generate a structure of handles to pass to callbacks, and store it. 
	handles = guihandles(fig);
	guidata(fig, handles);

	if nargout > 0
		varargout{1} = fig;
	end

elseif ischar(varargin{1}) % INVOKE NAMED SUBFUNCTION OR CALLBACK

	try
		[varargout{1:nargout}] = feval(varargin{:}); % FEVAL switchyard
	catch
		disp(lasterr);
	end

end

% --- Executes just before Biseccion is made visible.
function Biseccion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Biseccion (see VARARGIN)

% Choose default command line output for Biseccion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Biseccion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Biseccion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function varargout = pushbutton1_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.pushbutton1.

%obtencion de handles de la gui
fx=get(handles.f,'string');
xa(1)=str2num(get(handles.a,'string'));
xb(1)=str2num(get(handles.b,'string'));

%valores por defecto
n=30;toler=0.001;
ea(1)=100;
n=30;toler=0.01;

%cuerpo del programa
exito=0;
for i=1:n
    xc(i)=(xa(i)+xb(i))/2;
    x=xc(i);yc(i)=eval(fx);
    x=xa(i);ya(i)=eval(fx);
    x=xb(i);yb(i)=eval(fx);
    if (abs(ya(i))-eps)<eps 
        xc(i)=xa(i);
        exito=1;
        break;
    end
    if  (abs(yb(i))-eps)<eps 
        xc(i)=xb(i);
        exito=1;
        break;
    end 
    if  (abs(yc(i))-eps)<eps
        exito=1;
        break;
    end
    if i==1
        if ya(i)*yb(i)>0
            break;
        end
    end
    if i>1
        ea(i)=abs((xc(i)-xc(i-1))/((xc(i)+eps)))*100;
        if ea(i)<toler
            exito=1;
            break;
        end
    end
    if i==n
       break;
    end
    if yc(i)*ya(i)<0
           xb(i+1)=xc(i);
           xa(i+1)=xa(i);
    else
        xa(i+1)=xc(i);
        xb(i+1)=xb(i);
    end
end

%impresion de resultados
if exito==1
    raiz=xc(i);
    set(handles.c,'string',num2str(raiz));
else
    set(handles.c,'string','');
    msgbox('no se encontro la solucion');
end

% --------------------------------------------------------------------
function varargout = pushbutton2_Callback(h, eventdata, handles, varargin)
% Stub for Callback of the uicontrol handles.pushbutton2.
set(handles.f,'string','');
set(handles.a,'string','');
set(handles.b,'string','');
set(handles.c,'string','');
cla reset;

function f_Callback(hObject, eventdata, handles)
% hObject    handle to f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f as text
%        str2double(get(hObject,'String')) returns contents of f as a double


% --- Executes during object creation, after setting all properties.
function f_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function a_Callback(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a as text
%        str2double(get(hObject,'String')) returns contents of a as a double


% --- Executes during object creation, after setting all properties.
function a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function b_Callback(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b as text
%        str2double(get(hObject,'String')) returns contents of b as a double


% --- Executes during object creation, after setting all properties.
function b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function c_Callback(hObject, eventdata, handles)
% hObject    handle to c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c as text
%        str2double(get(hObject,'String')) returns contents of c as a double


% --- Executes during object creation, after setting all properties.
function c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f1=inline(get(handles.f,'string'));
a1=str2double(get(handles.a,'string'));
b1=str2double(get(handles.b,'string'));
c1=str2double(get(handles.c,'string'));

if a1~=b1
    ezplot(f1,[a1,b1]),grid on;
else
    ezplot(f1),grid on;
end


