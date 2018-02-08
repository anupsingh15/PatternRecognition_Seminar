function p = classwise_data()

load('data.mat');
class = unique(X(:,1));
p = {};
a = [];
for i = 1:size(class,1)
    for j = 1:size(X,1)
        if (X(j,1) == class(i))
            a = [a j];
        end
    end
        p{i} = a; %stores examples belonging to the same class
        a = [];
end
end