function markpath = passmarks(T, vehicle)

    n = size(T, 3);
    nm = numel(vehicle.mark);
    markpath = pointpath(NaN(nm, n), NaN(nm, n));

    for i = 1 : n
        mark_actual = transfpath(vehicle.mark, T(:, :, i));
        markpath(:, i) = mark_actual';
        if i > 1 && ~any(isnan([mark_actual.x])) && ~any(isnan([mark_actual.y]))
            for j = 1 : nm
                markpath(j, i).s = markpath(j, i-1).s + ...
                norm([mark_actual(j).x; mark_actual(j).y] - [markpath(:, i-1).x; markpath(:, i-1).y]);
            end
        else
            for j = 1 : nm
                markpath(j, i).s = 0;
            end
        end
    end
end


