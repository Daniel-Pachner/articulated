figure(1)
for param = linspace(0, -2, 7)
  p = point(0, param);
  v = [1; 0.2];
  a = point(3, -1);
  b = point(2, +1)
  [dist, ~, cross] = rayhitsline(p, v, a, b);
  
  s = linspace(0, dist, 2);
  t = linspace(0, 1, 2);
  
  x = p.x + s*v(1);
  y = p.y + s*v(2);
  X = a.x + t*(b.x - a.x);
  Y = a.y + t*(b.y - a.y);
  
  plot(X(1), Y(1), 'ro', X, Y, 'r', x, y, 'b-o')
  hold on
  plot(cross.x, cross.y, 'rp', 'markersize', 9)
  title(['distance = ', num2str(dist)])
  drawnow
end
