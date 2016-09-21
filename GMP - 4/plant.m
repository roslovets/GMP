% Загрузка параметров
params;
% Вспомогательные переменные
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
% Матрицы модели в пространстве состояний
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
% Создаём модели в пространстве состояний
s1 = ss(A1, B1, C1, D1);
s1.StateName = {'theta', 'psi', 'theta_dot', 'psi_dot'};
s1.InputName = {'Vl', 'Vr'};
s1.OutputName = {'theta', 'psi', 'theta_dot', 'psi_dot'};
s2 = ss(A2, B2, C2, D2);
s2.StateName = {'phi', 'phi_dot'};
s2.InputName = {'Vl', 'Vr'};
s2.OutputName = {'phi', 'phi_dot'};