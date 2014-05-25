function errLogger(text)
%ERRLOGGER Log erros to 'errlog.txt'
%   This function gets a string argument, which is an error message,
%   'text' and record it to a file (errlog.txt)
    txt = strcat('\n', datestr(clock), '...', text);
    %open file with write permission
    fid = fopen('errlog.txt', 'at');
    %write a line of text
    fprintf(fid, txt);
    %close file
	%make achange to test the github repository
    fclose(fid);
end