
load('data.mat');
load('testdata.mat');
[S1 S2 S3] = class_cov_matrix(X);
[MU COV]= class_cond_prob(X);
x = input('input your test example: ');

fprintf('CASE 1: SIGMA(i) = VARIANCE*IDENTITY\n')
[prob class] = max_prob(x,MU,S1,X);
fprintf('actual class: %c\n', char(64+x(1,1)));
fprintf('predicted class: %c\n', char(64+class));
fprintf('Program paused. Press enter to continue\n');
pause;

fprintf('CASE 2: SIGMA(i) = SIGMA\n')
[prob class] = max_prob(x,MU,S2,X);
fprintf('actual class: %c\n', char(64+x(1,1)));
fprintf('predicted class: %c\n', char(64+class));
fprintf('Program paused. Press enter to continue\n');
pause;

fprintf('CASE 3: SIGMA(i) = ARBITRARY SIGMA\n')
[prob class] = max_prob(x,MU,S3,X);
fprintf('actual class: %c\n', char(64+x(1,1)));
fprintf('predicted class: %c\n', char(64+class));
fprintf('Program paused. Press enter to continue\n');
pause;

