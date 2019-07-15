function ev3_ping
ip = getpref('MathWorks_LEGO_EV3', 'DEFAULT_IP_ADDRESS');
system("ping " + ip)