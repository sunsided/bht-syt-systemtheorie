function syt_aufg1()
    clear all; home; close all;
    
    % Vektor erzeugen und flippen
    a = 1:5
    b = fliplr(a)
    
    % 100er-Nullvektor (Zeilen) erzeugen
    c = zeros(1, 100);

    % Vektoren zusammenfügen
    d = [a b c];
    
    % Länge ausgeben
    disp(['Länge des Vektors d vor Löschen:  ' num2str(length(d))]);
    
    % Letzten 50 Elemente löschen
    d = d(1:length(d)-50);
    %d(length(d)-50+1:length(d)) = []; %Alternativ: Löschen
    disp(['Länge des Vektors d nach Löschen: ' num2str(length(d))]);
    
end