function [ R ] = RotMat( phi )
%ROTMAT Macierz obrotu 2D przy zadanym kacie phi

R = [cos(phi), -sin(phi);
    sin(phi), cos(phi)];


end

