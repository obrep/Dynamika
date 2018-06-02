function [ y ] = q_y( q, i )
%Q_Y funkcja zwracajaca wspolrzedna y i-tego ciala

if(i==0)
    y = 0;
else
    y = q(3*i-1);
end

end