function q = resamplepath(p, ds)
    S = p(numel(p)).s;
    for pass = 1 : 2
        i = 0;
        while true
            i = i + 1;
            s_now = min((i-1)*ds, S);
            [s, il, ir] = pointonpath(p, s_now);
            if pass == 2
                q(i) = s;
                q(i).s = s_now;
            end
            if s_now >= S
                break;
            end
        end
        if pass == 1
            x = zeros(1, i);
            y = zeros(1, i);
            q = pointpath(x, y);
        end
    end
end

