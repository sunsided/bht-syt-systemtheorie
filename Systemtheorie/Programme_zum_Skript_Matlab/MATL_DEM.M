% File "matl_dem.m"
%
% Berechnung der Nullstellen, der Extrema und der Graphen
% von y=f(x) und der Ableitung y'=f'(x) % eines Polynoms 5.Ornung:
%
% 	y=x^5-3x^4-39x^3+47x^2+210x
%

home									% Säuberung des Command Windows.
clear


x=-5.2:0.1:7.2;			      	% Betrachteter Abszissenbereich.
y_koeff=[1,-3,-39,47,210,0];	% Polynomkoeffizienten.
	
y=polyval(y_koeff,x);	  			% Berechnung des Grapehen von y=f(x).
subplot(2,1,1)			  				% Graph von y(x) in die obere
plot(x,y), grid			   		% Bildhälfte.
title('Graph von y=f(x)')
Nullstellen=roots(y_koeff)		% Berechnung und numerische
				                		% Ausgabe der Nullstellen von f(x).

dy_dx_koeff=polyder(y_koeff);	% Berechnung  der Koeffizeinten von f'(x).
dy_dx=polyval(dy_dx_koeff,x);	% Berechnung von des Graphen von f'(x).
subplot(2,1,2)			        		% Graph von f'(x) in die untere
plot(x,dy_dx), grid		   			% Bildhälfte.
title('Graph der Ableitung von y=f(x)')
Extrema=roots(dy_dx_koeff)	   	% Berechnung und numerische
				                			% Ausgabe der Nullstellen von f'(x),
				                			% (= Extrema von f(x)).
