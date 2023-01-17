function p = pointpath(x, y)
  if any(numel(x) ~= numel(y))
    error('pointpath: x and y must be equal sizes');
  else
    n = numel(x);
  end
  s = zeros(size(x));
  p = struct('x', num2cell(x), 'y', num2cell(y), 's', num2cell(s));
  p = addlength(p);
end

function p = addlength(p)
  n = size(p, 2);
  m = size(p, 1);
  for r = 1 : m
    for c = 2 : n
        p(r, c).s = p(r, c-1).s + norm([p(r, c).x - p(r, c-1).x, p(r, c).y - p(r, c-1).y]);
    end
   end
end
