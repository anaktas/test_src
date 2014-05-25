function [solution, counts, start] = newtonRaphsonMethod(hndl, hndlTable, fnct, a, b, tol, maxCount)
    global webTraceFlag;
    try
        cla
        % Get the function as a string
        strfx = fnct;
        hold on
        % Plot the function
        ezplot(hndl, strfx, [a b]);
        xlim = get(gca,'xlim');  %Get x range 
        hold on
        % Plot the x'x axis
        plot([xlim(1) xlim(2)],[0 0],'k');
        t = -2:0.1:2;
        plot(hndl, t, 0, 'b-')
        drawnow
        pause(1)
        % Pickup a random starting value between the (a, b)
        %x = a + (b - a)*rand(1,1);
        x = b;
        start = x;
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
        pause(1)
        count = 0;
        while (abs(fx) > tol) && (dfx ~= 0)
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
           pause(1)
           %pause(1)           
           count = count + 1;
           oldData = get(hndlTable,'Data');
           newData = [oldData; {x, fx}];
           set(hndlTable,'Data',newData);
           if count > maxCount
              break
           end
        end
        plot(hndl, x, fx, 'bo');
        drawnow
        %plot(hndl, x, 'k*');
        %drawnow
        pause(1)
        h = msgbox(strcat('The execution has finished. The solution is:', num2str(x)), 'End of execution');
        %plot(a, fa, '-r', b, fb)
        hold off
        grid on
        % Return values
        solution = x;
        counts = count;
        %a
        %b
        %x
        %fx
        %count
        %solve(strfx)
    catch exc
        msgbox('An error has occured while executing the Newton-Raphson methode. Please try again and send a feedback to support.', 'Error', 'error');
        errLogger(exc.message);
        errLogger(exc.getReport('basic', 'hyperlinks', 'off'));
        if webTraceFlag == 1
            webLog(exc.message, 'error');
            webLog(exc.getReport('basic', 'hyperlinks', 'off'), 'error');
        end
        %errLogger(exc.stack);
    end
end