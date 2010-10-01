%	File "demo sruct_cell"
%
% Programm zur Demonstration der Funktionsweise von
%	- Strukturen (strutures) und
%	- Cell Arrays

clear, home, close all
% Leeren des Matlab-Speichers, MCW säubern und schließen
% aller geöffneten Grafik-Fenster


%echo on
% 1. STRUKTUREN

% Erzeugung der Struktur "Patient" mit dem Befehl "struct".
Patient=struct('Name','Paul Schmidt','Rechnungsbetrag'...
,123.20,'Untersuchungen',[1,4;15,8]);

% Erweiterung der Struktur Patient um einen weiteren 
% Patienten.
% (Patient ist dann identisch mit Patient(1)).
Patient(2)=struct('Name','Franz Gans','Rechnungsbetrag'...
,1200.00,'Untersuchungen',[4,10]);

% Inhalte (Feldnamen)der Struktur Patient
Patient


% Beispielzugriff auf die Feldelemente des Patienten(1)zur 
% Anzeige des Inhalts
Patientenname1=Patient(1).Name
Zahlbetrag=Patient(1).Rechnungsbetrag
Untersuchungen=Patient(1).Untersuchungen

% Erzeugung einer Struktur "Datum"
Datum_Pat2=struct('Tag',10,'Monat',09,'Jahr',98);


% Einfügung der Struktur "Datum_Pat2" als Unterstruktur
% (Strukturschachtelung)in die Struktur von"Patient(2)".
% (Möglichkeit 2 zur Erzeugung von Strukturen
% durch Zuweisungsanweisungen).
Patient(2).Untersuchungsdatum=Datum_Pat2;

% Anzeige der erweiterten Struktur "Patient"
Patient

% Zugriff auf die Unterstruktur "Untersuchungdatum" von 
% Patient(2).
Letzte_Untersuchung=Patient(2).Untersuchungsdatum

% Zugriff auf die Unterstruktur "Untersuchungdatum" von 
% Patient(1),die leer sein muß, weil ihr kein Wert 
% zugewiesen wurde.
Letzte_Untersuchung=Patient(1).Untersuchungsdatum


% 2. CELL-ARRAYS

% Erzeugung eines Cell-Arrays "Arztpraxis" mit 4 Zellen 
% mit dem Befehl "cell".
Arztpraxis=cell(2,2);

% Besetzung der Zellen
Arztpraxis{1,1}='Dr. Pille';			% Praxisbesitzer.
Arztpraxis{2,1}=[1,3,2,5];				% Geraeteindex.
Arztpraxis{2,2}=Patient;				% die oben erzeugte 
														% Patientenstruktur.
% Die Zelle Arztpraxis{1,2} wurde leer gelassen.

% Anzeige des Inhalts des Cell-Arrays "Arzrpraxis"
Arztpraxis

% Zugriff auf die nicht lesbaren Inhalte
Geraeteindex=Arztpraxis{2,1}
Patientendatei=Arztpraxis{2,2}

%echo off