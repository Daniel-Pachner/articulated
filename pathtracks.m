function [pl, pr] = pathtracks(p, g = 1.435)
    pr = p;
    pl = p;
    g2 = g/2;
    for k = 1 : numel(p)
        [v, b] = frompath(p, p(k).s);
        pl(k).x = p(k).x - v(1)*g2;
        pr(k).x = p(k).x + v(1)*g2; 
        pl(k).y = p(k).y - v(2)*g2;
        pr(k).y = p(k).y + v(2)*g2;
    end
end
