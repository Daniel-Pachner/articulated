x = [0, 1, 2, 3, 4];
y = [1, 1, 1, 1, 1];
p = pointpath(x, y);
ax = gca;
hold(ax, 'off')
plotpath(ax, p, 1, 'b-o');
q = rotate_path(p, 2, +pi/4);
q = rotate_path(q, 3, -pi/4);
q = rotate_path(q, 4, +pi/4);
hold(ax, 'on')
plotpath(ax, q, 1, 'r-o');
