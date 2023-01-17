function p = rotate_path(p, i, j, phi)
    R = [cos(phi), -sin(phi); sin(phi), cos(phi)];
    for k = j
        v = R * [p(k).x - p(i).x; p(k).y - p(i).y];
        p(k).x = v(1) + p(i).x;
        p(k).y = v(2) + p(i).y;
    end
end


