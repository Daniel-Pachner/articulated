close all

L = 14.00;
W = 2.46;

contour = pointpath([], []);
mark = pointpath([0, 1.*L, .5*L], [0, 0, -W]/2);
triangleL = struct('contour', contour, 'mark', mark);

contour = pointpath([], []);
mark = pointpath([0, 1*L, -0.1*L], [0, 0, W]/2);
%%mark = pointpath([0, 1*L, 1.1*L], [0, 0, W]/2);
triangleR = struct('contour', contour, 'mark', mark);

figure
subplot(1, 2, 1)
plotoccupiedarea(R, 'facecolor', [.7, .7, .7]);
hold on

T_triangleL = passbody(pc, pc, triangleL, 1, 2);
T_triangleR = passbody(pc, pc, triangleR, 1, 2);

markpath_triangleL = passmarks(T_triangleL, triangleL);
markpath_triangleR = passmarks(T_triangleR, triangleR);

plotpath(markpath_triangleL(3, :), 'b-');
plotpath(markpath_triangleR(3, :), 'r-');

n = numel(pc);
Ll = nan(1, n);
Lr = nan(1, n);
Llk = nan(1, n);
Lrk = nan(1, n);
for i = 1 : n-1
    a = markpath_triangleL(3, i);
    [x, k] = closest_on_path(pc, a);
    if i == 1
        hx = plotpath(x, 'ro');
    else
        set(hx, 'xdata', x.x, 'ydata', x.y);
    end
    if k > 1 && k < n
        Ll(i) = -norm([x.x - a.x, x.y - a.y]);
        Llk(i) = k;
    end

    a = markpath_triangleR(3, i);
    [x, k] = closest_on_path(pc, a);
    if k > 1 && k < n
        Lr(i) = norm([x.x - a.x, x.y - a.y]);
        Lrk(i) = k;
    end
    pause(0.01);
end

subplot(2, 2, 2)
plot(dl, 'k-');
hold on;
plot(Llk, Ll, 'r-')

subplot(2, 2, 4)
plot(dr, 'k-');
hold on;
plot(Lrk, Lr, 'r-')

