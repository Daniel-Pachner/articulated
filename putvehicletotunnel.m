function tu = putvehicletotunnel(p, tu, v)
  for k = 1 : numel(v.tunits)
    for j = 1 : numel(v.tunits(k).x) - 1
      tu = extendtunnel(p, tu, pointpath(v.tunits(k).x([j:j+1]), ...
      v.tunits(k).y([j:j+1])));
    end
  end
end
