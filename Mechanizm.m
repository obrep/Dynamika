function [T,Q,DQ,D2Q]=Mechanizm(Wiezy, rows)
% [T,Q,DQ,D2Q]=KorbWodz
% Rozwi¹zanie zadañ kinematyki o po³o¿eniu, prêdkoœci i przyspieszeniu 
%   dla mechanizmu korbowo-wodzikowego.
% Wyjœcie:
%   T   - tablica do zapisu kolejnych chwil.
%   Q   - tablica do zapisu rozwi¹zañ zadania o po³o¿eniu w kolejnych chwilach.
%   DQ  - tablica do zapisu rozwi¹zañ zadania o prêdkoœci w kolejnych chwilach.
%   D2Q - tablica do zapisu rozwi¹zañ zad. o przyspieszeniu w kolejnych chwilach.

%input_wymiary;

% Przybli¿enie startowe (gdy brak rozwi¹zania z poprzedniej chwili)

q = [0.7; -0.2; 0;
    0; 0.2; 0;
    0.2; 0.3; 0;
    1.55; -0.35; 0;
    0.9; 0.2; 0;
    0.2; -0.35; 0;
    0.6; -0.25; 0;
    0.15; -0.45; 0;
    0.25; 0.05; 0;
    0.7; 0; 0];
qdot=zeros(size(q));
qddot=zeros(size(q));

lroz=0; % Licznik rozwi¹zañ (s³u¿y do numerowania kolumn w tablicach z wynikami)
dt=0.01; % Odstêp pomiêdzy kolejnymi chwilami

ZakresCzasu = 0:dt:3;
Q = zeros(size(q,1), length(ZakresCzasu));
DQ = zeros(size(Q));
D2Q = zeros(size(Q));
T = zeros(1, size(Q,2));

% Rozwi¹zywanie zadañ kinematyki w kolejnych chwilach t
for t=ZakresCzasu
    % Zadanie o po³o¿eniu. 
    % Przybli¿eniem pocz¹tkowym jest rozwi¹zanie z poprzedniej chwili, 
    % powiêkszone o sk³adniki wynikaj¹ce z obliczonej prêdkoœci i przyspieszenia.
    q0=q+qdot*dt+0.5*qddot*dt*dt;
    q=NewtonRaphson(q0,t,Wiezy,rows); 

    % Zadanie o predkosciach
    qdot=MacierzJacobiego(q,t,Wiezy,rows)\WektorPrawychPredk(q,t,Wiezy,rows);  % Zadanie o prêdkoœci

    % Zadanie o przyspieszeniach
    qddot=MacierzJacobiego(q,t,Wiezy,rows)\WektorGamma(q,qdot,t,Wiezy,rows);  % Zadanie o przyspieszeniu

    % Zapis do tablic gromadz¹cych wyniki
    lroz %Wyswietlana tylko do debugowania
    lroz=lroz+1;
    T(1,lroz)=t; 
    Q(:,lroz)=q;
    DQ(:,lroz)=qdot;
    D2Q(:,lroz)=qddot;
end
