function p3 = findextrap(p1, p2, d)
  l = norm([p2.x - p1.x, p2.y - p1.y]);
  t = 1 + d/l;
  p3 = point(p1.x + (p2.x - p1.x)*t, p1.y + (p2.y - p1.y)*t);
end
