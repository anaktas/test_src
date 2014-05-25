function execBoltzano(handles)
    global webTraceFlag;
    try
        % When the excecution starts, we keep a record to our log file
        trcLogger('The boltzano method start to excecute.');
        if webTraceFlag == 1
            webLog('The boltzano method start to excecute.', 'event');
        end
        %debug testPlot(h)
        % get the gui objects
        hndlAxes = handles.visualizationAxes;
        hndlInformationBox = handles.editInformation;
        hndlTable = handles.resultTable;
        % Fill the information box for the starting.
        updateInformationBox(hndlInformationBox, 'Start Boltzano.');
        % Initialize variables for the boltzanoMethod()
        fnct = get(handles.functionEdit, 'string');
        trcLogger(strcat('The inserted function is: ', fnct));
        %webLog(strcat('The inserted function is: ', fnct), 'event');
        a = str2num(get(handles.editA, 'string'));
        b = str2num(get(handles.editB, 'string'));
        tol = str2num(get(handles.editTol, 'string'));
        mxCount = str2num(get(handles.editCount, 'string'));
        tol = 10^((-1)*tol);
        emptyness = isempty(fnct);
        % Call function
        if (islogical(size(a) ~= 0)) && (islogical(size(b) ~= 0)) && (islogical(size(tol) ~= 0)) && (islogical(size(mxCount) ~=0)) && (islogical(emptyness ~= 1))
            [solution, counts] = boltzanoMethod(hndlAxes, hndlTable, fnct, a, b, tol, mxCount);
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
        if webTraceFlag == 1
            webLog('The boltzano method ended.', 'event');
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