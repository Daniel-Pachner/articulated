function [a, y, h] = findpointatdist (p, c, d, hl, hr, verbose = false)
  f = @(h) value(p, h, c, d);
  [h, y] = pointsolver(hl, hr, f, verbose, 100, 1e-6, true);
  a = pointonpath(p, h);
end

function y = value(p, h, c, d)
  b = pointonpath(p, h);
  y = d - norm([b.x - c.x, b.y - c.y]);
end

