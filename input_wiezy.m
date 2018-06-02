% Wiezy = struct('typ',{},... % dopisanych czy kinematyczny
%     'klasa',{},... % para postepowa czy obrotowa (innych na razie nie ma)
%     'bodyi',{},... % numer pierwszego ciala
%     'bodyj',{},... % numer drugiego ciala
%     'sA',{},... % wektor sA w i-tym ukladzie
%     'sB',{},... % wektor sB w j-tym ukladzie
%     'phi0',{},... % kat phi0 (jezeli para obrotowa - nie uzywamy)
%     'perp',{},... % wersor prostopadly osi ruchu w ukladzie jtym! (jezeli para obrotowa - nie uzywamy)
%     'fodt',{},... % funkcja od czasu dla wiezow dopisanych
%     'dotfodt',{},... % pochodna funkcji od czasu dla wiezow dopisanych
%     'ddotfodt',{}) % druga pochodna funkcji od czasu dla wiezow dopisanych

Wiezy(1) = cell2struct(...
    {'kinematyczny', 'obrotowy', 0, 4,  [0.0; 0.0], [-0.05; -0.15], [], [], [], [], []}', ...
    fieldnames(Wiezy)); % Punkt A

Wiezy(2) = cell2struct(...
    {'kinematyczny', 'obrotowy', 0, 6,  [0.3; 0.0], [-0.05; -0.2], [], [], [], [], []}', ...
    fieldnames(Wiezy)); % Punkt B

Wiezy(3) = cell2struct(...
    {'kinematyczny', 'obrotowy', 1, 3,  [0.2; -0.25], [0.05; 0.15], [], [], [], [], []}', ...
    fieldnames(Wiezy)); % Punkt D

Wiezy(4) = cell2struct(...
    {'kinematyczny', 'obrotowy', 0, 1,  [-0.1; 0.7], [-0.1; -0.15], [], [], [], [], []}', ...
    fieldnames(Wiezy)); % Punkt E

Wiezy(5) = cell2struct(...
    {'kinematyczny', 'obrotowy', 1, 7,  [-0.2; -0.05], [-0.6; 0.7], [], [], [], [], []}', ...
    fieldnames(Wiezy)); % Punkt F

Wiezy(6) = cell2struct(...
    {'kinematyczny', 'obrotowy', 1, 2,  [0.0; 0.35], [-0.4; 0.45], [], [], [], [], []}', ...
    fieldnames(Wiezy)); % Punkt G

Wiezy(7) = cell2struct(...
    {'kinematyczny', 'obrotowy', 2, 5,  [0.1; 0.05], [0.05; 0.2], [], [], [], [], []}', ...
    fieldnames(Wiezy)); % Punkt H

Wiezy(8) = cell2struct(...
    {'kinematyczny', 'obrotowy', 7, 8,  [0.1; -0.2], [-0.15; -0.35], [], [], [], [], []}', ...
    fieldnames(Wiezy)); % Punkt I

Wiezy(9) = cell2struct(...
    {'kinematyczny', 'obrotowy', 2, 8,  [0.3; -0.45], [0.05; 0.05], [], [], [], [], []}', ...
    fieldnames(Wiezy)); % Punkt J

Wiezy(10) = cell2struct(...
    {'kinematyczny', 'obrotowy', 8, 9,  [0.15; 0.35], [-0.25; 0.3], [], [], [], [], []}', ...
    fieldnames(Wiezy)); % Punkt K

Wiezy(11) = cell2struct(...
    {'kinematyczny', 'obrotowy', 7, 10,  [0.6; -0.6], [-0.2; -0.25], [], [], [], [], []}', ...
    fieldnames(Wiezy)); % Punkt L

Wiezy(12) = cell2struct(...
    {'kinematyczny', 'obrotowy', 9, 10,  [0.25; -0.3], [0.1; 0.25], [], [], [], [], []}', ...
    fieldnames(Wiezy)); % Punkt N

Wiezy(13) = cell2struct(...
    {'kinematyczny', 'postepowy', 3, 4,  [-0.05; -0.15], [0.05; 0.15], 0, [-3.0;1.0]/sqrt(10), [], [], []}', ...
    fieldnames(Wiezy)); % Punkt AD

Wiezy(14) = cell2struct(...
    {'kinematyczny', 'postepowy', 5, 6,  [-0.05; -0.2], [0.05; 0.2], 0, [-4.0;1.0]/sqrt(17), [], [], []}', ...
    fieldnames(Wiezy)); % Punkt BH
