function X = closest_on_path(p, A)
    n = numel(p);
    D = Inf;
    for k = [1, n]
        d = sqrt((A.x - p(k).x)^2 + (A.y - p(k).x)^2);
        if d < D
            D = d;
            X = p(k);
        end
    end

    for k = 2 : n
        v = point2line(A, p(k - 1), p(k));
        if sign(v(1)) ~= sign(v(2))
            X = closest_on_line(p(k-1 : k), A);
            break;
        elseif k > 2 && s ~=sign(v(1))
            X = p(k - 1);
        end
        s = sign(v(1));
    end
end
