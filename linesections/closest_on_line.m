function X = closest_on_line(line, P)
    B = [line(2).x; line(2).y];
    A = [line(1).x; line(1).y];
    C = [P.x; P.y];
    tau =  ((B - A)' * (C - A)) / ((B - A)' * (B - A));
    X = point(A(1) + tau*(B(1) - A(1)), A(2) + tau*(B(2) - A(2)));
end
