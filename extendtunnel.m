function tu = extendtunnel(p, tu, l, limit = 3)
for i = 1 : numel(tu)
  [d, found, cross] = pathtoldist(p, tu(i).s, l, limit);
  if d < 0 && tu(i).dl < -d
    tu(i).dl = -d;
    tu(i).xl = cross.x;
    tu(i).yl = cross.y;
  elseif d > 0 && tu(i).dr < d
    tu(i).dr = d;
    tu(i).xr = cross.x;
    tu(i).yr = cross.y;
  end
end
end