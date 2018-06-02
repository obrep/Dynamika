function [ r ] = q_r( q, i )
%Q_R funkcja zwracajaca wektor r dla i-tego ciala

if(i==0)
    r = [0;0];
else
    r = [q(3*i-2); 
    q(3*i-1)];
end

end

