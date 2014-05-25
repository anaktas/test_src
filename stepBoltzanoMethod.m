function stepBoltzanoMethod(hndl, hndlTable, fnct, onceA, onceB)
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
        strfx = fnct;
        hold on
        ezplot(hndl, strfx, [onceA onceB]);
        xlim = get(gca,'xlim');  %Get x range 
        %hold on
        plot([xlim(1) xlim(2)],[0 0],'k');
        t = -2:0.1:2;
        plot(hndl, t, 0, 'b-')
        drawnow
        % Initialization
		if onceFlag == 1
			a = onceA;
			b = onceB;
			x = a;
			fa = eval(strfx);
			x = b;
			fb = eval(strfx);
			x = (b+a)/2;
			fx = eval(strfx);
            onceFlag = 0;
		end
        %plot(hndl, x, 0, 'g+');
        drawnow
        if fa*fx < 0
            b = x;
            x = (b+a)/2;
            fx = eval(strfx);
            %plot(x,fx, '-g', x,fx);
            plot(hndl, x, 0, 'r+');
            drawnow
            pause(1)
            b = x;
            fb = fx;
            %x
            %fx
        end
        if fx*fb < 0
            a = x;
            x = (b+a)/2;
            fx = eval(strfx);
            plot(hndl, x, 0, 'r+');
            drawnow
            pause(1)
            a = x;
            fa = fx;
            %x
            %fx
        end
        oldData = get(hndlTable,'Data');
        newData = [oldData; {x, fx}];
        set(hndlTable,'Data',newData);
        %plot(hndl, x, 0, 'bo');
        drawnow
        %plot(a, fa, '-r', b, fb)
        hold off
        %grid on
        %a
        %b
        %x
        %fx
        %count
        %solve(strfx)
    catch exc
        msgbox('An error has occured while executing the Boltzano method. Please try again and send a feedback.', 'Error', 'error');
        errLogger(exc.message);
        errLogger(exc.getReport('basic', 'hyperlinks', 'off'));
        if webTraceFlag == 1
            webLog(exc.message, 'error');
            webLog(exc.getReport('basic', 'hyperlinks', 'off'), 'error');
        end
        %errLogger(exc.stack);
    end
end