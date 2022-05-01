r = point(0, 0);
s = point(1, 0);
a = point(0, 0);
b = point(0, 1);

close('all')
figure(1)
ax = plotpath([], a, 'ro');
hold(ax, 'on');
plotpath(ax, b, 'rd');
plotpath(ax, r, 'bd');
plotpath(ax, s, 'bd');

p = pointpath([0, 1, 2], [0, 1, 2]);
q = transfpath(p, a, b, r, s);
plotpath(ax, p, 'r');
plotpath(ax, q, 'b');
plotpath(ax, q, 'b');
