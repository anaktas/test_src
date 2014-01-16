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

% Last Modified by GUIDE v2.5 20-Aug-2013 19:58:25

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


% --- Executes on button press in bttnBoltzano.
function bttnBoltzano_Callback(hObject, eventdata, handles)
% hObject    handle to bttnBoltzano (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    try
        % When the excecution starts, we keep a record to our log file
        trcLogger('The boltzano method start to excecute.');
        webLog('The boltzano method start to excecute.', 'event');
        %debug testPlot(h)
        % get the gui objects
        hndlAxes = handles.visualizationAxes;
        hndlInformationBox = handles.editInformation;
        % Fill the information box for the starting.
        updateInformationBox(hndlInformationBox, 'Start Boltzano.');
        % Initialize variables for the boltzanoMethod()
        fnct = get(handles.functionEdit, 'string');
        trcLogger(strcat('The inserted function is: ', fnct));
        webLog(strcat('The inserted function is: ', fnct), 'event');
        a = str2num(get(handles.editA, 'string'));
        b = str2num(get(handles.editB, 'string'));
        tol = str2num(get(handles.editTol, 'string'));
        mxCount = str2num(get(handles.editCount, 'string'));
        tol = 10^((-1)*tol);
        emptyness = isempty(fnct);
        % Call function
        if (islogical(size(a) ~= 0)) && (islogical(size(b) ~= 0)) && (islogical(size(tol) ~= 0)) && (islogical(size(mxCount) ~=0)) && (islogical(emptyness ~= 1))
            [solution, counts] = boltzanoMethod(hndlAxes, fnct, a, b, tol, mxCount);
        else
            msgbox('Please fill all the neccesary fields.', 'Warning', 'warn');
        end  
        % debugging-start
        %solution
        %counts
        % debugging-end
        % Fill information box for the ending.
        % Number of counts
        txtCounts = strcat('Number of counts:', num2str(counts));
        updateInformationBox(hndlInformationBox, txtCounts);
        % Solution
        txtSolution = strcat('The solution is:', num2str(solution));
        updateInformationBox(hndlInformationBox, txtSolution);
        % End
        updateInformationBox(hndlInformationBox, 'End Boltzano.');
        % When the excecution ends, we keep a record to our log file
        trcLogger('The boltzano method ended.');   
        webLog('The boltzano method start to excecute.', 'event');
    catch exc
        msgbox('An error has occured while the button press event. Please try again and send a feedback to support.', 'Error', 'error');
        errLogger(exc.message);
        errLogger(exc.getReport('basic', 'hyperlinks', 'off'));
        webLog(exc.message, 'error');
        webLog(exc.getReport('basic', 'hyperlinks', 'off'), 'error');
        %errLogger(exc.stack);
    end


% --- Executes on button press in bttnRegulaFalsi.
function bttnRegulaFalsi_Callback(hObject, eventdata, handles)
% hObject    handle to bttnRegulaFalsi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    try
        % When the excecution starts, we keep a record to our log file
        trcLogger('The regula falsi method start to excecute.');
        webLog('The regula falsi method start to excecute.', 'event');
        %debug testPlot(h)
        % get the gui objects
        hndlAxes = handles.visualizationAxes;
        hndlInformationBox = handles.editInformation;
        % Fill the information box for the starting.
        updateInformationBox(hndlInformationBox,'Start Regula Falsi.');
        % Initialize variables for the boltzanoMethod()
        fnct = get(handles.functionEdit, 'string');
        trcLogger(strcat('The inserted function is: ', fnct));
        webLog(strcat('The inserted function is: ', fnct), 'event');
        a = str2num(get(handles.editA, 'string'));
        b = str2num(get(handles.editB, 'string'));
        tol = str2num(get(handles.editTol, 'string'));
        mxCount = str2num(get(handles.editCount, 'string'));
        tol = 10^((-1)*tol);
        emptyness = isempty(fnct);
        % Call function
        if (islogical(size(a) ~= 0)) && (islogical(size(b) ~= 0)) && (islogical(size(tol) ~= 0)) && (islogical(size(mxCount) ~=0)) && (islogical(emptyness ~= 1))
            [solution, counts] = regulaFalsiMethod(hndlAxes, fnct, a, b, tol, mxCount);
        else
            msgbox('Please fill all the neccesary fields.', 'Warning', 'warn');
        end 
        % Fill information box for the ending.
        % Number of counts
        txtCounts = strcat('Number of counts:', num2str(counts));
        updateInformationBox(hndlInformationBox, txtCounts);
        % Solution
        txtSolution = strcat('The solution is:', num2str(solution));
        updateInformationBox(hndlInformationBox, txtSolution);
        % End
        updateInformationBox(hndlInformationBox, 'End Regula Falsi.');
        % When the excecution ends, we keep a record to our log file
        trcLogger('The regula falsi method ended.');
        webLog('The regula falsi method ended.', 'event');
    catch exc
        msgbox('An error has occured while the button press event. Please try again and send a feedback to support.', 'Error', 'error');
        errLogger(exc.message);
        errLogger(exc.getReport('basic', 'hyperlinks', 'off'));
        webLog(exc.message, 'error');
        webLog(exc.getReport('basic', 'hyperlinks', 'off'), 'error');
        %errLogger(exc.stack);
    end


% --- Executes on button press in bttnNewtonRaphson.
function bttnNewtonRaphson_Callback(hObject, eventdata, handles)
% hObject    handle to bttnNewtonRaphson (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    try
        % When the excecution starts, we keep a record to our log file
        trcLogger('The Newton-Raphson method start to excecute.');
        webLog('The Newton-Raphson method start to excecute.', 'event');
        %debug testPlot(h)
        % get the gui objects
        hndlAxes = handles.visualizationAxes;
        hndlInformationBox = handles.editInformation;
        % Fill the information box for the starting.
        updateInformationBox(hndlInformationBox, 'Start Newton-Raphson.');
        % Initialize variables for the boltzanoMethod()
        fnct = get(handles.functionEdit, 'string');
        trcLogger(strcat('The inserted function is: ', fnct));
        webLog(strcat('The inserted function is: ', fnct), 'event');
        a = str2num(get(handles.editA, 'string'));
        b = str2num(get(handles.editB, 'string'));
        tol = str2num(get(handles.editTol, 'string'));
        mxCount = str2num(get(handles.editCount, 'string'));
        tol = 10^((-1)*tol);
        emptyness = isempty(fnct);
        % Call function
        if (islogical(size(a) ~= 0)) && (islogical(size(b) ~= 0)) && (islogical(size(tol) ~= 0)) && (islogical(size(mxCount) ~=0)) && (islogical(emptyness ~= 1))
            [solution, counts, start] = newtonRaphsonMethod(hndlAxes, fnct, a, b, tol, mxCount);
        else
            msgbox('Please fill all the neccesary fields.', 'Warning', 'warn');
        end 
        % Fill information box for the ending.
        % Starting value
        txtCounts = strcat('Starting value:', num2str(start));
        updateInformationBox(hndlInformationBox, txtCounts);
        % Number of counts
        txtCounts = strcat('Number of counts:', num2str(counts));
        updateInformationBox(hndlInformationBox, txtCounts);
        % Solution
        txtSolution = strcat('The solution is:', num2str(solution));
        updateInformationBox(hndlInformationBox, txtSolution);
        % End
        updateInformationBox(hndlInformationBox, 'End Newton-Raphson.');
        % When the excecution ends, we keep a record to our log file
        trcLogger('The Newton-Raphson method ended.'); 
        webLog('The Newton-Raphson method ended.', 'event');
    catch exc
        msgbox('An error has occured while the button press event. Please try again and send a feedback to support.', 'Error', 'error');
        errLogger(exc.message);
        errLogger(exc.getReport('basic', 'hyperlinks', 'off'));
        webLog(exc.message, 'error');
        webLog(exc.getReport('basic', 'hyperlinks', 'off'), 'error');
        %errLogger(exc.stack);
    end



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
    webLog('The application was started.', 'event');


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    trcLogger('The application was ended.');
    webLog('The application was ended.', 'event');

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
    try
        set(handles.editInformation,'String','');
        trcLogger('The information box has been cleaned.');
        webLog('The information box has been cleaned.', 'event');
    catch exc
        msgbox('An error has occured while cleaning the information box. Please try again.', 'Error', 'error');
        errLogger(exc.message);
        webLog(exc.message, 'error');
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
