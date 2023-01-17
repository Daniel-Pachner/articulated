%% case 1

a = pointpath(0.2, -1);
b = pointpath(-0.6, +1);

c = pointpath(0.5, -1);
d = pointpath(0.4, +1);


[x, y] = cutline(a, b, c, d, 'r', true);

figure
ax = gca;
plotpath(ax, [a, b], 'b:');
hold(ax, 'on')
plotpath(ax, [c, d], 'k-');
plotpath(ax, [x, y], 'b-', 'linewidth', 3);
text(a.x, a.y, 'Cut to the r of black line')


