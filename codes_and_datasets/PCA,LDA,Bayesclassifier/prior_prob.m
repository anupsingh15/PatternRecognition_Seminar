function [p prior] = prior_prob(X)

class = unique(X(:,1));
prior = zeros(1,size(class,1));
a = []; 
p = {};

for i = 1:size(class,1)
    for j = 1:size(X,1)
        if (X(j,1) == class(i))
            a = [a j];
        end
    end
        p{i} = a; %stores points belonging to same class
        prior(i) = size(a,2)/size(X,1); %stores prior probabilty of each class
        a = [];
end
end

