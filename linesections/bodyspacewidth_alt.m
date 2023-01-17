function [dl, dr] = bodyspacewidth_alt(body_actual, p, dl, dr, k1, k2)
    n = numel(p);
    for i = max(1, k1) : min(n-1, k2)
        for j = 1 : numel(body_actual) - 1
            [a, b] = cut2cone(body_actual(j), body_actual(j+1), p, i, false, false);
            [dl_here, dr_here] = linetolinedist_alt(p(i), p(i+1), a, b);
            dr(i) = max(dr(i), dr_here);
            dl(i) = min(dl(i), dl_here);
        end
    end
end
