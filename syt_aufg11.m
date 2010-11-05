function syt_aufg11

    close all;
    disp('SYT Übung 3, Aufgabe 11');
    disp(' ');
    figure('Name', 'SYT Übung 4, Aufgabe 11', 'NumberTitle', 'off');
    
    % Zeitvektor
    te = 100;
    dt = 1/te;
    t = 0:dt:te;
    
    % Frequenzachse
    fmax = 1/(2*dt);
    df = 1/te;
    f = -fmax:df:fmax;

    % Frequenzachse für Alternative 2 und 3
    fmax23 = 1/(2*dt);
    df23 = 1/(2*te);
    f23 = -fmax23:df23:fmax23;    
    
    % Zeitsignal erzeugen
    u = 3*(sigma(t) - sigma(t-2));    
       
%% 1. Alternative: Spektrum vom u(t) quadrieren
    U1a = fftshift(dt * fft(u));
    
    U1a = U1a.*exp(-j*f*2*pi*0.5*dt); % Fehler von Matlab kompensieren (Rechteckimpuls beginnt bei -0.5 und führt zu Drift)
    
    U1 = abs(U1a);
    Y1 = U1.*U1; % Quadrieren
    subplot(4,2,1);
    plot(f, Y1);
    xlim([-4.5 4.5]);
    title('Alternative 1: Quadriertes Spektrum');
    
    [m idx] = max(Y1);
    hold on; h = plot(get(gca,'xlim'),[m m], 'k:'); set(h, 'Color', [0.8 0.8 0.8]);
    text(f(idx), m, sprintf('\\leftarrow %.2f', m));
  
    % Phasen
    subplot(4,2,2);
    plot(f, angle(U1a));
    xlim([-4.5 4.5]);
    grid on;
    
%% 2. Alternative: y = conv(fliplr(u), u)
    phi2 = conv(u, u);
    Y2a = fftshift(dt^2 * fft(phi2));
    Y2 = abs(Y2a); % Dann Spektrum ermitteln  
    subplot(4,2,3);
    plot(f23, Y2);
    xlim([-4.5 4.5]);
    title('Alternative 2: conv()');
    
    [m idx] = max(Y2);
    hold on; h = plot(get(gca,'xlim'),[m m], 'k:'); set(h, 'Color', [0.8 0.8 0.8]);
    text(f23(idx), m, sprintf('\\leftarrow %.2f', m));
    
    % Phasen
    subplot(4,2,4);
    plot(f23, angle(Y2a));
    xlim([-4.5 4.5]);
    grid on;
    
%% 3. Alternative: Eingabe von y(t) mittels sigma(t) (analog A12)
    a = 3;
    T = 2;
    y3 = a^2*t .* sigma(t) - sigma(t-T)*2*a^2.*(t-T) + sigma(t-2*T)*a^2.*(t-2*T);
    
    subplot(4,2,5:6);
    plot(t, y3);
    xlim([0 10]);
    
    [m idx] = max(y3);
    hold on; h = plot(get(gca,'xlim'),[m m], 'k:'); set(h, 'Color', [0.8 0.8 0.8]);
    text(t(idx), m, sprintf('\\leftarrow %.2f', m));
        
    % 3. Alternative: Spektrum berechnen
    Y3f = fftshift(dt*fft(y3));
    Y3 = abs(Y3f); % Dann Spektrum berechnen
    
    subplot(4,2,7);
    plot(f, Y3);
    xlim([-4.5 4.5]);
    title('Alternative 3: Komposition mittels Sigma');
    
    [m idx] = max(Y3);
    hold on; h = plot(get(gca,'xlim'),[m m], 'k:'); set(h, 'Color', [0.8 0.8 0.8]);
    text(f(idx), m, sprintf('\\leftarrow %.2f', m));
    
    % Phasen
    subplot(4,2,8);
    plot(f, angle(Y3f));
    xlim([-4.5 4.5]);
    grid on;
    
end