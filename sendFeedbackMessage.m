function sendFeedbackMessage(message)
    try
        params = {'message', message};
        urlread('http://www.zyxt.gr/eventlogger/insertSupportMessage.php', 'post', params);
        msgbox('Your feedback has been sended successful to support.');
    catch exc
        msgbox('Attempt to send feedback message failed. Please, do not use tab, or new line.', 'Warning', 'warn');
        errLogger(exc.message);
        errLogger(exc.getReport('basic', 'hyperlinks', 'off'));
        webLog(exc.message, 'error');
        webLog(exc.getReport('basic', 'hyperlinks', 'off'), 'error');
    end
end