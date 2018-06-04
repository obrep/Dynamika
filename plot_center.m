function [  ] = plot_center(element, Dane)
    T = cell2mat(Dane(1));
    Q = cell2mat(Dane(2));
    DQ = cell2mat(Dane(3));
    D2Q = cell2mat(Dane(4));
nrk = element * 3;
nry = element*3-1;
nrx = nry -1;
t = T(:,1);

close all;

name = 'Q(x)';
f = figure('Name',name);
movegui(f,'northwest');
name = 'Wykres przemieszczenia po wspolrzednej x';
plot(t,Q(nrx,:))
title(name)

name = 'Q(y)';
f = figure('Name',name);
movegui(f,'southwest');
name = 'Wykres przemieszczenia po wspolrzednej y';
plot(t,Q(nry,:))
title(name)

name = 'DQ(x)';
f = figure('Name',name);
movegui(f,'north');
name = 'Wykres predkosci po wspolrzednej x';
plot(t,DQ(nrx,:))
title(name)

name = 'DQ(y)';
f = figure('Name',name);
movegui(f,'south');
name = 'Wykres predkosci po wspolrzednej y';
plot(t,DQ(nry,:))
title(name)

name = 'D2Q(x)';
f = figure('Name',name);
movegui(f,'northeast');
name = 'Wykres przyspieszenia po wspolrzednej x';
plot(t,D2Q(nrx,:))
title(name)

name = 'D2Q(y)';
f = figure('Name',name);
movegui(f,'southeast');
name = 'Wykres przyspieszenia po wspolrzednej y';
plot(t,D2Q(nry,:))
title(name)

name = 'D2Qkat(y)';
f = figure('Name',name);
movegui(f,'southeast');
name = 'Wykres przyspieszenia katowego';
plot(t,D2Q(nrk,:)*180/pi)
title(name)