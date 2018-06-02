clear all
close all
% Utworzenie pustej struktury do przechowywania wiêzów w postaci ogónej
Wiezy = struct('typ',{},... % dopisanych czy kinematyczny
    'klasa',{},... % para postepowa czy obrotowa (innych na razie nie ma)
    'bodyi',{},... % numer pierwszego ciala
    'bodyj',{},... % numer drugiego ciala
    'sA',{},... % wektor sA w i-tym ukladzie
    'sB',{},... % wektor sB w j-tym ukladzie
    'phi0',{},... % kat phi0 (jezeli para obrotowa - nie uzywamy)
    'perp',{},... % wersor prostopadly osi ruch (jezeli para obrotowa - nie uzywamy)
    'fodt',{},... % funkcja od czasu dla wiezow dopisanych
    'dotfodt',{},... % pochodna funkcji od czasu dla wiezow dopisanych
    'ddotfodt',{}); % druga pochodna funkcji od czasu dla wiezow dopisanych

Bezwladnosci = struct('m',{},... % masa cz³onu (m)
    'Iz',{}); % moment bezw³adnoœci cz³onu wzglêdem osi z (I_z)

Sprezyny = struct('k',{},... % sztywnosc sprezyny
    'c',{},... % tlumienie w sprezynie
    'bodyi',{},... % numer pierwszego ciala przylozenia sprezyny
    'bodyj',{},... % numer drugiego ciala przylozenia sprezyny
    'sA',{},... % punkt przylozenia sprezyny do ciala i w i-tym ukladzie lokalnym
    'sB',{},... % punkt przylozenia sprezyny do ciala j w j-tym ukladzie lokalnym
    'd0',{}); % dlugosc swobodna sprezyny

Sily = struct('F',{},... % wektor przylozonej sily
    'bodyi',{},... % numer ciala, do ktorego przylozono sile
    'sA',{}); % punkt przylozenia sily do ciala i w i-tym ukladzie lokalnym

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

%% PAUSE

%% Ca³kowanie przy pomocy metody Rungego-Kutty rzêdu 4-5

czas = 1;
krok = 0.005; % Paramtery czasu ca³kowania
timespan = 0:krok:czas;

M = MacierzMasowa(Bezwladnosci, NoB);

q0 = [0.7; -0.2; 0;
    0; 0.2; 0;
    0.2; 0.3; 0;
    1.55; -0.35; 0;
    0.9; 0.2; 0;
    0.2; -0.35; 0;
    0.6; -0.25; 0;
    0.15; -0.45; 0;
    0.25; 0.05; 0;
    0.7; 0; 0]; % Pocz¹tkowe po³o¿enia

qdot0 = zeros(size(q0)); % Pocz¹tkowe prêdkoœci

%aby skorzystac z ode45 musimy zamienic uklad rownan rozniczkowych drugiego
%stopnia na pierwszego stopnia, w tym celu wrzucamy do Y warunki poczatkowe
%i predkosc
Y0 = [q0; qdot0]; % Wektor, który bêdzie ca³kowany

%% PAUSE

temp = 1;
steps = czas/krok;

OPTIONS = odeset('RelTol', 1e-6, 'AbsTol', 1e-9, 'OutputFcn', @odeplot,'OutputSel',[1 1]); 
% rysowanie jednej ze zmiennych w celu szybkiego ocenienia postepu
% (polozenie pierwszego srodka masy)
[T,Y]=ode45(@(t,Y) RHS(t,Y,Wiezy,rows,M, NoB, Bezwladnosci, NoS, Sprezyny, NoF, Sily),timespan,Y0,OPTIONS);
    % Poniewa¿ macierz bezw³adnoœci nie zmienia siê w czasie, wiêc aby nie
    % obliczaæ jej za ka¿dym razem od nowa, jest po prostu przekazywana
    % jako argument funkcji ca³kowanej

Y = Y';    
    
timepoints = 1:( length(T) );
Ydot = zeros(size(Y));


for iter=timepoints
	Ydot(:,iter) = RHS( T(iter), Y(:,iter), Wiezy,rows,M, NoB, Bezwladnosci, NoS, Sprezyny, NoF, Sily );
end

calc_done = 1;  %przekazuje informacje o tym, ze obliczenia zostaly wykonane
                %tak, by móc odpaliæ LVADowolnyPunkt
                
%% PAUSE
%Porz¹dkowanie danych wyjœciowych
%Wektor po³o¿eñ:
Q = [ Y( 1:3*NoB , : )];
%Wektor predkosci
DQ = [ Y( 3*NoB+1:6*NoB , : )];
%Wektor przyspieszen
D2Q = [ Ydot( 3*NoB+1:6*NoB , : )];

function bar(temp, steps)
    temp = temp +1;
    progress = round(temp/steps, 2);
    disp(progress);
end

 