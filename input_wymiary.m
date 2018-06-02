theta = 315;
FFF = 500;

%% Szablon struktury
% Bezwladnosci = struct('m',{},... % masa cz³onu (m)
%     'Iz',{}); % moment bezw³adnoœci cz³onu wzglêdem osi z (I_z)

% Sprezyny = struct('k',{},... % sztywnosc sprezyny
%     'c',{},... % tlumienie w sprezynie
%     'bodyi',{},... % numer pierwszego ciala przylozenia sprezyny
%     'bodyj',{},... % numer drugiego ciala przylozenia sprezyny
%     'sA',{},... % punkt przylozenia sprezyny do ciala i w i-tym ukladzie lokalnym
%     'sB',{},... % punkt przylozenia sprezyny do ciala j w j-tym ukladzie lokalnym
%     'd0',{}) % dlugosc swobodna sprezyny

% Sily = struct('F',{},... % wektor przylozonej sily
%     'bodyi',{},... % numer ciala, do ktorego przylozono sile
%     'sA',{}) % punkt przylozenia sily do ciala i w i-tym ukladzie lokalnym

%% Masy i momenty bezw³adnoœci cz³onów mechanizmu

NoB = 10; % Liczba cz³onów mechanizmu (Number of Bodies)

Bezwladnosci(1) = cell2struct({36, 8}', fieldnames(Bezwladnosci)); % cz³on 1
Bezwladnosci(2) = cell2struct({14.5, 0.5}', fieldnames(Bezwladnosci)); % cz³on 2
Bezwladnosci(3) = cell2struct({14, 0.9}', fieldnames(Bezwladnosci)); % cz³on 3
Bezwladnosci(4) = cell2struct({18, 1}', fieldnames(Bezwladnosci)); % cz³on 4
Bezwladnosci(5) = cell2struct({2.7, 0.2}', fieldnames(Bezwladnosci)); % cz³on 5
Bezwladnosci(6) = cell2struct({0.3, 0.1}', fieldnames(Bezwladnosci)); % cz³on 6
Bezwladnosci(7) = cell2struct({0.3, 0.1}', fieldnames(Bezwladnosci)); % cz³on 7
Bezwladnosci(8) = cell2struct({0.6, 0.1}', fieldnames(Bezwladnosci)); % cz³on 8
Bezwladnosci(9) = cell2struct({0.6, 0.1}', fieldnames(Bezwladnosci)); % cz³on 9
Bezwladnosci(10) = cell2struct({7, 0.2}', fieldnames(Bezwladnosci)); % cz³on 10


%% Parametry fizyczne sprê¿yn

NoS = 2; % Number of Springs

Sprezyny(1) = cell2struct({3e5, 3e3, 6, 7, [0.6; 0.15], [-0.6; -0.15], sqrt(0.68)}', fieldnames(Sprezyny)); % sprezyna 1
Sprezyny(2) = cell2struct({1e5, 1e3, 8, 9, [0.15; 0.75], [-0.15; -0.75], sqrt(1.04)}', fieldnames(Sprezyny)); % sprezyna 2


%% Si³y skupione przy³o¿one do mechanizmu

NoF = 1; % Number of Forces

Sily(1) = cell2struct({[500*cosd(theta); 500*sind(theta)], 4, [0.35; -0.15]}', fieldnames(Sily)); % jedyna sila
