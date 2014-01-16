function updateInformationBox(hndl, text)
    try
        currString = get(hndl,'string');
        currString{end+1} = strcat(text);
        set(hndl,'String',currString);
        trcLogger('The information box was updated.');
        webLog('The information box was updated.', 'event');
    catch exc
        msgbox('An error has occured while updating the information box. Please try again and send a feedback to support.', 'Error', 'error');
        errLogger(exc.message);
        errLogger(exc.getReport('basic', 'hyperlinks', 'off'));
        webLog(exc.message, 'error');
        webLog(exc.getReport('basic', 'hyperliniks', 'off'), 'error');
    end
end