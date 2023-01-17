function [dl, dr] = bodyspacewidth(body_actual, body, p, dl, dr, k1, k2)
    n = numel(p);
    for i = max(1, k2) : min(n-1, k1)
        for j = 1 : numel(body_actual) - 1
            [d, found] = linetolinedist(p(i), p(i+1), body_actual(j), body_actual(j+1));
            if found
                dl(i) = min(dl(i), d);
                dr(i) = max(dr(i), d);
            end
        end
    end
end
