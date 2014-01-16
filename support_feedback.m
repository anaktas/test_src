function varargout = support_feedback(varargin)
% SUPPORT_FEEDBACK MATLAB code for support_feedback.fig
%      SUPPORT_FEEDBACK, by itself, creates a new SUPPORT_FEEDBACK or raises the existing
%      singleton*.
%
%      H = SUPPORT_FEEDBACK returns the handle to a new SUPPORT_FEEDBACK or the handle to
%      the existing singleton*.
%
%      SUPPORT_FEEDBACK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUPPORT_FEEDBACK.M with the given input arguments.
%
%      SUPPORT_FEEDBACK('Property','Value',...) creates a new SUPPORT_FEEDBACK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before support_feedback_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to support_feedback_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help support_feedback

% Last Modified by GUIDE v2.5 07-Aug-2013 13:36:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @support_feedback_OpeningFcn, ...
                   'gui_OutputFcn',  @support_feedback_OutputFcn, ...
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


% --- Executes just before support_feedback is made visible.
function support_feedback_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to support_feedback (see VARARGIN)

% Choose default command line output for support_feedback
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes support_feedback wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = support_feedback_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function feedbackMessage_Callback(hObject, eventdata, handles)
% hObject    handle to feedbackMessage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of feedbackMessage as text
%        str2double(get(hObject,'String')) returns contents of feedbackMessage as a double


% --- Executes during object creation, after setting all properties.
function feedbackMessage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to feedbackMessage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in sendFeedback.
function sendFeedback_Callback(hObject, eventdata, handles)
% hObject    handle to sendFeedback (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    try
        message = get(handles.editMessage, 'string');
        sendFeedbackMessage(message);
    catch exc
        msgbox('An error has occured while pressing the send feedback button. Please try again.', 'Error', 'error');
        errLogger(exc.message);
        webLog(exc.message, 'error');    
    end



function editMessage_Callback(hObject, eventdata, handles)
% hObject    handle to editMessage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editMessage as text
%        str2double(get(hObject,'String')) returns contents of editMessage as a double


% --- Executes during object creation, after setting all properties.
function editMessage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editMessage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
