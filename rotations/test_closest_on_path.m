close all;

t = linspace(0.1, 0.9, 12);
p = pointpath(t, t.^3);
A = point(0.5, 0.1);
X = closest_on_path(p, A);

ax = plotpath([], p, 1, '-o');
hold(ax, 'on')
ha = plot(ax, A.x, A.y, 'o', 'linewidth', 2);
hx = plot(ax, X.x, X.y, 'o', 'linewidth', 2);

for s = linspace(0, 1, 100)
    A = point(s, s^3 - 0.1);
    X = closest_on_path(p, A);
    set(ha, 'xdata', A.x, 'ydata', A.y)
    set(hx, 'xdata', X.x, 'ydata', X.y)
    pause(0.05)
end
for s = linspace(1, 0, 100)
    A = point(s, s^3 + 0.1);
    X = closest_on_path(p, A);
    set(ha, 'xdata', A.x, 'ydata', A.y)
    set(hx, 'xdata', X.x, 'ydata', X.y)
    pause(0.05)
end


