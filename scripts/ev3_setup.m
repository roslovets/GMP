function setup_ev3
% Setup LEGO EV3 connection
s = getpref('MathWorks_LEGO_EV3');
if isempty(s)
    error('Install EV3 Support Package first')
else
    ip = s.DEFAULT_IP_ADDRESS;
    id = s.DEFAULT_HARDWARE_ID;
    res = inputdlg({'IP adress' 'Hardwre ID'}, 'Setup EV3', 1, {ip, id});
    if ~isempty(res)
        setpref('MathWorks_LEGO_EV3', 'DEFAULT_IP_ADDRESS', res{1});
        setpref('MathWorks_LEGO_EV3', 'DEFAULT_HARDWARE_ID', res{2});
    end
end
    