% Überlagerung von Cosinus-Funktionen
clear
t = linspace(-500, 500, 10000);
T = 200; % in ms
c2 = 0;
for n = 1:30
    c1 = cos(n*2*pi*t/T);
    c2 = c2 + c1;
    c = 1 + 2*c2;
    hold on
    subplot(2,1,2)
    plot(t,c)
    axis([-500 500 -25 65])
    xlabel('t / ms')
    ylabel('c(t)')
    str = ['Summe der cos-Funktionen ( T=',num2str(T),', n=', num2str(n),' )'];
    title(str)
    hold off
    subplot(2,1,1)
    plot(t,c1)
    axis([-500 500 -2 2])
    pause
end
