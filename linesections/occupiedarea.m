 function R = occupiedarea(p, dl, dr)
    n = numel(p);
    a = pointpath(zeros(1, 4), zeros(1, 4));
    b = pointpath(zeros(1, 4), zeros(1, 4));
    c = pointpath(zeros(1, 2), zeros(1, 2));

    R = pointpath(zeros(n, 4), zeros(n, 4));

    for k = 1 : n - 1


        K = [k - 1, k];
        K = K + max(0, 1 - min(K));
        L = [k + 1, k + 2];
        L = L - max(0, max(L) - n);

        v0 = frompathsegment(p, K(1), K(2));
        v1 = frompathsegment(p, k, k + 1);
        v2 = frompathsegment(p, L(1), L(2));

        a(1).x = p(k).x + v1(1)*dr(k);
        a(1).y = p(k).y + v1(2)*dr(k);
        a(2).x = p(k+1).x + v1(1)*dr(k);
        a(2).y = p(k+1).y + v1(2)*dr(k);

        a(4).x = p(k).x + v1(1)*dl(k);
        a(4).y = p(k).y + v1(2)*dl(k);
        a(3).x = p(k+1).x + v1(1)*dl(k);
        a(3).y = p(k+1).y + v1(2)*dl(k);

        c(1).x = p(k).x + 0.5*(v1(1) + v0(1));
        c(1).y = p(k).y + 0.5*(v1(2) + v0(2));
        c(2).x = p(k+1).x + 0.5*(v1(1) + v2(1));
        c(2).y = p(k+1).y + 0.5*(v1(2) + v2(2));

        [b(1), b(2)] = cut2cone(a(1), a(2), p, k, false, true);
        [b(4), b(3)] = cut2cone(a(4), a(3), p, k, false, true);

        if any(isnan([b(1).x, b(2).x, b(1).y, b(2).y]))
            [vertex, s1, s2] = lineintersection(p(k), c(1), p(k+1), c(2));
            b(1) = vertex;
            b(2) = vertex;
        end
        if any(isnan([b(3).x, b(4).x, b(3).y, b(4).y]))
            [vertex, s1, s2] = lineintersection(p(k), c(1), p(k+1), c(2));
            b(3) = vertex;
            b(4) = vertex;
        end

        R(k, :) = b;
    end
 end

