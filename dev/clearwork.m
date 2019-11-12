function clearwork()
%Clear work folder
dpath = 'work';
c = struct2table(dir(dpath), 'AsArray', 1);
if height(c) > 2
    c = c(3:end, :);
    ds = c.name(c.isdir);
    fs = c.name(~c.isdir);
    if ~isempty(ds)
        ds = fullfile(dpath, string(ds));
        for d = ds'
            try
                rmdir(d, 's');
            end
        end
    end
    if ~isempty(fs)
        fs = fullfile(dpath, string(fs));
        for f = fs'
            try
                delete(f);
            end
        end
    end
end