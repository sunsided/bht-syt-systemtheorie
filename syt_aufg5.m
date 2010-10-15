function syt_aufg5

    close all;
    disp('SYT Übung 2, Aufgabe 5');
    disp(' ');
    
    % Zeitbereiche
    te = 10;
    ta = -te;

    % Zeitreihe
    dt = 0.001;
    t = ta:dt:te;
    
    % Signale
    s1 = sigma(t-1) - sigma(t-3);
    s2 = sigma(t-2) - 2*sigma(t-3) + sigma(t-4);
    
    % Faltung
    tc = 2*ta:dt:2*te;
    c = dt.*conv(fliplr(s1), s2);
    
    % Maximum
    %{
    [max_ maxx] = max(c);
    [min_ minx] = min(c);
    disp(['Maximalwert bei Stelle t=' num2str(maxx)]);
    disp(['Minimalwert bei Stelle t=' num2str(minx)]);
    %}
    
    % Plots
    figure('Name', 'SYT Übung 2, Aufgabe 5', 'NumberTitle', 'off');
    subplot(2,1,1);
    plot(t, s1, 'b', 'LineWidth', 2);
    hold on;
    plot(t, s2, 'r:', 'LineWidth', 2);
    title('s_{1,2}(t)');
    axis([ta te -1.5 1.5]);
    ylabel('s_{1,2}(t)');
    xlabel('t');
    legend('s_1(t)', 's_2(t)', 'Location', 'NorthWest');
    
    subplot(2,1,2);
    plot(tc, c, 'k', 'LineWidth', 2);
    title('\phi_{1,2}(t)');
    ylabel('\phi_{1,2}(t)');
    xlabel('t');
    axis([ta te 1.5*min(c) 1.5*max(c)]);
    legend('\phi_{12}(t)', 'Location', 'NorthWest');
    
end