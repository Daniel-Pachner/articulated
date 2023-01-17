a = point(0.1, 0.4);
b = point(0.6, 1.9);
c = point(2.5, 2.2);
D = 1.72;

[p, q, n] = onlineatdist(a, b, c, D, false, false);

phi = linspace(-pi, pi, 100);
X = c.x + D*cos(phi);
Y = c.y + D*sin(phi);

figure
ax = gca;
plotpath(ax, a, 1, 'bo');
hold(ax, 'on')
plotpath(ax, b, 1, 'bo');
plotpath(ax, c, 1, 'ro');
plotpath(ax, p, 1, 'rx');
plotpath(ax, q, 1, 'rx');
plot(X, Y, 'k:')
plot([a.x, b.x], [a.y, b.y], 'k:')

text(a.x, a.y, 'a', 'fontsize', 23);
text(b.x, b.y, 'b', 'fontsize', 23);

text(p.x, p.y, '1', 'fontsize', 23);
text(q.x, q.y, '2', 'fontsize', 23);

