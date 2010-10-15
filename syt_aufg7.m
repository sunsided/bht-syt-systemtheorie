function syt_aufg7

    close all;
    disp('SYT Übung 2, Aufgabe 7');
    disp(' ');
    
    % Zeitbereiche
    te = 10;
    ta = -te;

    % Zeitreihe
    dt = 0.01;
    t = ta:dt:te;
    
    % Faktoren
    a = 5;
    T0 = 4;
    T = 2;
    
    % System und Signal
    u1 = a.*(sigma(t) - sigma(t-T0));
    u2 = a.*(sigma(t-2) - sigma(t-2-T0));
        
    % Faltung
    tc = (-2*te):dt:(2*te);
    c = dt.*conv(u1, u2);
    
    % Maximalwert
    maxwert = a^2*T0;
    disp(['Maximalwert:     ' num2str(maxwert)]);
    
    % Plots
    figure('Name', 'SYT Übung 2, Aufgabe 7', 'NumberTitle', 'off');
    subplot(2,1,1);
    plot(t, u1, 'b', 'LineWidth', 2);
    hold all;
    plot(t, u2, 'r:', 'LineWidth', 2);
    axis([ta te 1.5*min(u1) 1.5*max(u1)]);
    legend('u(t)', 'u(t-2)', 'Location', 'NorthWest');
    title('u(t)');
    ylabel('u(t-T)');
    xlabel('t');
    
    subplot(2,1,2);
    plot(tc, c, 'k', 'LineWidth', 2);
    legend('\Phi(t)', 'Location', 'NorthWest');
    title('g(t)');
    ylabel('g(t)');
    xlabel('t');
    
end