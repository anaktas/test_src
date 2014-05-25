function stepExecString(handles)
    global webTraceFlag;
    try
        % When the excecution starts, we keep a record to our log file
        trcLogger('The string method start to excecute.');
        if webTraceFlag == 1
            webLog('The string method start to excecute.', 'event');
        end
        %debug testPlot(h)
        % get the gui objects
        hndlAxes = handles.visualizationAxes;
        hndlInformationBox = handles.editInformation;
        hndlTable = handles.resultTable;
        % Fill the information box for the starting.
        updateInformationBox(hndlInformationBox,'Start String method.');
        % Initialize variables for the boltzanoMethod()
        fnct = get(handles.functionEdit, 'string');
        trcLogger(strcat('The inserted function is: ', fnct));
        %webLog(strcat('The inserted function is: ', fnct), 'event');
        a = str2num(get(handles.editA, 'string'));
        b = str2num(get(handles.editB, 'string'));
        emptyness = isempty(fnct);
        % Call function
        if (islogical(size(a) ~= 0)) && (islogical(size(b) ~= 0)) && (islogical(emptyness ~= 1))
            stepStringMethod(hndlAxes, hndlTable, fnct, a, b);
        else
            msgbox('Please fill all the neccesary fields.', 'Warning', 'warn');
        end 
    catch exc
        msgbox('An error has occured while the button press event. Please try again and send a feedback to support.', 'Error', 'error');
        errLogger(exc.message);
        errLogger(exc.getReport('basic', 'hyperlinks', 'off'));
        if webTraceFlag == 1
            webLog(exc.message, 'error');
            webLog(exc.getReport('basic', 'hyperlinks', 'off'), 'error');
        end
        %errLogger(exc.stack);
    end
end