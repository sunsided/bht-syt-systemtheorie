function syt_aufg10

    close all;
    disp('SYT Übung 3, Aufgabe 10');
    disp(' ');
    figure('Name', 'SYT Übung 3, Aufgabe 10', 'NumberTitle', 'off');
    
    % Zeitvektor
    te = 50;
    dt = 1/te;
    t = 0:dt:te;
    
    % Zeitsignal erzeugen
    u = 3*(sigma(t) - sigma(t-2));
    
    % Zeitsignal plotten
    subplot(3,1,1);
    plot(t, u);
    title('u=3\sigma(t)-\sigma(t-2)');
    xlabel('Zeit');
    xlim([-0 10]);
    
    % Fouriertransformation auf u anwenden
    U = dt * fft(u);
    
    % Spektrum verschieben
    U = fftshift(U);
    
    % Frequenzvektor erstellen
    fmax = 1/(2*dt);
    df = 1/te;
    f = -fmax:df:fmax;
    
    % Kompensation
    Ukomp = U.*exp(-j*f*2*pi*0.5*dt);
    
    % Betrag plotten
    subplot(3,1,2);
    plot(f, abs(U));
    title('Betrag von u=3\sigma(t)-\sigma(t-2)');
    xlabel('Frequenz');
    xlim([-4.5 4.5]);
    
    % Phasen plotten
    subplot(3,1,3);
    plot(f, angle(U));
    hold on;
    plot(f, angle(Ukomp), 'r');
    legend('MATLAB-Fehler', 'kompensiert');
    grid on;
    title('Phase von u=3\sigma(t)-\sigma(t-2)');
    xlabel('Frequenz');
    xlim([-4.5 4.5]);
    
end