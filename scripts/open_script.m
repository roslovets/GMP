function open_script(fpath)
% Open script or folder from project
p = currentProject;
root = p.RootFolder;
fpath = fullfile(root, fpath);
if isfolder(fpath)
    cd(fpath);
else
    open(fpath);
end

