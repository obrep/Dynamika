function [ count, n ] = Nadmiar( A )
%NADMIAR Funkcja obliczajaca liczbe zaleznych wierszy w macierzy A

%   Detailed explanation goes here
% Baza funkcji Nadmiar jest funkcja rref, ktora wyznacza przeksztalcenie 
% macierzy A w tzw. macierz schodkowa  w formie zredukowanej  
% (ang. Reduced row echelon form)
% Przy okazji opcjonalnie zwraca liczbe wierszy A

n = size(A,1);

count = 0;
RED = rref(A);

for i = n:-1:1
    if(norm(RED(i,:),Inf)>epsilon())
        break;
    end
    count = count + 1;
end

end

