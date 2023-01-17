close all
P = point(0.2, 0.3);
S = point(0, 0);

line = pointpath([0.2, 0], [0, 1]);
ax = plotpath([], line, 1, 'linewidth', 3);
hold(ax, 'on')
axis('equal')

for i = 1 : 5
    plotpath(ax, P, 1, 'r-o');
    X = closest_on_line(line, P);
    plotpath(ax, X, 1, 'r-p');
    phi = myangle(X.x - S.x, X.y - S.y) - myangle(P.x - S.x, P.y - S.y);
    R = [cos(phi), -sin(phi); sin(phi), cos(phi)];
    v = [S.x; S.y] + R * [P.x - S.x; P.y - S.y];
    P = point(v(1), v(2));
end

point2line(P, line(1), line(2));

%%B = [line(2).x; line(2).y];
%%A = [line(1).x; line(1).y];
%%C = [P.x; P.y];
%%tau =  ((B - A)' * (C - A)) / ((B - A)' * (B - A));
%%disp(tau)
