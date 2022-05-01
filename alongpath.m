function [v, b] = alongpath(p, h)
  [b, i, j] = pointonpath(p, h);
  v = [p(j).x - p(i).x, p(j).y - p(i).y, 0];
  v = v/norm(v);   
  w = [b.x, b.y, 0];
  v(3) = -sum(v .* w);
end
