close all;

t = linspace(0, 1, 120);
p = pointpath(sin(2*pi*t), cos(2*pi*t) + (t.^3 - 0.1*t + 0.3));
A = point(-0.65, 0.15);
S = p(2);
S.y = S.y - 0.1;

ax = plotpath([], p, 1, '-.');
hold(ax, 'on')
ha = plot(ax, [S.x, A.x], [S.y, A.y], 'bo-', 'linewidth', 2);

[X, phi] = rotate_to_path(p, A, S);
hx = plot(ax, [S.x, X.x], [S.y, X.y], 'ro-', 'linewidth', 2);

