function trcLogger(text)
%TRCLOGGER Log events to 'log.txt'
%   This function gets a string argument 'text', which is an event event message,
%   and record it to a file (log.txt)
    txt = strcat('\n', datestr(clock), '...', text);
    %open file with write permission
    fid = fopen('log.txt', 'at');
    %write a line of text
    fprintf(fid, txt);
    %close file
    fclose(fid);
end