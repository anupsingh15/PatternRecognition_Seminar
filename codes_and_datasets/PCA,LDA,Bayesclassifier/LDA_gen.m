function [V D] = LDA_gen()
load('data.mat');
p = classwise_data();
classes = size(p,2);
MU = {};
X = X(:, 2:size(X,2));

MU_tot = mean(X);
SW = zeros(size(X,2));
SB = zeros(size(X,2));

%creating SW and SB matrices
for i = 1:classes
    MU{i} = mean(X(p{i},:));
    for j = 1:size(X(p{i},:),1)
        SW = SW + ((X(p{i}(j),:)-MU{i})' * (X(p{i}(j),:)-MU{i}));
    end
    SB = SB + (size(p{i},2)*(MU{i}-MU_tot)' * (MU{i}-MU_tot));
end
%Calculating eigenvectors and eigenvalues
[V D] = eig(inv(SW)*SB);
D = diag(D);
%sorting eigenvalues and corresponding eigenvectors
[D index] = sort(D,'descend');
V = V(:,index);

end




    