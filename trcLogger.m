function trcLogger(text)
    txt = strcat('\n', datestr(clock), '...', text);
    %open file with write permission
    fid = fopen('log.txt', 'at');
    %write a line of text
    fprintf(fid, txt);
    %close file
    fclose(fid);
end