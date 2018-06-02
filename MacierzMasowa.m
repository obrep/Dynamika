function [ M ] = MacierzMasowa( Bezwladnosci, NoB )

M = zeros(3*NoB);

for iter=1:NoB
    M(3*iter-2, 3*iter-2) = Bezwladnosci(iter).m;
    M(3*iter-1, 3*iter-1) = Bezwladnosci(iter).m;
    M(3*iter, 3*iter) = Bezwladnosci(iter).Iz;
end

end

