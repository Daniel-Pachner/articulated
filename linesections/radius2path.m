function p = radius2path(r, ds)
    n = numel(r);
    x = zeros(1, n+2);
    y = zeros(1, n+2);
    x(2) = ds;
    P = pi/2;
    for i = 3 : n+2
        a = atan(ds/r(i-2));
        R = [cos(a), -sin(a); sin(a), cos(a)];
        v = [x(i-1); y(i-1)] + R*[x(i-1)-x(i-2); y(i-1)-y(i-2)];
        x(i) = v(1);
        y(i) = v(2);
    end
    p = pointpath(x, y);
end

