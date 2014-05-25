function execNewtonRaphson(handles)
    global webTraceFlag;
    try
        % When the excecution starts, we keep a record to our log file
        trcLogger('The Newton-Raphson method start to excecute.');
        if webTraceFlag == 1
            webLog('The Newton-Raphson method start to excecute.', 'event');
        end
        %debug testPlot(h)
        % get the gui objects
        hndlAxes = handles.visualizationAxes;
        hndlInformationBox = handles.editInformation;
        hndlTable = handles.resultTable;
        % Fill the information box for the starting.
        updateInformationBox(hndlInformationBox, 'Start Newton-Raphson.');
        % Initialize variables for the boltzanoMethod()
        fnct = get(handles.functionEdit, 'string');
        trcLogger(strcat('The inserted function is: ', fnct));
        if webTraceFlag == 1
            webLog(strcat('The inserted function is: ', fnct), 'event');
        end
        a = str2num(get(handles.editA, 'string'));
        b = str2num(get(handles.editB, 'string'));
        tol = str2num(get(handles.editTol, 'string'));
        mxCount = str2num(get(handles.editCount, 'string'));
        tol = 10^((-1)*tol);
        emptyness = isempty(fnct);
        % Call function
        if (islogical(size(a) ~= 0)) && (islogical(size(b) ~= 0)) && (islogical(size(tol) ~= 0)) && (islogical(size(mxCount) ~=0)) && (islogical(emptyness ~= 1))
            [solution, counts, start] = newtonRaphsonMethod(hndlAxes, hndlTable, fnct, a, b, tol, mxCount);
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
        if webTraceFlag == 1
            webLog('The Newton-Raphson method ended.', 'event');
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