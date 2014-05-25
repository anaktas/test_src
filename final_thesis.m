function varargout = final_thesis(varargin)
% FINAL_THESIS MATLAB code for final_thesis.fig
%      FINAL_THESIS, by itself, creates a new FINAL_THESIS or raises the existing
%      singleton*.
%
%      H = FINAL_THESIS returns the handle to a new FINAL_THESIS or the handle to
%      the existing singleton*.
%
%      FINAL_THESIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL_THESIS.M with the given input arguments.
%
%      FINAL_THESIS('Property','Value',...) creates a new FINAL_THESIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final_thesis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final_thesis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final_thesis

% Last Modified by GUIDE v2.5 08-Apr-2014 20:44:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_thesis_OpeningFcn, ...
                   'gui_OutputFcn',  @final_thesis_OutputFcn, ...
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


% --- Executes just before final_thesis is made visible.
function final_thesis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final_thesis (see VARARGIN)

% Choose default command line output for final_thesis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes final_thesis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = final_thesis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function functionEdit_Callback(hObject, eventdata, handles)
% hObject    handle to functionEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of functionEdit as text
%        str2double(get(hObject,'String')) returns contents of functionEdit as a double


% --- Executes during object creation, after setting all properties.
function functionEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to functionEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editA_Callback(hObject, eventdata, handles)
% hObject    handle to editA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA as text
%        str2double(get(hObject,'String')) returns contents of editA as a double


% --- Executes during object creation, after setting all properties.
function editA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editB_Callback(hObject, eventdata, handles)
% hObject    handle to editB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB as text
%        str2double(get(hObject,'String')) returns contents of editB as a double


% --- Executes during object creation, after setting all properties.
function editB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
    trcLogger('The application was started.');
    global methodFlag;
    global onceFlag;
    global webTraceFlag;
    onceFlag = 1;
    methodFlag = 1;
    webTraceFlag = 0;

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global webTraceFlag;
    trcLogger('The application was ended.');
    if webTraceFlag == 1
        webLog('The application was ended.', 'event');
    end

% Hint: delete(hObject) closes the figure
delete(hObject);


function editCount_Callback(hObject, eventdata, handles)
% hObject    handle to editCount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCount as text
%        str2double(get(hObject,'String')) returns contents of editCount as a double


% --- Executes during object creation, after setting all properties.
function editCount_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editTol_Callback(hObject, eventdata, handles)
% hObject    handle to editTol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTol as text
%        str2double(get(hObject,'String')) returns contents of editTol as a double


% --- Executes during object creation, after setting all properties.
function editTol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editInformation_Callback(hObject, eventdata, handles)
% hObject    handle to editInformation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editInformation as text
%        str2double(get(hObject,'String')) returns contents of editInformation as a double


% --- Executes during object creation, after setting all properties.
function editInformation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editInformation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function aboutMenu_Callback(hObject, eventdata, handles)
% hObject    handle to aboutMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    try
        trcLogger('The about page is showing');
        web('about.html');
    catch exc
        errLogger(exc.message);
    end


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function saveImage_Callback(hObject, eventdata, handles)
% hObject    handle to saveImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    try
        hndlAxes = handles.visualizationAxes;
        [file,path]=uiputfile({'*.bmp','bmp'},'Αποθήκευση εικόνας ως'); f=getframe(hndlAxes); [x,map]=frame2im(f); imwrite(x,fullfile(path, file),'bmp');
        msgbox('The image has been saved successful.');
    catch exc
        msgbox('An error has occured while saving the image. Please try again.', 'Error', 'error');
        errLogger(exc.message);
    end


% --- Executes on button press in cleanInformationBttn.
function cleanInformationBttn_Callback(hObject, eventdata, handles)
% hObject    handle to cleanInformationBttn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global webTraceFlag;
    try
        set(handles.editInformation,'String','');
        trcLogger('The information box has been cleaned.');
        if webTraceFlag == 1
            webLog('The information box has been cleaned.', 'event');
        end
    catch exc
        msgbox('An error has occured while cleaning the information box. Please try again.', 'Error', 'error');
        errLogger(exc.message);
        if webTraceFlag == 1
            webLog(exc.message, 'error');
        end
    end


% --------------------------------------------------------------------
function supportContact_Callback(hObject, eventdata, handles)
% hObject    handle to supportContact (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    support_feedback


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    my_version


% --- Executes when selected object is changed in uipanel6.
function uipanel6_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel6 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
    hndlInformationBox = handles.editInformation;
    global methodFlag;
    global onceFlag;
    global webTraceFlag;
    switch get(eventdata.NewValue, 'Tag')
        case 'rdBoltzano'
            methodFlag = 1;
            onceFlag = 1;
            updateInformationBox(hndlInformationBox, 'Boltzano method selected.');
            trcLogger('Boltzano method selected.');
            if webTraceFlag == 1
                webLog('Boltzano method selected.', 'event');
            end
        case 'rdString'
            methodFlag = 2;
            onceFlag = 1;
            updateInformationBox(hndlInformationBox, 'String method selected.');
            trcLogger('String method selected.');
            if webTraceFlag == 1
                webLog('String method selected.', 'event');
            end
        case 'rdNewtonRaphson'
            methodFlag = 3;
            onceFlag = 1;
            updateInformationBox(hndlInformationBox, 'Newton-Raphson method selected.');
            trcLogger('Newton-Raphson method selected.');
            if webTraceFlag == 1
                webLog('Newton-Raphson method selected.', 'event');
            end
    end


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in bttnCont.
function bttnCont_Callback(hObject, eventdata, handles)
% hObject    handle to bttnCont (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    nullData = [];
    set(handles.resultTable, 'Data', nullData)
    set(handles.bttnCont, 'Enable', 'off');
    global methodFlag;
    switch methodFlag
        case 1
            execBoltzano(handles);
            trcLogger('Executing Boltzano method continiously.');
        case 2
            execString(handles);
            trcLogger('Executing String method continiously.');
        case 3
            execNewtonRaphson(handles);
            trcLogger('Executing Newton-Raphson method continiously.');
    end
    set(handles.bttnCont, 'Enable', 'on');


% --- Executes on button press in bttnStep.
function bttnStep_Callback(hObject, eventdata, handles)
% hObject    handle to bttnStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global onceFlag;
    if onceFlag == 1
        nullData = [];
        set(handles.resultTable, 'Data', nullData)
    end
    set(handles.bttnStep, 'Enable', 'off');
    global methodFlag;
    switch methodFlag
        case 1
            stepExecBoltzano(handles);
            trcLogger('Executing Boltzano method step-by-step.');
        case 2
            stepExecString(handles);
            trcLogger('Executing String method step-by-step.');
        case 3
            stepExecNewtonRaphson(handles);
            trcLogger('Executing Newton-Raphson method step-by-step.');
    end
    set(handles.bttnStep, 'Enable', 'on');


% --- Executes when selected object is changed in uipanel7.
function uipanel7_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel7 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
    hndlInformationBox = handles.editInformation;
    global webTraceFlag;
    switch get(eventdata.NewValue, 'Tag')
        case 'rdCont'
            set(handles.bttnCont, 'Enable', 'on');
            set(handles.bttnStep, 'Enable', 'off');
            set(handles.editCount, 'Enable', 'on');
            set(handles.editTol, 'Enable', 'on');
            updateInformationBox(hndlInformationBox, 'Continiously execution mode.');
            trcLogger('Continiously execution mode.');
            if webTraceFlag == 1
                webLog('Continiously execution mode.', 'event');
            end
        case 'rdStep'
            set(handles.bttnStep, 'Enable', 'on');
            set(handles.bttnCont, 'Enable', 'off');
            set(handles.editCount, 'Enable', 'off');
            set(handles.editTol, 'Enable', 'off');
            updateInformationBox(hndlInformationBox, 'Step-by-step execution mode.');
            trcLogger('Step-by-step execution mode.');
            if webTraceFlag == 1
                webLog('Step-by-step execution mode.', 'event');
            end
    end
    

% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    try
        trcLogger('Saving the execution data.');
        fileName = uiputfile('*.xls', 'Save as');
        data = get(handles.resultTable, 'Data');
        xlswrite(fileName, data);
        msgbox('The execution has been successful saved.');
    catch exc
        msgbox('An error has occured while saving the data. Please try again.', 'Error', 'error');
        errLogger(exc.message);
    end


% --------------------------------------------------------------------
function webTrace_Callback(hObject, eventdata, handles)
% hObject    handle to webTrace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global webTraceFlag;
    if strcmp(get(handles.webTrace, 'Checked'), 'on')
        set(handles.webTrace, 'Checked', 'off');
        webTraceFlag = 0;
    else
        set(handles.webTrace, 'Checked', 'on');
        webTraceFlag = 1;
    end
