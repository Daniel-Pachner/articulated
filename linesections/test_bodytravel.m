close all

LA = 4.00;
WA = 2.46;
contour = pointpath(LA*[0 1 1 0 0], WA*[-1 -1 1 1 -1]/2);
mark = pointpath(LA*[0.1, 0.3, 0.9], [0, 0, 0]);
boggieA = struct('contour', contour, 'mark', mark);

LB = 14.00;
WB = 2.46;
contour = pointpath(LB*[0 1 1 0 0], WB*[-1 -1 1 1 -1]/2);
mark = pointpath([0.4*LA, LB-0.1*LA], [0, 0]);
partB = struct('contour', contour, 'mark', mark);

LC = 4.00;
WC = 2.46;
contour = pointpath(LC*[0 1 1 0 0], WC*[-1 -1 1 1 -1]/2);
mark = pointpath(LC*[0.1, 0.3, 0.7, 0.9], [0, 0, 0, 0]);
boggieC = struct('contour', contour, 'mark', mark);

LD = 11.00;
WD = 2.46;
contour = pointpath(LD*[0 1 1 0 0], WD*[-1 -1 1 1 -1]/2);
mark = pointpath([0.1*LC, LD-0.1*LC], [0, 0]);
partD = struct('contour', contour, 'mark', mark);

LE = 4.00;
WE = 2.46;
contour = pointpath(LE*[0 1 1 0 0], WE*[-1 -1 1 1 -1]/2);
mark = pointpath(LE*[0.1, 0.3, 0.7, 0.9], [0, 0, 0, 0]);
boggieE = struct('contour', contour, 'mark', mark);

LF = 14.00;
WF = 2.46;
contour = pointpath(LF*[0 1 1 0 0], WF*[-1 -1 1 1 -1]/2);
mark = pointpath([0.1*LE, LF-0.4*LE], [0, 0]);
partF = struct('contour', contour, 'mark', mark);

LG = 4.00;
WG = 2.46;
contour = pointpath(LG*[0 1 1 0 0], WG*[-1 -1 1 1 -1]/2);
mark = pointpath(LG*[0.1, 0.7, 0.9], [0, 0, 0]);
boggieG = struct('contour', contour, 'mark', mark);

%%map = struct(...
%%'radius', {inf, 18,   inf, -18, inf}, ...
%%'angle',  {0,   pi/2, 0, -pi/2, 0}, ...
%%'length', {30,  inf,  3, inf, 30});
%%pc = map2path(map, 2);

map = struct(...
'radius', {inf, 18, inf}, ...
'angle',  {0, pi/2, 0}, ...
'length', {50, inf, 50});
pc = map2path(map, 4);


figure
n = numel(pc);
T_boggieA = passbody(pc, pc, boggieA, 1, 3);
markpath_boggieA = passmarks(T_boggieA, boggieA);

T_partB = passbody(markpath_boggieA(2, :), markpath_boggieA(2, :), partB, 1, 2);
markpath_partB = passmarks(T_partB, partB);

T_boggieC = passbody(markpath_partB(2, :), pc, boggieC, 2, 4);
markpath_boggieC = passmarks(T_boggieC, boggieC);

T_partD = passbody(markpath_boggieC(3, :), markpath_boggieC(2, :), partD, 1, 2);
markpath_partD = passmarks(T_partD, partD);

T_boggieE = passbody(markpath_partD(2, :), pc, boggieE, 2, 4);
markpath_boggieE = passmarks(T_boggieE, boggieE);

T_partF = passbody(markpath_boggieE(3, :), markpath_boggieE(2, :), partF, 1, 2);
markpath_partF = passmarks(T_partF, partF);

T_boggieG = passbody(markpath_partF(2, :), pc, boggieG, 2, 1);
markpath_boggieG = passmarks(T_boggieG, boggieG);

dl = NaN(1, n);
dr = NaN(1, n);
[dl, dr] = passwidth(pc, boggieA, T_boggieA, dl, dr);
[dl, dr] = passwidth(pc, partB, T_partB, dl, dr);
[dl, dr] = passwidth(pc, boggieC, T_boggieC, dl, dr);
[dl, dr] = passwidth(pc, partD, T_partD, dl, dr);
[dl, dr] = passwidth(pc, boggieE, T_boggieE, dl, dr);
[dl, dr] = passwidth(pc, partF, T_partF, dl, dr);
[dl, dr] = passwidth(pc, boggieG, T_boggieG, dl, dr);
R = occupiedarea(pc, dl, dr);
plotoccupiedarea(R, 'facecolor', [1, .7, .7]);
hold on

%%plotpath(pc, 'k', 'linewidth', 0.5);
hold on
%%plotpath(markpath_partD(2, :), 'r-.')
%%plotpath(markpath_boggieG(1, :), 'g-.')


%%for i = 1 : n
%%    markpass(partB, T_partB, i, 'color', 0.6*[1, 1, 1]);
%%    markpass(partD, T_partD, i, 'color', 0.6*[1, 1, 1]);
%%    markpass(partF, T_partF, i, 'color', 0.6*[1, 1, 1]);
%%    markpass(boggieA, T_boggieA, i, 'color', 0.6*[1, 1, 1]);
%%    markpass(boggieC, T_boggieC, i, 'color', 0.6*[1, 1, 1]);
%%    markpass(boggieE, T_boggieE, i, 'color', 0.6*[1, 1, 1]);
%%    markpass(boggieG, T_boggieG, i, 'color', 0.6*[1, 1, 1]);
%%end

hold on
[hbA, hcA] = animatepass(boggieA, T_boggieA, 0.01, [], [], 1, 'b', 'facealpha', 0.8);
[hbC, hcC] = animatepass(boggieC, T_boggieC, 0.01, [], [], 1, 'b', 'facealpha', 0.8);
[hbE, hcE] = animatepass(boggieE, T_boggieE, 0.01, [], [], 1, 'b', 'facealpha', 0.8);
[hbG, hcG] = animatepass(boggieG, T_boggieG, 0.01, [], [], 1, 'b', 'facealpha', 0.8);
[hbB, hcB] = animatepass(partB, T_partB, 0.01, [], [], 1, 'g', 'facealpha', 0.8);
[hbD, hcD] = animatepass(partD, T_partD, 0.01, [], [], 1, 'g', 'facealpha', 0.8);
[hbF, hcF] = animatepass(partF, T_partF, 0.01, [], [], 1, 'g', 'facealpha', 0.8);

for j = 1 : 4
    for i = [1 : n, n-1 : -1 : 1]
        [hbB, hcB] = animatepass(partB, T_partB, 0, hbB, hcB, i);
        [hbD, hcD] = animatepass(partD, T_partD, 0, hbD, hcD, i);
        [hbF, hcF] = animatepass(partF, T_partF, 0, hbF, hcF, i);
        [hbA, hcA] = animatepass(boggieA, T_boggieA, 0, hbA, hcA, i);
        [hbC, hcC] = animatepass(boggieC, T_boggieC, 0, hbC, hcC, i);
        [hbE, hcE] = animatepass(boggieE, T_boggieE, 0, hbE, hcE, i);
        [hbG, hcG] = animatepass(boggieG, T_boggieG, 0, hbG, hcG, i);
        pause(1e-2)
    end
end

plotpath(pc, 'k', 'linewidth', 0.5);

%%figure
%%markpath = markpath_partF(2, :);
%%S = [pc.s];
%%v_mark = sqrt(diff([markpath.x]).^2 + diff([markpath.y]).^2)./diff(S);
%%plot(S(1:end-1), v_mark)
