clear; close all; clc



% Loading and plotting data
fprintf('Visualizing example dataset for PCA\n\n');
load('ex7data1.mat');
[m n] = size(X);
plot(X(:,1), X(:,2), 'bo');
axis([0.5 6.5 2 8]);
axis square;
fprintf('Program paused. Press enter to continue\n');
pause;
fprintf('Running PCA on a given example dataset\n');

%feature normalization
mu = mean(X);
X_norm = bsxfun(@minus, X, mu);
sigma = std(X);
X_norm = bsxfun(@rdivide, X_norm, sigma);


%PCA 
Sigma = (X_norm' * X_norm)*(1/m);
[U, S, V] = svd(Sigma);
%plotting eigenvectors
hold on;
drawLine(mu, mu +  1.5* S(1,1) * U(:,1)', '-k', 'LineWidth', 2);
drawLine(mu, mu +  1.5* S(2,2) * U(:,2)', '-k', 'LineWidth', 2);
hold off;

fprintf('Top eigenvector: %f %f\n', U(1,1),U(1,2));
fprintf('Program paused. Press enter to continue\n');
pause;
k = 1;
U_reduced = U(:,1:k);
Z = zeros(m,k);
Z = X_norm * U_reduced;
Xaprrox = Z * U_reduced'; 



%% =============== Part 4: Loading and Visualizing Face Data =============
%  We start the exercise by first loading and visualizing the dataset.
%  The following code will load the dataset into your environment
%
fprintf('\nLoading face dataset.\n\n');

%  Load Face dataset
load ('ex7faces.mat')

%  Display the first 100 faces in the dataset
displayData(X(1:100, :));

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =========== Part 5: PCA on Face Data: Eigenfaces  ===================
%  Run PCA and visualize the eigenvectors which are in this case eigenfaces
%  We display the first 36 eigenfaces.
%
fprintf(['\nRunning PCA on face dataset.\n' ...
         '(this mght take a minute or two ...)\n\n']);

%  Before running PCA, it is important to first normalize X by subtracting 
%  the mean value from each feature
[X_norm, mu, sigma] = featureNormalize(X);

%  Run PCA
[U, S] = pca(X_norm);

%  Visualize the top 36 eigenvectors found
displayData(U(:, 1:36)');

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ============= Part 6: Dimension Reduction for Faces =================
%  Project images to the eigen space using the top k eigenvectors 
%  If you are applying a machine learning algorithm 
fprintf('\nDimension reduction for face dataset.\n\n');

K = 100;
Z = projectData(X_norm, U, K);

fprintf('The projected data Z has a size of: ')
fprintf('%d ', size(Z));

fprintf('\n\nProgram paused. Press enter to continue.\n');
pause;

%% ==== Part 7: Visualization of Faces after PCA Dimension Reduction ====
%  Project images to the eigen space using the top K eigen vectors and 
%  visualize only using those K dimensions
%  Compare to the original input, which is also displayed

fprintf('\nVisualizing the projected (reduced dimension) faces.\n\n');

K = 100;
X_rec  = recoverData(Z, U, K);

% Display normalized data
subplot(1, 2, 1);
displayData(X_norm(1:100,:));
title('Original faces');
axis square;

% Display reconstructed data from only k eigenfaces
subplot(1, 2, 2);
displayData(X_rec(1:100,:));
title('Recovered faces');
axis square;

fprintf('Program paused. Press enter to continue.\n');
pause;


