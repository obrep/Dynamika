%% Zadanie po³o¿enia punktu, którego po³o¿enie bêdzie obliczane
body = 4; % Numer cz³onu, z którym zwi¹zany bêdzie punkt
rKloc = [0.35; -0.15]; % Po³o¿enie punktu w lokalnym uk³adzie

% Przed obliczeniem po³o¿enia punktu w ogóle nale¿y wykonaæ obliczenia
% dynamiki mechanizmu (SuperSkrypt) - ten skrypcik nie sprawdza, czy
% Q,DQ,D2Q w ogóle istniej¹

%% Obliczenia
for time=1:length(T)
    
IIrK(1:2,time) = [Q(3*body-2,time);Q(3*body-1,time)]+RotMat(Q(3*body,time))*rKloc;

IIrdotK(1:2,time) = [DQ(3*body-2,time);DQ(3*body-1,time)] + Omega()*RotMat(Q(3*body,time))*rKloc*DQ(12,time);

IIrddotK(1:2,time) = [D2Q(3*body-2,time);D2Q(3*body-1,time)] - RotMat(Q(3*body,time))*rKloc*DQ(3*body,time)*DQ(3*body,time)...
    + Omega()*RotMat(Q(3*body,time))*rKloc*D2Q(3*body,time);
end

%% Tu mo¿na by wstawiæ rysowanie wykresów