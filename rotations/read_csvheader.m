function [header, i] = read_csvheader(fname, filemustexist = true)
    f = fopen(fname, 'rt', 'native', 'UTF-8');
    if f < 0 && filemustexist
        error(sprintf('%s does not exist\n', fname));
    elseif f > 0
        header = cell(1, 10);
        linestr = textscan(f, '%s\n', 1, 'Whitespace', '');
        fclose(f);
        header = textscan(linestr{1}{1}, '%s', -1, 'Delimiter', ';');
        for i = 1 : numel(header{1})
            header{1}{i} = strtrim(header{1}{i});
        end
        header = header{1};
    else
        header = {};
    end
end
