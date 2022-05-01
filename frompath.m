function [w, b] = frompath(p, h)
    [b, i, j] = pointonpath(p, h);
    w = [p(j).y - p(i).y, -(p(j).x - p(i).x), 0.0];
    w = w / norm(w);
    w(3) = -sum(w .* [b.x, b.y, 0.0]);
end