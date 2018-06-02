function [ x ] = q_x( q, i )
%Q_X funkcja zwracajaca wspolrzedna x i-tego ciala

if(i==0)
    x = 0;
else
    x = q(3*i-2);
end


end

