clear
close all

% Wczytanie wiêzów opisuj¹cych mechanizm
input_wiezy;
input_wymiary;


% Inicjalizacja zmiennej do wyznaczania liczby równañ wiêzów 
rows = 0;
for l=1:length(Wiezy)
    if(lower(Wiezy(l).typ(1)) == 'd')
        if(lower(Wiezy(l).klasa(1)) == 'o')
            rows = rows + 1;
        elseif(lower(Wiezy(l).klasa(1)) == 'p')
            rows = rows + 1;
        
        else
            error(['Blednie podana klasa dla wiezu nr ', num2str(l)]);
        end
    elseif(lower(Wiezy(l).typ(1)) == 'k')
        if(lower(Wiezy(l).klasa(1)) == 'o')
            rows = rows + 2;
        elseif(lower(Wiezy(l).klasa(1)) == 'p')
            rows = rows + 2;
        else
            error(['Blednie podana klasa dla wiezu nr ', num2str(l)]);
        end
    else
        error(['Blednie podany typ dla wiezu nr ', num2str(l)]);
    end
end




M = MacierzMasowa(Bezwladnosci, NoB);

qdot0 = zeros(size(q0)); % Pocz¹tkowe prêdkoœci

%aby skorzystac z ode45 musimy zamienic uklad rownan rozniczkowych drugiego
%stopnia na pierwszego stopnia, w tym celu wrzucamy do Y warunki poczatkowe
%i predkosc

Y0 = [q0; qdot0]; % Wektor, który bêdzie ca³kowany


%% Ca³kowanie przy pomocy metody Rungego-Kutty rzêdu 4-5 %%
% Paramtery czasu ca³kowania
czas = 5;
krok = 0.005; 
timespan = 0:krok:czas;

OPTIONS = odeset('RelTol', 1e-6, 'AbsTol', 1e-9, 'OutputFcn', @odeplot,'OutputSel',[28 28]); 
% Ustawienie opcji ca³kowania - tolerancje i output po ka¿dym kroku
% rysowanie jednej ze zmiennych w celu szybkiego ocenienia postepu
% (polozenie 10 srodka masy)

[T,Y]=ode45(@(t,Y) RHS(t,Y,Wiezy,rows,M, NoB, Bezwladnosci, NoS, Sprezyny, NoF, Sily),timespan,Y0,OPTIONS);
    
    % Poniewa¿ macierz bezw³adnoœci nie zmienia siê w czasie, wiêc aby nie
    % obliczaæ jej za ka¿dym razem od nowa, jest po prostu przekazywana
    % jako argument funkcji ca³kowanej
%%
Y = Y';    
    
timepoints = 1:( length(T) );
Ydot = zeros(size(Y));


for iter=timepoints
	Ydot(:,iter) = RHS( T(iter), Y(:,iter), Wiezy,rows,M, NoB, Bezwladnosci, NoS, Sprezyny, NoF, Sily );
end

%Wektor po³o¿eñ:
Q = [ Y( 1:3*NoB , : )];
%Wektor predkosci
DQ = [ Y( 3*NoB+1:6*NoB , : )];
%Wektor przyspieszen
D2Q = [ Ydot( 3*NoB+1:6*NoB , : )];

%zebranie wszystkiego do struktury - prostsze funkcje rysujace wykresy
Dane = {T, Q, DQ, D2Q};
 