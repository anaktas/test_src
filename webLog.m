function webLog(message, status)
% Dummy comment to see the changes.
    try
        TF = strcmpi(status, 'event');
        if TF
            color = '#00FF00';
        else
            color = '#FF0000';
        end
        params = {'message', message, 'status', status, 'color', color};
        urlread('http://www.zyxt.gr/eventlogger/insert.php', 'post', params);
    catch exc
        msgbox('Attempt to web trace failed.', 'Warning', 'warn');
        errLogger(exc.message);
    end
	% Second comment to see the changes.
end