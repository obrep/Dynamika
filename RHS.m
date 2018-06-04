function [Ydot] = RHS(t,Y,Wiezy,rows,M, NoB, Bezwladnosci, NoS, Sprezyny, NoF, Sily)
%RHS Wektor prawych stron w r�wnaniu liniowym dynamiki

%stale stabilizacyjne do metody baumgarte - wieksze od zera 
alpha = 0;
%dla alpha = beta mamy wartosc krytyczna tlumienia, dlatego najczesciej
%wybiera sie taka konfigurcje
beta = alpha;

% Pierwsza po�owa wektora Y to po�o�enia, druga po�owa to pr�dko�ci
middle = uint16(length(Y)/2);

q = Y(1:middle,1);
qdot = Y((middle+1):(2*middle),1);

% Odpowiednie macierze s� wyznaczane przez funkcje:
% Macierz masowa -> [ M ] = MacierzMasowa( Bezwladnosci, NoB )
% Macierz Jacobiego -> [ Jacob ] = MacierzJacobiego( q, t, Wiezy, rows )
% Wektor si� uog�lnionych -> [ Q ] = SilyUogolnione( NoB, Bezwladnosci, NoS, Sprezyny, NoF, Sily, q, qdot )
% Wektor Gamma -> [ Gamma ] = WektorGamma( q, qdot, t, Wiezy, rows )
% Wektor r�wnan wi�z�w -> [ Phi ] = WektorPhi( q, t, Wiezy, rows )

F = WektorPhi(q,t,Wiezy,rows);
Fdot = MacierzJacobiego(q,t,Wiezy,rows)*qdot;

Jacob = MacierzJacobiego( q, t, Wiezy, rows );
A = [M, Jacob'; Jacob, zeros(rows)];
b = [SilyUogolnione( NoB, Bezwladnosci, NoS, Sprezyny, NoF, Sily, q, qdot );...
    WektorGamma( q, qdot, t, Wiezy, rows ) - 2*alpha*Fdot - beta*beta*F];

x = A\b;

Ydot(1:middle,1) = qdot;
Ydot((middle+1):(2*middle),1) = x(1:middle,1);

end

