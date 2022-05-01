function [p2, y, h2] = findpivottopivot(p, h1, d, direction, verbose = false)
  hl = h1 + 0.5*d*sign(direction);
  hr = h1 + 2.0*d*sign(direction);
  p1 = pointonpath(p, h1);
  [p2, y, h2] = findpointatdist (p, p1, d, hl, hr, verbose);
  p2.s = h2;
end