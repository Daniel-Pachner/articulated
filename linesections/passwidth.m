function [dl, dr] = passwidth(p, vehicle, T, dl, dr)

    line = pointpath([min([vehicle.contour.x]), max([vehicle.contour.x])], [0, 0]);
    n = size(T, 3);
    for i = 1 : n
        line_actual = transfpath(line, T(:, :, i));
        contour_actual = transfpath(vehicle.contour, T(:, :, i));
        k1 = n;
        k2 = 1;
        for j = 1 : numel(line)
            [X, K] = closest_on_path(p, line_actual(j));
            k1 = min(k1, K);
            k2 = max(k2, K);
        end
        [dl, dr] = bodyspacewidth_alt(contour_actual, p, dl, dr, ...
        k1, k2);
    end
end


