function markpass(vehicle, T, range, varargin)

    if isempty(range)
        range = 1 : size(T, 3);
    end

    for i = range
        contour_actual = transfpath(vehicle.contour, T(:, :, i));
        plot([contour_actual([1:end, 1]).x], [contour_actual([1:end, 1]).y], ...
        varargin{:});
    end
end


