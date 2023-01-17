 function hx = plotoccupiedarea(R, varargin)
    n = size(R, 1);
    for k = 1 : n
        hx = patch([R(k, [1,2,3,4,1]).x], [R(k, [1,2,3,4,1]).y], [0.5, 1.0, 1.0], ...
        varargin{:});
        c = get(hx, 'facecolor');
        set(hx, 'edgecolor', c);
    end
 end

