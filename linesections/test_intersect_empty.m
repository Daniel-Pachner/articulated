vehicle = pointpath([-1, 0, 1.1, 1, -1.1], [-1., -1., -0.5, 1, 1]);
obstacle = pointpath(1.5 + [-1.2, 0.8, 1.2, -0.8]/3, [-1, -1, 1.5, 1]/4);

close all
figure(1);
plotpath([obstacle, obstacle(1)], 'bo-', 'linewidth', 3);
hold on
hx = plotpath([vehicle, vehicle(1)], 'go-', 'linewidth', 3);

for i = 1 : 300
    dx = 0.05*cos(0.005*(i-1)*2*pi);
    dy = 0.05*sin(0.005*(i-1)*2*pi);
    vehicle = pointpath([vehicle.x] + dx, [vehicle.y] + dy);
    set(hx, 'xdata', [vehicle.x, vehicle(1).x], 'ydata', [vehicle.y, vehicle(1).y]);
    collision = rect_intersect_empty(vehicle, obstacle);
    if collision
        set(hx, 'color', 'r', 'markerfacecolor', 'r');
    else
        set(hx, 'color', 'g', 'markerfacecolor', 'g');;
    end
    drawnow;
end

