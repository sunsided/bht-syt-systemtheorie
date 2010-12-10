function syt_aufg13_1

    close all;
    
    a = -3; % von 10^a
    b =  2; % bis 10^b
    N =  1000;
    
    w = logspace(a, b, N);
    
    G = (10+10*j*w)./(j*w+10*(j*w).^2);

    %betrag = abs(G); mit loglog(w, betrag)
    betrag = 20*log(abs(G));
    phase  = angle(G) * 180/pi;
    
    figure('Name', 'SYT Aufgabe 19', 'NumberTitle', 'off');
    
    a = subplot(2,1,1);
    semilogx(w, betrag, 'k', 'LineWidth', 2);
    title('Betrag');
    xlabel('\omega in Hz');
    ylabel('|G(\omega)| in dB');
    grid on;
    
    b = subplot(2,1,2);
    semilogx(w, phase, 'k', 'LineWidth', 2);
    title('Phase');
    xlabel('\omega in Hz');
    ylabel('\phi\{G(j\omega)\} in Grad');
    grid on;
    
    linkaxes([a b], 'x');
end