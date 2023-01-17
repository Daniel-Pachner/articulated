% test 1

a = pointpath(0, 0);
b = pointpath(1.6, 0);
x = pointpath(0.5, 0.6);
y = pointpath(-1.0, -3.0);

figure(1);
hax = gca;
delete(get(gca, 'children'))
plotpath(hax, [a, b], 1, 'linewidth', 3, 'k');
text(hax, a.x, a.y, 'a', 'fontsize', 20, 'color', 'g', 'backgroundcolor', 'y');
text(hax, b.x, b.y, 'b', 'fontsize', 20, 'color', 'g', 'backgroundcolor', 'y');
hold(hax, 'on');
plotpath(hax, [x, y], 1, 'linewidth', 3, 'r');
text(hax, x.x, x.y, 'x', 'fontsize', 20, 'color', 'g', 'backgroundcolor', 'y');
text(hax, y.x, y.y, 'y', 'fontsize', 20, 'color', 'g', 'backgroundcolor', 'y');
title('1')

[d, found, cross, side] = linetolinedist (a, b, x, y);
if found
    plot(cross.x, cross.y, 'rp', 'markersize', 12)
    text(cross.x, cross.y, ['side ', side, ' ', num2str(d)], 'fontsize', 14);
end

% test 2

b = pointpath(0, 0);
a = pointpath(1.6, 0.5);
x = pointpath(0.5, 0.1);
y = pointpath(0.1, -1.0);

figure(2);
hax = gca;
delete(get(gca, 'children'))
plotpath(hax, [a, b], 1, 'linewidth', 3, 'k');
text(hax, a.x, a.y, 'a', 'fontsize', 20, 'color', 'g', 'backgroundcolor', 'y');
text(hax, b.x, b.y, 'b', 'fontsize', 20, 'color', 'g', 'backgroundcolor', 'y');
hold(hax, 'on');
plotpath(hax, [x, y], 1, 'linewidth', 3, 'r');
text(hax, x.x, x.y, 'x', 'fontsize', 20, 'color', 'g', 'backgroundcolor', 'y');
text(hax, y.x, y.y, 'y', 'fontsize', 20, 'color', 'g', 'backgroundcolor', 'y');
title('2')

[d, found, cross, side] = linetolinedist (a, b, x, y);
if found
    plot(cross.x, cross.y, 'rp', 'markersize', 12)
    text(cross.x, cross.y, ['side ', side, ' ', num2str(d)], 'fontsize', 14);
end

% test 3

a = pointpath(1, 0);
b = pointpath(1, 1.5);
x = pointpath(3, 1.4);
y = pointpath(3, 3);

figure(3);
hax = gca;
delete(get(gca, 'children'))
plotpath(hax, [a, b], 1, 'linewidth', 3, 'k');
text(hax, a.x, a.y, 'a', 'fontsize', 20, 'color', 'g', 'backgroundcolor', 'y');
text(hax, b.x, b.y, 'b', 'fontsize', 20, 'color', 'g', 'backgroundcolor', 'y');
hold(hax, 'on');
plotpath(hax, [x, y], 1, 'linewidth', 3, 'r');
text(hax, x.x, x.y, 'x', 'fontsize', 20, 'color', 'g', 'backgroundcolor', 'y');
text(hax, y.x, y.y, 'y', 'fontsize', 20, 'color', 'g', 'backgroundcolor', 'y');
title('3')

[d, found, cross, side] = linetolinedist (a, b, x, y);
if found || true
    plot(cross.x, cross.y, 'rp', 'markersize', 12)
    text(cross.x, cross.y, ['side ', side, ' ', num2str(d)], 'fontsize', 14);
end
