load('ex7faces.mat');
sum = 0;
%feature normalization
mu = mean(X);
X_norm = bsxfun(@minus, X, mu);
sigma = std(X);
X_norm = bsxfun(@rdivide, X_norm, sigma);

%PCA 
Sigma = (X_norm' * X_norm)*(1/m);
[U, S, V] = svd(Sigma);
fprintf('Top eigenvector:\n'); 
fprintf('Program paused. Press enter to continue\n');
pause;
% selecting optimum no. of reduced dimensions
for i = 1:size(X,2)
    for j = 1:i
        sum = sum + S(j,j);
    end
    sum = 1- (sum/trace(S));
    if(sum <= 0.01)
        k = i;
        break
    end
end
fprintf('Reduced no. of dimensions required: %d\n', k);
U_reduced = U(:,1:k);
Z = zeros(m,k);
Z = X_norm * U_reduced;
Xaprrox = Z * U_reduced'; 



        
    