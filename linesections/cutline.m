% Cuts the line [a, b] to leave only what is to the left or right from a half line
% [r, s]
function [a, b] = cutline(a, b, r, s, side, extend = false)
    n = frompathsegment([r, s], 1, 2); % rotated to the right
    aonright = n * [a.x, a.y, 1]' > 0;
    aonleft = ~aonright;
    aonwrongside = (side == 'r' && aonright) || (side == 'l' && aonleft);
    bonright = n * [b.x, b.y, 1]' > 0;
    bonleft = ~bonright;
    bonwrongside = (side == 'r' && bonright) || (side == 'l' && bonleft);

    if aonwrongside && ~bonwrongside
        [p, t1, t2] = lineintersection(a, b, r, s);
        a = p;
    elseif bonwrongside && ~aonwrongside
        [p, t1, t2] = lineintersection(a, b, r, s);
        b = p;
    elseif bonwrongside && aonwrongside
        a = pointpath(NaN, NaN);
        b = pointpath(NaN, NaN);
    elseif isnan(r.x) || isnan(r.y) || isnan(s.x) || isnan(s.y) || ...
        isnan(a.x) || isnan(a.y) || isnan(b.x) || isnan(b.y)
        a = pointpath(NaN, NaN);
        b = pointpath(NaN, NaN);
    end

    if extend && ~(bonwrongside && aonwrongside)
        [p, t1, t2] = lineintersection(a, b, r, s);
        if t1 < 0
            a = p;
        end
        if t1 > 1
            b = p;
        end
    end
end

