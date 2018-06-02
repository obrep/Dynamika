function q=NewtonRaphson(q0,t, Wiezy, rows)
% q=NewRaph(q0,t)
%   Rozwi¹zanie uk³adu równañ metod¹ Newtona-Raphsona.
% Wejœcie:
%   q0 - przybli¿enie startowe,
%   t - chwila, dla której poszukiwane jest rozwi¹zanie.
% Wyjœcie:
%   q - uzyskane rozwi¹zanie.
%
% Uk³ad równañ musi byæ wpisany w pliku Wiezy.m.
% Macierz Jacobiego uk³adu równañ musi byæ wpisana w pliku Jakobian.m.
%
%*************************************************************
%   Program stanowi za³¹cznik do ksi¹¿ki:
%   Fr¹czek J., Wojtyra M.: Kinematyka uk³adów wielocz³onowych.
%                           Metody obliczeniowe. WNT 2007.
%   Wersja 1.0
%*************************************************************

q=q0;

F=WektorPhi(q,t, Wiezy, rows);
iter=1; % Licznik iteracji
while ( (norm(F)>epsilon()) && (iter < 200) )
    F=WektorPhi(q,t, Wiezy, rows);
    Fq=MacierzJacobiego(q,t,Wiezy,rows);
    q=q-Fq\F;  % Fq\F jest równowa¿ne inv(Fq)*F, ale mniej kosztowne numerycznie
    iter=iter+1;
end
if iter >= 200
    error('B£¥D: Po 200 iteracjach Newtona-Raphsona nie uzyskano zbie¿noœci ');
    norm(F)
    q=q0;
end

