function stepNewtonRaphson(hndl, hndlTable, fnct, onceA, onceB)
    global x;
	global fx;
    global dfx;
    global onceFlag;
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
        % Pickup a random starting value between the (a, b)
        %x = a + (b - a)*rand(1,1);
        if onceFlag == 1
            x = onceB;
            onceFlag = 0;
        end
        %start = x;
        %temp = x;
        fx = eval(strfx);
        dfx = eval(diff(sym(strfx)));
        plot(hndl, x, fx, 'g+');
        drawnow
        %plot(hndl, x, 'g*');
        %drawnow
        %x = b;
        %fb = eval(strfx);
        %x = temp;
        %ezplot(diff(sym(strfx)));
        %drawnow
        oldx = x;
        oldfx = fx;
        %newfb = eval(strfx);
        x = x - fx/dfx;
        fx = eval(strfx);
        dfx = eval(diff(sym(strfx)));
        plot(hndl, x, fx, 'r+');
        drawnow
        %plot(hndl, x, 'b*');
        %drawnow
        line([x oldx] , [0 oldfx]);
        %ezplot(diff(sym(strfx)));
        drawnow
        %pause(1)           
        oldData = get(hndlTable,'Data');
        newData = [oldData; {x, fx}];
        set(hndlTable,'Data',newData);
        plot(hndl, x, fx, 'bo');
        drawnow
        %plot(hndl, x, 'k*');
        %drawnow
        %plot(a, fa, '-r', b, fb)
        hold off
        grid on
    catch exc
        msgbox('An error has occured while executing the Newton-Raphson method. Please try again and send a feedback to support.', 'Error', 'error');
        errLogger(exc.message);
        errLogger(exc.getReport('basic', 'hyperlinks', 'off'));
        if webTraceFlag == 1
            webLog(exc.message, 'error');
            webLog(exc.getReport('basic', 'hyperlinks', 'off'), 'error');
        end
        %errLogger(exc.stack);
    end
end