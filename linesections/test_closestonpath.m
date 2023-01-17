map = struct(...
'radius', {inf, 20, inf, -10, inf}, ...
'angle', {0, pi/2, 0, -pi/2, 0}, ...
'length', {10, inf, 10, inf, 10});

p = map2path(map, 5);
q = pointpath(23, 30);

[closest, K] = closest_on_path(p, q);

figure
plotpath(p, 'k-')
hold on
plotpath(q, 'ro', 'markerfacecolor', 'r')
plotpath(p(K:K+1), 'b', 'linewidth', 4)
plotpath(closest, 'co', 'markerfacecolor', 'c')

D = norm([closest.x - q.x; closest.y - q.y]);
phi = linspace(-pi, pi, 100);
x = q.x + D*cos(phi);
y = q.y + D*sin(phi);

plot(x, y, 'r:')
