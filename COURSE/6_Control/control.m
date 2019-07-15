%% for 4-state controller
RR = eye(2);
QQ = eye(4);
K4 = lqr(s1, QQ, RR);
%% for 5-state controller
RR = eye(2);
QQ = eye(5);
K5 = lqr(s3, QQ, RR);
%% for 7-state controller
QQ = eye(7);
% QQ(7,7) = 100; % uncomment, simulate and examine changes in a behaviour of robot
RR = eye(2);
K = lqr(s4, QQ, RR);