function [q, T] = transfpath(p, a, b, r, s)
  [x, y, T] = transfdata(p, a, b, r, s);
  q = pointpath(x, y);
end
