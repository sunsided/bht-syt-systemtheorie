function syt_aufg4

    close all;
    disp('SYT Übung 2, Aufgabe 4');
    disp(' ');
    
    % Zeitbereiche
    ta = -10;
    te = 10;

    % Zeitreihe
    dt = 0.001;
    t = ta:dt:te;

    % a
    sa = sigma(t).*exp(-t);
    Ea = dt*sum(sa.*sa);
    disp(['Energie a)   ' num2str(Ea)]);
    
    % b
    T = 2;
    sb = sigma(t-T);
    
    % c
    sc = t.*sigma(t-T);
    
    % d
    sd = (t-T).*sigma(t-T);    
    
    % e
    se = (sigma(t-pi/2) - sigma(t-3*pi/2)) .* cos(t);
    Ee = dt*sum(se.*se);
    disp(['Energie e)   ' num2str(Ee)]);
    
    % f
    sf = sigma(-t);
    
    % g
    sg = sigma(1-t.*t);
    Eg = dt*sum(sg.*sg);
    disp(['Energie g)   ' num2str(Eg)]);    
    
    % Plots
    figure('Name', 'SYT Übung 2, Aufgabe 4', 'NumberTitle', 'off');
    plot(t, sa, 'b', 'LineWidth', 2);
    hold on;
    plot(t, sb, 'r', 'LineWidth', 2);
    plot(t, sc, 'g', 'LineWidth', 2);
    plot(t, sd, 'c', 'LineWidth', 2);
    plot(t, se, 'm', 'LineWidth', 2);
    plot(t, sf, 'g:', 'LineWidth', 2);
    plot(t, sg, 'r:', 'LineWidth', 2);
    grid on;    
    axis([ta te -1.5 5]);
    ylabel('s(t)');
    xlabel('t');
    legend('\sigma(t)*e^{-t}', '\sigma(t-T)', 't*\sigma(t-T)', '(t-T)*\sigma(t-T)', '(\sigma(t-\pi/2)-\sigma(t-3\pi/2))cos(t)', '\sigma(-t)', '\sigma(1-t^2)', 'Location', 'NorthWest');
    
end