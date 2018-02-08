function acc = accuracy1()
load('reduced_data.mat');
k = 0;
error = zeros(1,3);
for i = 1:10
    t = k + 1;
    k = k + size(Z,1)/10;
    index = true(size(Z,1),1);
    index(t:k) = false;
    X_train = Z(index,:);
    X_test = Z(~index,:);
    error = error + cross_val(X_train, X_test);
end
acc = 1 - error/10;