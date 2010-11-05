function syt_aufg8

    close all;
    disp('SYT Übung 4, Aufgabe 8');
    disp(' ');
    
    R   = 1 *1000;  % Ohm
    C   = 1 *0.001; % F
    Uc  = 5; %V
    
    % Systemparameter aufstellen
    A = -1 / (R*C);
    b =  1 / (R*C);
    c = 1;
    d = 0;

    % LTI-System erzeugen
    system = ss(A, b, c, d);
    
    % Sprung auf Uc durchführen
    yt = step(Uc * system);

    % Plotten
    figure('Name', 'SYT Übung 4, Aufgabe 8', 'NumberTitle', 'off');
    plot(yt);
    title(sprintf('Sprungantwort bei Anregung auf %.2fV', Uc));
    xlabel('t in [s]');
    ylabel('U in [V]');
    grid on;
        
end
