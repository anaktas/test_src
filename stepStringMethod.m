function stepStringMethod(hndl, hndlTable, fnct, onceA, onceB)
    global x;
	global fx;
	global fa;
	global fb;
	global onceFlag;
	global a;
	global b;
    global webTraceFlag;
    try
        cla
        % Get the function as a string
        strfx = fnct;
        hold on
        % Plot the function
        ezplot(hndl, strfx, [onceA onceB]);
        xlim = get(gca,'xlim');  %Get x range 
        hold on
        % Plot the x'x axis
        plot([xlim(1) xlim(2)],[0 0],'k');
        t = -2:0.1:2;
        plot(hndl, t, 0, 'b-')
        drawnow
        if onceFlag == 1
            % Assing the value a to the function via the eval function
            x = a;
            fa = eval(strfx);
            % Assing the value a to the function via the eval function
            x = b;
            fb = eval(strfx);
            % Calculating the x variable and assign it to the function via eval
            % function
            x = b - ((b - a)/(fb - fa))*fb;
            fx = eval(strfx);
            % Plot the first value
            plot(hndl, x, fx, 'g+');
            drawnow
            % Plot the first string
            line([a b] , [fa fb]);
            drawnow
            onceFlag = 0;
        end
        if fa*fx <= 0
            b = x;
            x = b - ((b - a)/(fb - fa))*fb;
            fx = eval(strfx);
            %plot(x,fx, '-g', x,fx);
            plot(hndl, x, fx, 'r+');
            drawnow
            line([a x], [fa fx]);
            drawnow
            b = x;
            fb = fx;
            %x
            %fx
        end
        if fx*fb <= 0
            a = x;
            x = b - ((b - a)/(fb - fa))*fb;
            fx = eval(strfx);
            plot(hndl, x, fx, 'r+');
            drawnow
            line([x b], [fx fb]);
            drawnow
            a = x;
            fa = fx;
            %x
            %fx
        end
        oldData = get(hndlTable,'Data');
        newData = [oldData; {x, fx}];
        set(hndlTable,'Data',newData);
        %plot(hndl, x, fx, 'bo');
        %drawnow
        h = msgbox(strcat('The execution has finished. The solution is:', num2str(x)), 'End of execution');
        %plot(a, fa, '-r', b, fb)
        hold off
        grid on
    catch exc
        msgbox('An error has occured while executing the Regula-Falsi method. Please try again and send a feddback to support.', 'Error', 'error');
        errLogger(exc.message);
        errLogger(exc.getReport('basic', 'hyperlinks', 'off'));
        if webTraceFlag == 1
            webLog(exc.message, 'error');
            webLog(exc.getReport('basic', 'hyperlinks', 'off'), 'error');
        end
        %errLogger(exc.stack);
    end
end