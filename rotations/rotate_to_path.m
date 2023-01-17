function [A, alpha] = rotate_to_path(p, A, S)
    alpha = 0;
    for i = 1 : 10
        X = closest_on_path(p, A);
        phi = myangle(X.x - S.x, X.y - S.y) - myangle(A.x - S.x, A.y - S.y);
        alpha = alpha + phi;
        R = [cos(phi), -sin(phi); sin(phi), cos(phi)];
        v = [S.x; S.y] + R * [A.x - S.x; A.y - S.y];
        A = point(v(1), v(2));
        if abs(phi) < 1e-4
            break;
        end
    end
end
