%% case 1

a = pointpath(0, 0);
b = pointpath(1, 0.4);

c = pointpath(0.5, +1);
d = pointpath(0.4, -1);


[x, t1, t2] = lineintersection(a, b, c, d);

figure
ax = gca;
plotpath(ax, [a, b], 'b-');
hold(ax, 'on')
plotpath(ax, [c, d], 'k-');
plotpath(ax, x, 'ro');

