function syt_aufg9

    close all;
    disp('SYT Übung 4, Aufgabe 9');
    disp(' ');
       
    % Amplitude für Sprung
    a = 2;
    
    % Systemparameter aufstellen
    A = [ 0 -1; 2*sqrt(2) -1 ];
    b = [ 1; 0 ];
    c = [ 0  1 ];
    d = 0;

    % LTI-System erzeugen
    system = ss(A, b, c, d);
    
    % Sprung auf Uc durchführen
    yt = step(a*system);

    % Plotten
    figure('Name', 'SYT Übung 4, Aufgabe 9', 'NumberTitle', 'off');
    plot(yt);
    title(sprintf('Sprungantwort (Linearisiert in U_{Ruhelage}=%.2f)', a));
    xlabel('t in [s]');
    ylabel('U');
    grid on;
        
end
