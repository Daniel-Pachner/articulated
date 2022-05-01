function [dist, found, cross] = rayhitsline(p, v, a, b, limit = 5)
  A = [
  b.x-a.x, -v(1); 
  b.y-a.y, -v(2)];
  if abs((b.x-a.x)*v(2) - v(1)*(b.y-a.y)) > 1e-7
    b = [p.x - a.x; p.y - a.y]; 
    s = A \ b;
    found = s(1) <= 1 && s(1) >= 0 && abs(s(2)) <= limit; 
    if found
      dist = s(2);
    else
      dist = 0;
    end
    cross = point(p.x + dist*v(1), p.y + dist*v(2));
  else
    found = false;
    dist = 0;
    cross = p;
  end
end

