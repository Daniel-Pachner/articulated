function intersect = rect_intersect_empty(r1, r2)
    intersect = false;
    for i = 1 : numel(r1)
        intersect = intersect || point_inside(r1(i), r2, 1e-5);
    end
    for i = 1 : numel(r2)
        intersect = intersect || point_inside(r2(i), r1, 1e-5);
    end
end

