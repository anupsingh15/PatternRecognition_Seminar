function [class_mean class_cov] = class_cond_prob(X)

[p prior] = prior_prob(X);
class_mean = {};
class_cov = {}; 

for i = 1:size(p,2)
    a = X(p{i},:);
    a = a(:, 2:size(a,2));
    class_mean{i} = mean(a); %stores class means
    class_cov{i} = cov(a); % stores class covariance matrix
end
end


    
