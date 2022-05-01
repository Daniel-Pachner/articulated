r = 6;
nsegments = 36;
phi = linspace(0, pi, nsegments);
x = r*cos(phi);
y = r*sin(phi);

p = pointpath (x, y);

close('all')
figure(1)
ax = plotpath([], p, 'b');
hold(ax, 'on');

x = linspace(-1.5*r, 1.5*r, 2);
Y = linspace(-1.5*r, 1.5*r, 2);
for t = linspace(0.2, 0.8, 3)
  [w, b] = frompath(p, p(end).s*t);
  [v, a] = alongpath(p, p(end).s*t);
  ax = plotpath([], b, 'b*');
  ax = plotpath([], a, 'bo');
  for d = linspace(0, 1, 2)
    y = -(w(1)*x + w(3) - d)/w(2);
    plot(ax, x, y, 'r:')
    X = -(v(2)*Y + v(3) - d)/v(1);
    plot(ax, X, Y, 'g:')
  end
end

title(ax, 'Distance to the right and forward')






