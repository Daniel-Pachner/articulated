function [s, header] = readfcsv(fname, columns, fmts = '', ...
    noheader = false, uselowcase = true, filemustexist = true)

    if ~noheader
        header = read_csvheader(fname, filemustexist);
    else
        header = columns;
    end
    formats = zeros(2, numel(header));
    formats(1, :) = '%';
    formats(2, :) = 's';

    for i = 1 : numel(fmts)
        formats(2, i) = fmts(i);
    end

    f = fopen(fname, 'rt');
    if f < 0 && filemustexist
        error(sprintf('%s does not exist\n', fname));
    elseif f > 0
        if ~noheader
            skipped_header = textscan(f, '%s\n', 1, 'Delimiter', '');
        end
        data = textscan(f, char(formats(:)'), 'Delimiter', ';', 'Whitespace', '');
        fclose(f);
    else
        header = columns;
        nc = numel(header);
        data = cell(1, nc);
        for i = 1 : nc
            data{i} = cell(0, 1);
        end
    end

    s = csvdata2struct(data, columns, header, uselowcase);
end
