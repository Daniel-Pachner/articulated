r = 80;
nsegments = 25;
phi = linspace(0, pi, nsegments);
x = r*cos(phi);
y = r*sin(phi);

p = pointpath (x, y);

close('all')
figure(1)
ax = plotpath([], p, 'b');
hold(ax, 'on')

line = pointpath([-30, 90], [100, 100]);
plotpath(ax, line, 'r');

for t = linspace(0, 1, 50)
  h = p(end).s * t;
  [v, b] = frompath(p, h);
  [dist, found, cross] = rayhitsline(b, v, line(1), line(2));
  plot(ax, b.x, b.y, 'bo');
  plot(ax, cross.x, cross.y, 'gx');
  plot(ax, [b.x, cross.x], [b.y, cross.y], 'k:');
  title(['distance = ', num2str(dist)]);
  drawnow;
end
