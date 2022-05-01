v = samplevehicle();

r = 60;
nsegments = 30;
d = 70;
d = 2*v.marks(end).dim;
p = circularpath (r, d, nsegments);

close('all')
figure(1)
ax = plotpath([], p, 'b:');
hold(ax, 'on')

line_r = pointpath(-[40, 40], [10, 30]);
line_l = pointpath([30, 30], [10, 30]);
plotpath(ax, line_r, 'k:o');
plotpath(ax, line_l, 'k:o');

tu = tunnel(p);
tu = extendtunnel(p, tu, line_r, 50);
tu = extendtunnel(p, tu, line_l, 50);
plottunnel(ax, tu);
