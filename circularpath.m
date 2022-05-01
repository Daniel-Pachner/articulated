function p = circularpath(r, d, nsegments)
  if isinf(r)
    x = zeros(1, nsegments);
    y = linspace(0, d, nsegments);
  else
    phi = linspace(0, d/r, nsegments);
    x = r*cos(phi);
    y = r*sin(phi);
  end
  p = pointpath (x - x(1), y - y(1));
end
