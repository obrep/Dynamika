function [ phi ] = q_phi( q, i )
%Q_PHI funkcja zwracajaca wspolrzedna polozenia katowego i-tego ciala

if(i==0)
    phi = 0;
else
    phi = q(3*i);
end
end

