% Enable developer mode
try
    dev = ToolboxDev(pwd)
    fprintf('   Dev: %s v%s (%s)\n\n', dev.ext.name, dev.vp, dev.ext.root)
catch
    error('Install <a href="https://github.com/ETMC-Exponenta/ToolboxExtender">Toolbox Extender</a> first')
end