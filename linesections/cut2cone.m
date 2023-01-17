function [a, b] = cut2cone(r, s, p, i, doplot = false, extend = false)

    n = numel(p);
    K = [i - 1, i];
    K = K + max(0, 1 - min(K));
    L = [i + 1, i + 2];
    L = L - max(0, max(L) - n);

    v1 = frompathsegment(p, i, i+1);
    v0 = frompathsegment(p, K(1), K(2));
    v2 = frompathsegment(p, L(1), L(2));

    u = pointpath(p(i).x + 0.5*(v1(1) + v0(1)), p(i).y + 0.5*(v1(2) + v0(2)));
    v = pointpath(p(i+1).x + 0.5*(v1(1) + v2(1)), p(i+1).y + 0.5*(v1(2) + v2(2)));

    [a, b] = cutline(r, s, p(i), u, 'r', extend);
    [a, b] = cutline(a, b, p(i+1), v, 'l', extend);
    [a, b] = cutline(a, b, p(i), u, 'r', extend);
    [a, b] = cutline(a, b, p(i+1), v, 'l', extend);

    if doplot
        plotpath(gca, [p(i), u], 'r:');
        plotpath(gca, [p(i+1), v], 'r:');
        plotpath(gca, [p(i), q(3)], 'g:');
        plotpath(gca, [p(i+1), q(4)], 'g:');
    end
end

