function updateInformationBox(hndl, text)
%UPDATEINFORMATIONBOX Updates the information box
%   This function gets two arguments, 'hndl' and 'text', where the 'hndl'
%   is the handle attribute of the 'editInformation' textbox and the 'text' is
%   the text that will be append to the 'editInformation' textbox
    global webTraceFlag;
    try
        % get the current string from the editIndormation textbox
        currString = get(hndl,'string'); 
        % append the 'text' in a new line of the 'currentString'
        currString{end+1} = strcat(text);
        % set the 'currentString' in the the String of the editInformation
        % textbox
        set(hndl,'String',currString);
        % Log to 'log.txt' and webLog
        trcLogger('The information box was updated.');
        if webTraceFlag == 1
            webLog('The information box was updated.', 'event');
        end
    catch exc
        % User error message
        msgbox('An error has occured while updating the information box. Please try again and send a feedback to support.', 'Error', 'error');
        % Log to 'errlog.txt' and webLog
        errLogger(exc.message);
        errLogger(exc.getReport('basic', 'hyperlinks', 'off'));
        if webTraceFlag == 1
            webLog(exc.message, 'error');
            webLog(exc.getReport('basic', 'hyperliniks', 'off'), 'error');
        end
    end
end