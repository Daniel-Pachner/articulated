function T = passbody(p1, p2, vehicle, i1, i2)

    n = numel(p1);
    m = numel(p2);
    nm = numel(vehicle.mark);
    T = zeros(2, 3, n);
    mark_dist = abs(vehicle.mark(i1).x - vehicle.mark(i2).x);

    for i = 1 : n
        [X, K] = closest_on_path(p2, p1(i));
        k1 = stride(p2, K, -3*mark_dist);
        k2 = stride(p2, K, +3*mark_dist);
        [s, M] = onpathatdist(p2(k1:k2), p1(i), mark_dist);
        if numel([s.x]) > 0
            if i1 < i2
                s = s(1);
            else
                s = s(end);
            end
            T(:, :, i) = linetransf(vehicle.mark(i1), vehicle.mark(i2), p1(i), s);
        else
            T(:, :, i) = NaN;
        end
    end
end
