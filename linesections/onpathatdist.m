% Searches for a point s on a path p, which is at distance D from
% a point c. The function returns all such points
% them and indicates their actual number.
function [s, M] = onpathatdist(p, c, D)

    if any(isnan([c.x, c.y]))
        k = [];
        s = point([], []);
        M = [];
        return;
    end


%%    L = ([p.x] - c.x).^2 + ([p.y] - c.y).^2 - D^2;
%%    k = find(...
%%    ~isnan([p(1:n-1).x]) & ...
%%    ~isnan([p(2:n).x]) & ...
%%    sign(L(1 : n-1)) ~= sign(L(2 : n))...
%%    );

    N = numel(p);
    k = sort(find(...
    ~isnan([p(1:N-1).x]) & ...
    ~isnan([p(2:N).x]) ...
    ));

    m = 2*numel(k);
    s = pointpath(zeros(1, m), zeros(1, m));
    M = zeros(1, m);

    N = 0;
    for j = 1 : numel(k)
        [a, b, n] = onlineatdist(p(k(j)), p(k(j) + 1), c, D, k(j) == 1, k(j)+1 == numel(p));
        if n > 0
            s(N + 1) = a;
            M(N + 1) = k(j);
        end
        if n > 1
            s(N + 2) = b;
            M(N + 2) = k(j);
        end
        N = N + n;
    end
    s = s(1:N);
    M = M(1:N);
end

