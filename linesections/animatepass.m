function [hb, hc] = animatepass(vehicle, T, t, hb, hc, range, varargin)

    if isempty(range)
        range = 1 : size(T, 3);
    end

    for i = range
        contour_actual = transfpath(vehicle.contour, T(:, :, i));
        mark_actual = transfpath(vehicle.mark, T(:, :, i));
        if isempty(hb)
            hb = patch([contour_actual([1:end, 1]).x], [contour_actual([1:end, 1]).y], ...
            varargin{:});
            hc = plotpath(mark_actual, 'o', 'markersize', 3);
            C = get(hb, 'facecolor');
            set(hb, 'edgecolor', C);
            set(hc, 'color', (0+C)/2);
            set(hc, 'markerfacecolor', (0+C)/2);
            if t > 0
                pause(t);
            end
        else
            set(hb, 'xdata', [contour_actual([1:end, 1]).x], 'ydata', [contour_actual([1:end, 1]).y]);
            set(hc, 'xdata', [mark_actual.x], 'ydata', [mark_actual.y]);
            if t > 0
                pause(t);
            end
        end
    end
end


