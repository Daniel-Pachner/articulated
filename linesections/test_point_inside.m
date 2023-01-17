rectangle = pointpath([-1, 1, 1, -1], [-1, -1, 1, 1]);

N = 50;
a = pointpath(randn(1, N), randn(1, N));

figure(1);
plotpath([rectangle, rectangle(1)], 'b+-');
hold on

for i = 1 : numel(a)
    isinside = point_inside(a(i), rectangle, 0.01);
    if isinside
        plotpath(a(i), 'ro', 'markerfacecolor', 'r');
    else
        plotpath(a(i), 'go', 'markerfacecolor', 'g');
    end
end
