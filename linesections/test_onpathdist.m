x = linspace(0, 1.1, 3);
p = pointpath(x, x.^2);

c = point(1, 2.25);
D = 0.7;
s = onpathatdist(p, c, D);

phi = linspace(-pi, pi, 100);
X = c.x + D*cos(phi);
Y = c.y + D*sin(phi);

figure
ax = gca;
plotpath(ax, p, 1, 'b. -');
hold(ax, 'on')
plotpath(ax, s, 1, 'r s', 'markerfacecolor', 'r');
plotpath(ax, c, 1, 'ro');
plot(X, Y, 'k:')

text(s(1).x, s(1).y, '1', 'fontsize', 23);
text(s(2).x, s(2).y, '2', 'fontsize', 23);

