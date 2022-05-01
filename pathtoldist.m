function [dist, found, cross] = pathtoldist(p, h, l, limit = 3)
  %[v, b] = frompath(p, h);
  %[dist, found, cross] = rayhitsline(b, v, l(1), l(2), limit);
  [b, il, ir] = pointonpath(p, h);
  [dist, found, cross] = linetolinedist (p(il), p(ir), l(1), l(2));
end
