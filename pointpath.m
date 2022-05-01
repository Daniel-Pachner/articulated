function p = pointpath(x, y)
  if numel(x) ~= numel(y)
    error('pointpath: x and y must be equal sizes');
  else
    n = numel(x);
  end
  s = zeros(1, n);
  p = struct('x', num2cell(x), 'y', num2cell(y), 's', num2cell(s));
  p = addlength(p);
end

function p = addlength(p)
  n = numel(p);
  for k = 2 : n
    p(k).s = p(k-1).s + norm([p(k).x - p(k-1).x, p(k).y - p(k-1).y]);
  end  
end
