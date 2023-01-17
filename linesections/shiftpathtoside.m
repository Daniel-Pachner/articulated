function q = shiftpathtoside(p, d)
    n = numel(p);
    q = pointpath(zeros(1, 2*n-2), zeros(1, 2*n-2));
    for k = 1 : n-1
        v = frompathsegment(p, k, k + 1);
        q(2*k-1).x = p(k).x + v(1)*d(k);
        q(2*k-1).y = p(k).y + v(2)*d(k);
        q(2*k).x = p(k+1).x + v(1)*d(k);
        q(2*k).y = p(k+1).y + v(2)*d(k);
    end
end
