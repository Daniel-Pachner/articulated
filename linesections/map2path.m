function p = map2path(map, ds)
n = 0;
for i = 1 : numel(map)
    if isinf(map(i).radius)
        map(i).angle = 2*pi;
    end
    n = n + min(elem2angle(map(i).radius, ds, map(i).angle), ceil(map(i).length/ds));
end
r = zeros(1, n);
n = 0;
for i = 1 : numel(map)
    [m, R] = elem2angle(map(i).radius, ds, map(i).angle);
    m = min(m, ceil(map(i).length/ds));
    r(n+(1:m)) = R;
    n = n + m;
end
p = radius2path(r, ds);
