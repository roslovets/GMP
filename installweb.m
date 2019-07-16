instvar.URL = 'https://github.com/roslovets/GMP/archive/master.zip';
instvar.Name = 'GMP';
% Main routine
fprintf('Downloading %s...\n', instvar.Name);
websave(instvar.Name, instvar.URL);
disp('Installing...')
disp('Download complete, installing...')
instvar.Fs = unzip(instvar.Name);
instvar.DName = instvar.Fs{1}(1:end-1);
movefile(instvar.DName, instvar.Name);
cd(instvar.Name)
disp('Install complete, have fun!')
clear instvar
% Post-install tasks
open('GYROBOY.prj')