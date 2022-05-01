function [data, key, i] = readtomark(f, N)
    data = zeros(1, N);
    i = 0;
    while true
        s = textscan(f, '%s', 1);
        if ~isempty(s) && ~isempty(s{1})
            x = str2num(s{1}{1});
        else
            x = [];
        end
        if ~isempty(s) && ~isempty(s{1}) && isempty(x)
            key = s{1}{1};
            break;
        elseif isempty(s) || isempty(s{1})
            key = '';
            break;
        else
            i = i + 1;
            data(i) = x;            
        end
    end
end
