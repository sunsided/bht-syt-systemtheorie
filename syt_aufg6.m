function syt_aufg6

    close all;
    disp('SYT Übung 2, Aufgabe 6');
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
    g1 = 1/T * sigma(t) .* exp(-t/T);
    g2 = 1/T * sigma(-t) .* exp(t/T);
    g3 = 1/T * sigma(T-t) .* exp((T-t)/T);
    u = a.*(sigma(t) - sigma(t-T0));
        
    % Faltung
    tc = (-2*te):dt:(2*te);
    c = dt.*conv(u, g1);
    
    % Plots
    figure('Name', 'SYT Übung 2, Aufgabe 6', 'NumberTitle', 'off');
    subplot(3,1,1);
    plot(t, u, 'k', 'LineWidth', 2);
    axis([ta te 1.5*min(u) 1.5*max(u)]);
    legend('u(t)', 'Location', 'NorthEast');
    title('u(t)');
    ylabel('u(t)');
    xlabel('t');
    
    subplot(3,1,2);
    plot(t, g1, 'r:', 'LineWidth', 2);
    hold all;
    plot(t, g2, 'g:', 'LineWidth', 2);
    plot(t, g3, 'b:', 'LineWidth', 2);
    legend('g(t)', 'g(-t)', 'g(T-t)', 'Location', 'NorthEast');
    axis([ta te 0 2]);
    title('g(t)');
    ylabel('g(t)');
    xlabel('t');
        
    subplot(3,1,3);
    plot(tc, c, 'm', 'LineWidth', 2);
    title('\Phi(t)');
    ylabel('\Phi(t)');
    xlabel('t');
    axis([ta te 1.5*min(c) 1.5*max(c)]);
    legend('\phi(t)', 'Location', 'NorthWest');
end