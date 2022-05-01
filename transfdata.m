function [x, y, T] = transfdata(p, a, b, r, s)
  T = linetransf(a, b, r, s);
  [x, y] = transf(T, p);
end

function [x, y] = transf(T, a)
  n = numel(a);
  x = T(1, 1)*[a(:).x] + T(1, 2)*[a(:).y] + T(1, 3);
  y = T(2, 1)*[a(:).x] + T(2, 2)*[a(:).y] + T(2, 3);
end

function T = linetransf(r, s, a, b)
  A = ones(3, 3);
  A(1, 1) = r.x;
  A(2, 1) = r.y;
  A(1, 2) = s.x;
  A(2, 2) = s.y;
  A(1, 3) = s.x - (r.y - s.y);
  A(2, 3) = s.y + (r.x - s.x);
  B = ones(3, 3);
  B(1, 1) = a.x;
  B(2, 1) = a.y;
  B(1, 2) = b.x;
  B(2, 2) = b.y;
  B(1, 3) = b.x - (a.y - b.y);
  B(2, 3) = b.y + (a.x - b.x);
  T = B / A;
  T = T(1 : 2, :);
end