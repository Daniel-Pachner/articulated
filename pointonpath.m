function [b, il, ir] = pointonpath(p, h, verbose = false)
  ir = numel(p);
  il = 1;
  while ir - il > 1
    if verbose
      fprintf('[%i, %i]\n', il, ir);
    end
    i = fix((ir + il)/2);
    if p(i).s <= h
      il = i;
    else
      ir = i;
    end
  end
  if verbose
    fprintf('[%i, %i]\n', il, ir);
  end  
  t = (h - p(il).s)/(p(ir).s - p(il).s);
  b = point(p(il).x + t*(p(ir).x - p(il).x), ...
  p(il).y + t*(p(ir).y - p(il).y));
end