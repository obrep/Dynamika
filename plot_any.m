function [] = plot_any( element, Dane, wsp)%% Zadanie po�o�enia punktu, kt�rego po�o�enie b�dzie obliczane
    %wsp = [0.1; -0.15]; % Po�o�enie punktu w lokalnym uk�adzie

close all;

T = cell2mat(Dane(1));
Q = cell2mat(Dane(2));
DQ = cell2mat(Dane(3));
D2Q = cell2mat(Dane(4));

%% Obliczenia
t = T(:,1);
for time=1:length(T)

%IIrK(1:2,time) = [(3*body-2,time);Y(3*body-1,time)]+RotMat(Y(3*body,time))*rKloc;
IIrK(1:2,time) = [Q(3*element-2,time);Q(3*element-1,time)]+RotMat(Q(3*element,time))*wsp;

IIrdotK(1:2,time) = [DQ(3*element-2,time);DQ(3*element-1,time)] + Omega()*RotMat(Q(3*element,time))*wsp*DQ(3*element,time);

IIrddotK(1:2,time) = [D2Q(3*element-2,time);D2Q(3*element-1,time)] - RotMat(Q(3*element,time))*wsp*DQ(3*element,time)*DQ(3*element,time)...
    + Omega()*RotMat(Q(3*element,time))*wsp*D2Q(3*element,time);
end

%% Dzikie ploty
name = 'Q(x)';
f = figure('Name',name);
movegui(f,'northwest');
name = 'Wykres przemieszczenia po wspolrzednej x';
plot( t, IIrK( 1 , : )  );
title(name)

name = 'Q(y)';
f = figure('Name',name);
movegui(f,'southwest');
name = 'Wykres przemieszczenia po wspolrzednej y';
plot( t, IIrK( 2 , : )  );
title(name)

name = 'DQ(x)';
f = figure('Name',name);
movegui(f,'north');
name = 'Wykres predkosci po wspolrzednej x';
plot( t, IIrdotK( 1 , : )  );
title(name)


name = 'DQ(y)';
f = figure('Name',name);
movegui(f,'south');
name = 'Wykres predkosci po wspolrzednej y';
 plot( t, IIrdotK( 2 , : )  );
title(name)

name = 'D2Q(x)';
f = figure('Name',name);
movegui(f,'northeast');
name = 'Wykres przyspieszenia po wspolrzednej x';
plot( t, IIrddotK( 1 , : )  );
title(name)

name = 'D2Q(y)';
f = figure('Name',name);
movegui(f,'southeast');
name = 'Wykres przyspieszenia po wspolrzednej y';
plot( t, IIrddotK( 2 , : )  );
title(name)

