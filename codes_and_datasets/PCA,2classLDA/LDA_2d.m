
% Loading and plotting data
fprintf('Visualizing example dataset for PCA\n\n');
fprintf('Program paused. Press enter to continue\n');
pause;
hold on;
load('1.mat');
scatter(A(:,1), A(:,2),25,'bo','filled');
load('2.mat');
scatter(B(:,1), B(:,2),'r','filled');
axis square;

m1 = mean(A);
m2 = mean(B);
mu = (m1 + m2)/2;
X = bsxfun(@minus, A, m1);
Y = bsxfun(@minus, B, m2);
S1 = zeros(size(A,2));
S2 = zeros(size(B,2));
%scatter of samples within each class
for i = 1:size(A,1)
    S1 = S1 + (X(i,:)' * X(i,:));
    S2 = S2 + (Y(i,:)' * Y(i,:));
end

SW = S1+S2; %total within class scatter matrix
W = inv(SW)*(m1'-m2'); %eigen vector
fprintf('Running LDA on example dataset');
fprintf('Top eigenvector: %f %f\n', W(1,1),W(2,1));
fprintf('Program paused. Press enter to continue\n');
pause;
drawLine(mu, mu +  75*W', '-k', 'LineWidth', 2);    
hold off;
