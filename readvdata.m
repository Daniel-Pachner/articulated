function vdata = readvdata(fname)
    f = fopen(fname, 'r');

    [~, key] = readtomark(f, 10);
    while true
        if isempty(key)
            break;
        end
        %fprintf('key = %s\n', key);
        [data, nextkey, i] = readtomark(f, 50);
        switch key
            case 'marks'
                data = reshape(data(1:i), 3, fix(i/3));
                type = data(2, :);
                dim = data(3, :);
                marks = struct('dim', num2cell(dim), 'type', num2cell(type));
            case 'unit'
                n = data(1);
                m = fix(i/2);
                data = reshape(data(2:i), 2, m);
                x = data(1, [2:m, m:-1:2, 2]);
                y = 0.5*data(2, [2:m, m:-1:2, 2]);
                y([m : 2*(m-1)]) = -y([m : 2*(m-1)]);
                a = data(1, 1);
                b = data(2, 1);
                units(n) = struct('x', x, 'y', y, 'a', a, 'b', b);
            otherwise
                fprintf('key = %s not known\n', key);
        endswitch
        key = nextkey;
    end
    vdata = struct('marks', marks, 'units', units);
    fclose(f);
end



