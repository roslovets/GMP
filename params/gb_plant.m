%% Load parameters
gb_params;
%% Helping variables
alpha = n * Kt / Rm;
beta = n * Kt * Kb / Rm + fm;
E = [(2*m+M)*R^2 + 2*Jw + 2*n^2*Jm   M*L*R - 2*n^2*Jm;
      M*L*R - 2*n^2*Jm               M*L^2 + Jpsi + 2*n^2*Jm];
F = 2*[beta+fw   -beta; 
       -beta     beta];
G = [0   0; 
     0  -M*g*L];
H = [alpha   alpha; 
    -alpha  -alpha];
I = m * W^2 / 2 + Jphi + (Jw + n^2 * Jm) * W^2 / (2 * R^2);
J = W^2 / (2 * R^2) * (beta + fw);
K = W / (2 * R) * alpha;
%% State space matrices
A1 = [0 0   1 0;
	  0 0   0 1;
     -E\G  -E\F]; 
B1 = [0 0;
	  0 0;
	  E\H];
C1 = eye(4);
D1 = zeros(4, 2);
A2 = [0   1
	  0  -J/I];
B2 = [0    0
	 -K/I  K/I];
C2 = eye(2);
D2 = zeros(2);
%% State space models
s1 = ss(A1, B1, C1, D1);
s1.StateName = {'theta', 'psi', 'theta_dot', 'psi_dot'};
s1.InputName = {'Vl', 'Vr'};
s1.OutputName = {'theta', 'psi', 'theta_dot', 'psi_dot'};
s2 = ss(A2, B2, C2, D2);
s2.StateName = {'phi', 'phi_dot'};
s2.InputName = {'Vl', 'Vr'};
s2.OutputName = {'phi', 'phi_dot'};
%% Add a fifth state - integral of theta
s0 = ss(1/tf('s'));
s0.StateName = 'theta_int';
s0.OutputName = 'theta_int';
s3 = append(s0, s1);
s3.A(1, 2) = 1;
s3(:, 1) = [];
%% Add phi and phi_dot states (from s2 system)
s4 = append(s3, s2);
s4.B(end, [1 2]) = s4.B(end, [3 4]);
s4(:, [3 4]) = [];