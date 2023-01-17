function [dl, dr] = linetolinedist_alt(a, b, x, y)
    if any(isnan([x.x, x.y, y.x, y.y]))
        dl = 0;
        dr = 0;
    else
        n = frompathsegment([a, b], 1, 2);
        dx = n * [x.x, x.y, 1]';
        dy = n * [y.x, y.y, 1]';
        if dx < dy
            dl = min(0, dx);
            dr = max(0, dy);
        else
            dl = min(0, dy);
            dr = max(0, dx);
        end
    end
end
