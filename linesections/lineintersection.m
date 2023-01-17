function [s, t1, t2] = lineintersection(a, b, c, d)
    m = [b.x-a.x, b.y-a.y];
    n = [d.x-c.x, d.y-c.y];
    if norm(m) < 1e-4 || norm(n) < 1e-5 || any(isnan(m)) || any(isnan(n))
        s = pointpath(NaN, NaN);
        t1 = NaN;
        t2 = NaN;
    else
        m = m/norm(m);
        n = n/norm(n);
        if abs(m*n') > 1 - 1e-5
            s = pointpath(NaN, NaN);
            t1 = NaN;
            t2 = NaN;
        else
            A = [
            b.x-a.x, c.x-d.x
            b.y-a.y, c.y-d.y];
            B = [
            c.x - a.x
            c.y - a.y];

            t = A \ B;
            x = a.x + (b.x - a.x)*t(1);
            y = a.y + (b.y - a.y)*t(1);
            s = pointpath(x, y);
            t1 = t(1);
            t2 = t(2);
        end
    end
end

