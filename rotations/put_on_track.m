function b = put_on_track(p, b, i)
    n = numel(b);
    t = find(strcmpi({b.type}, 'T'));
    j = find(strcmpi({b.type}, 'J'));
    m = find(diff(t) == 1);
    x0 = b(t(m(1))).x;
    y0 = b(t(m(1))).y;
    for k = 1 : n
        b(k).x = b(k).x - x0 + p(i).x;
        b(k).y = b(k).y - y0 + p(i).y;
    end

    [~, phi] = rotate_to_path(p, b(t(m(1)+1)), b(t(m(1))));
    b = rotate_path(b, t(m(1)), 1 : n, phi);

    for it = 1 : 3
        ontrack = false(size(t));
        ontrack([m(1), m(1) + 1]) = true;
        for k = 1 : numel(j)
            if j(k) > t(m)
                next = find(t > j(k) & ~ontrack, 1, 'first');
                rotated = j(k) : n;
                ontrack(next) = true;
                [~, phi] = rotate_to_path(p, b(t(next)), b(j(k)));
                b = rotate_path(b, j(k), rotated, phi);
            else
                %next = find(t < j(k) & ~ontrack, 1, 'first');
                %rotated = j(k) : -1 : 1;
            end
        end
    end
end

