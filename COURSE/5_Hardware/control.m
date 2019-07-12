% 7-state controller
QQ = eye(7);
RR = eye(2);
QQ(4,4) = 0.2;
K = lqrd(s4.A, s4.B, QQ, RR, Ts);