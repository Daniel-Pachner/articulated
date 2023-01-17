function hx = plotpath(varargin)
    if isempty(varargin{1}) || ~isaxes(varargin{1})
        hx = plotpath(gca, varargin{:});
        return;
    else
        ax = varargin{1};
        p = varargin{2};
        if nargin > 2 && isnumeric(varargin{3})
            k = varargin{3};
            plotoptions = varargin(4 : end);
        else
            k = 1;
            plotoptions = varargin(3 : end);
        end
        if k == 1
            m = size(p, 1);
            for r = m : -1 : 1
                hx(r) = plot(ax, [p(r, :).x], [p(r, :).y], plotoptions{:});
                hold(ax, 'on');
            end
            %if numel(p) > 1
            %    text(ax, [p(1).x], [p(1).y], '.', 'backgroundcolor', 'y');
            %    text(ax, [p(end).x], [p(end).y], '>', 'backgroundcolor', 'y');
            %end
        elseif k == 2
            m = size(p, 1);
            for r = m : -1 : 1
                [pl, pr] = pathtracks(p(r, :));
                hx(r, 2) = plotpath(ax, pr, 1, plotoptions{:});
                hold(ax, 'on');
                hx(r, 1) = plotpath(ax, pl, 1, plotoptions{:});
            end
        else
            error('plotpath: wrong number of tracks');
        end
    end
    axis(ax, 'equal')
end

