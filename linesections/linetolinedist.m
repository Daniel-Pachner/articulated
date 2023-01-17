% Caculates the maximum distance d from line [a, b] to line [x, y] The distance
% is measured perpendicularly to [a, b]. A flag "found" indicates whether such
% distance is defined (along this perpendicular direction). If it exists, the
% most distant point z on [x, y] is also returned. A character "side" is either
% "l" or "r" depending whether the point "z" is on the left/right hand side of
% somene walking from a towards b. When z is to the left, the value of d < 0,
% and d > 0 when z is to the right.
function [d, found, z, side] = linetolinedist(a, b, x, y)
    if any(isnan([x.x, x.y, y.x, y.y]))
        d = 0;
        found = false;
        z = pointpath(NaN, NaN);
        size = '?';
    end
    n = [b.y-a.y, a.x-b.x]; % [b, a] rotated 90d to the right
    m = [x.x-y.x, x.y-y.y]; % [x, y] rorated 90d to the left
    n = n / norm(n);
    m = m / norm(m);
    d = zeros(1, 4);
    found = false(1, 4);
    z = pointpath(d, d);
    [d(1), found(1), z(1)] = ab2x(a, b, x, n);
    [d(2), found(2), z(2)] = ab2x(a, b, y, n);
    if abs(m * n') <= (1 - 1e-4)
        [d(3), found(3), z(3)] = xy2a(x, y, a, n);
        [d(4), found(4), z(4)] = xy2a(x, y, b, n);
    end
    [~, j] = max(abs(d));
    d = d(j);
    z = z(j);
    found = found(j);
    if d > 0
        side = 'r';
    elseif d < 0
        side = 'l';
    else
        side = '?';
    end
end

function [d, found, z] = ab2x(a, b, x, n)
    A = [
    -1,     0,      b.x-a.x,    0;
    +0,    -1,      b.y-a.y,    0;
    +1,     0,      0,          n(1);
    +0,    +1,      0,          n(2)];
    b = [-a.x; -a.y; x.x; x.y];
    s = A \ b;
    found = (s(3) <= 1 && s(3) >= 0);
    if found
        d = s(4);
    else
        d = 0;
    end
    z = x;
end

function [d, found, z] = xy2a(x, y, a, n)
    A = [
    -1,     0,      y.x-x.x,    0;
    +0,    -1,      y.y-x.y,    0;
    +1,     0,      0,          n(1);
    +0,    +1,      0,          n(2)];
    b = [-x.x; -x.y; a.x; a.y];
    s = A \ b;
    found = (s(3) <= 1 && s(3) >= 0);
    if found
        d = -s(4);
    else
        d = 0;
    end
    z = pointpath(s(1), s(2));
end
