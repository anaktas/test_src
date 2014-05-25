function [solution, counts] = boltzanoMethod(hndl, hndlTable, fnct, a, b, tol, maxCount)
    global webTraceFlag;
    try
        cla
        strfx = fnct;
        hold on
        ezplot(hndl, strfx, [a b]);
        xlim = get(gca,'xlim');  %Get x range 
        hold on
        plot([xlim(1) xlim(2)],[0 0],'k');
        t = -2:0.1:2;
        plot(hndl, t, 0, 'b-')
        drawnow
        pause(1)
        x = a;
        fa = eval(strfx);
        x = b;
        fb = eval(strfx);
        x = (b+a)/2;
        fx = eval(strfx);
        plot(hndl, x, 0, 'g+');
        drawnow
        pause(1)
        count = 0;
        while abs(fx) > tol
           if fa*fx <= 0
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
           count = count + 1;
           if count > maxCount
              break
           end
        end
        plot(hndl, x, 0, 'bo');
        drawnow
        pause(1)
        msgbox(strcat('The execution has finished. The solution is:', num2str(x)), 'End of execution');
        %plot(a, fa, '-r', b, fb)
        hold off
        grid on
        solution = x;
        counts = count;
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