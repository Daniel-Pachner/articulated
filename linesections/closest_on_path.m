function [X, K] = closest_on_path(p, A)
    n = numel(p);
    D = Inf;
    K = [];
    X = pointpath(NaN, NaN);
    for k = [1, n]
        d = sqrt((A.x - p(k).x)^2 + (A.y - p(k).y)^2);
        if d < D
            D = d;
            X = p(k);
            K = k;
        end
    end

    L = K;
    for k = 2 : n
        v = point2line(A, p(k - 1), p(k));
        if sign(v(1)) ~= sign(v(2))
            c = closest_on_line(p(k-1 : k), A);
            L = k-1;
        elseif k > 2 && s ~=sign(v(1))
            c = p(k - 1);
            L = k-1;
        end
        if L ~= K
            d = sqrt((A.x - c.x)^2 + (A.y - c.y)^2);
            if d < D
                D = d;
                X = c;
                K = L;
            end
        end
        s = sign(v(2));
    end
end
