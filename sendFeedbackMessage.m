function sendFeedbackMessage(message)
%SENDFEEDBACKMESSAGE Sending feedback
%   This function takes a string value as an argument and send it via 
%   post method to a web database
    global webTraceFlag;
    try
        % POST to feedback web database 
        params = {'message', message};
        urlread('http://www.zyxt.gr/eventlogger/insertSupportMessage.php', 'post', params);
        msgbox('Your feedback has been sended successful to support.');
    catch exc
        % When the connection is offline, warn the user
        msgbox('Attempt to send feedback message failed. Please, do not use tab, or new line.', 'Warning', 'warn');
        errLogger(exc.message);
        errLogger(exc.getReport('basic', 'hyperlinks', 'off'));
        if webTraceFlag == 1
            webLog(exc.message, 'error');
            webLog(exc.getReport('basic', 'hyperlinks', 'off'), 'error');
        end
    end
end