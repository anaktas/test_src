function errLogger(text)
    txt = strcat('\n', datestr(clock), '...', text);
    %open file with write permission
    fid = fopen('errlog.txt', 'at');
    %write a line of text
    fprintf(fid, txt);
    %close file
	%make achange to test the github repository
    fclose(fid);
end