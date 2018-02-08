function acc = accuracy()
load('data.mat');
k = 0;
error = zeros(1,3);
for i = 1:10
    %creating training set and test set
    t = k + 1;
    k = k + size(X,1)/10;
    index = true(size(X,1),1);
    index(t:k) = false;
    X_train = X(index,:); 
    X_test = X(~index,:);
    error = error + cross_val(X_train, X_test); %adding error for each fold
end
acc = 1 - error/10;



