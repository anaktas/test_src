function webLog(message, status)
%WEBLOG Logging into web database
%   This function takes two string arguments, message and status, which
%   would be sended to a web database.
    try
        % When the status is an event the color is green,
        % otherwise the color is red
        TF = strcmpi(status, 'event');
        if TF
            color = '#00FF00';
        else
            color = '#FF0000';
        end
        % POST for logging to web database
        params = {'message', message, 'status', status, 'color', color};
        urlread('http://www.zyxt.gr/eventlogger/insert.php', 'post', params);
    catch exc
        % When the internet connection is off show a warning message to the
        % user
        msgbox('Attempt to web trace failed.', 'Warning', 'warn');
        errLogger(exc.message);
    end
	% Second comment to see the changes.
end