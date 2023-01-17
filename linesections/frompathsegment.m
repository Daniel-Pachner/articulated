% Returns vector perpendicular to the path segment 
% p(i) -> p(j) pointing to the right.
function w = frompathsegment(p, i, j)
    w = [p(j).y - p(i).y, -(p(j).x - p(i).x), 0.0];
    w = w / norm(w);
    w(3) = -sum(w .* [p(i).x, p(i).y, 0.0]);
end
