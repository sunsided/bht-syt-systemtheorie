% Programm "uebtf.m"
% Erzeugung und Nutzung eines ‹bertragungsfunktions-Objekts

clear, home, close all

% Polynome der ‹bertragungsfunktion
zaehler=[4,2,1];
nenner=[3,10,100];

% Bildung des LTI-Objekt: ‹bertragungfunktions-Objekt "uetf"
uetf=tf(zaehler, nenner);

% Anschauliche Ausgabe des ‹bertragungsfunktionsobjekts
% auf dem MCW
%
uetf

% Zugriff auf das Z‰hler- und Nennerpolynom im 
% ‹bertragungsfunktionsobjekt
%
[z, n]=tfdata(uetf)
% z und n sind Cell-Arrays (siehe MCW). Um aus diesen 
% die Z‰hler- und Nenner-Polynome zu extrahieren, muﬂ
% mit geschweiften Klammern indiziert werden. (Laut MCW
% handelt es sich um je eine Zelle)
%
zaehler_uetf=z{1,1}
nenner_uetf=n{1,1}
