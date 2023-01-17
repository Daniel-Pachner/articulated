function q = transfpath(p, T)
  x = T(1, 1)*[p(:).x] + T(1, 2)*[p(:).y] + T(1, 3);
  y = T(2, 1)*[p(:).x] + T(2, 2)*[p(:).y] + T(2, 3);
  q = pointpath(x, y);
end

