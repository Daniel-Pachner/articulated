function s = csvdata2struct(data, columns, header, uselowcase = true)
    if uselowcase
        columns = lower(columns);
        header = lower(header);
    end
    nc = numel(columns);
    structdata = cell(1, 2*nc);
    j = 0;
    for i = 1 : 2 : 2*nc
        j = j + 1;
        structdata{i} = strtrim(columns{j});
        search = strcmpi(columns{j}, header);
        if any(search)
            d = data{find(search, 1, 'last')};
            if iscell(d)
                for h = 1 : numel(d)
                    if ischar(d{h})
                        d{h} = strtrim(d{h});
                    end
                end
            	structdata{i + 1} = d;
            else
                structdata{i + 1} = num2cell(d);
            end
        else
            fprintf(1, '%s column not found in csv data\n', columns{j});
        end
    end
    s = struct(structdata{:});
end
