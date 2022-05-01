r = 20;
d = 60;
p = circularpath(r, d, 30);

close('all')
figure(1)
ax = plotpath([], p, 2, 'b');
hold(ax, 'on')

y = point(0+20, 50);
z = point(1+20, 50);
a = point(0, 0);
b = point(1, 0);
[q, T] = transfpath(p, a, b, y, z);
plotpath(ax, q, 2, 'b:');

for t = linspace(0, 1.0, 6)
    b = pointonpath(p, p(end).s*t);
    plotpath(ax, b, 'ro');
    text(b.x, b.y, num2str(t, 3));
    b = pointonpath(q, q(end).s*t);
    plotpath(ax, b, 'go');
    text(b.x, b.y, num2str(t, 3));
end

t = -0.1;
[b, i, j] = pointonpath(p, p(end).s*t, true);
plotpath(ax, b, 'rs');
text(b.x, b.y, ['t=', num2str(t, 3)]);
