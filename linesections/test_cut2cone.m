r = pointpath(1, 1.0);
s = pointpath(1.1, 0.3);

n = 8;
phi = linspace(0, 1.0*pi, n);
xp = cos(phi);
yp = sin(phi);
R =  1.1;
p = pointpath(R.*xp, R.*yp);

figure
plotpath(gca, p, 'b- o');
hold on
[a, b] = cut2cone(r, s, p, 2, true, true);
plotpath(gca, [a, b], 'g-', 'linewidth', 4);
plotpath(gca, [r, s], 'k-');

