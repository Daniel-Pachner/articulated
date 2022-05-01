function [p, y, h] = backtotrack(p, j, d, hp, direction, verbose = false)
  hl = hp;
  hr = hp + d*sign(direction);
  [p, y, h] = findpointatdist (p, j, d, hl, hr, verbose);
  p.s = h;
end
