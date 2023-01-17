function ret = point_inside(a, r, tol)
  proxypoint = false;
  n = 0;
  n_vert = numel(r);
  for j = 1 : n_vert;
    proxypoint = proxypoint || abs(a.x - r(j).x) < tol && abs(a.y - r(j).y) < tol;
    if ~proxypoint
      i = mod(j, n_vert) + 1;
      dn = xminuscross(r(j).x - a.x, r(i).x - a.x, r(j).y - a.y, r(i).y - a.y);
%%      disp([j, i, dn])
      n = n + dn;
    end
  end
  ret = proxypoint || (n ~= 0);
end

function nplus = xminuscross(x1, x2, y1, y2)
    t = y1 / (y1 - y2); % division safe
    cross = t >= 0 && t < 1 && (x1 + (x2 - x1)*t) < 0.0;
    if cross && y1 >= 0 && y2 < 0
      nplus = 1;
    elseif cross && y1 < 0 && y2 >= 0.0
      nplus = -1;
    else
      nplus = 0;
    end
end
