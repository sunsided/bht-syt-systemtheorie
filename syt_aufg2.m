function syt_aufg2()
    clear all; home; close all;
    
    T = 0.05; % Auflösung
    t = 0:T:5; 
    
    s = 2*sin(2*pi*t-pi/2);
    
    figure('Name', 'SYT Aufgabe 2', 'NumberTitle', 'off');
    plot(t, s)
    title('s(t) = 2sin(2\pit - \pi/2)');
    xlabel('t');
    ylabel('Amplitude');
    
end