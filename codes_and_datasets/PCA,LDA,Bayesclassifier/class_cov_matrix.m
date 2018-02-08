function [C D E] = class_cov_matrix(X)

[class_mean class_cov] = class_cond_prob(X);
classes = size(class_mean,2);
C = {};
D = {};
E = {};
for i = 1:3
    for j = 1:classes
        if (i == 1)
            C{j} = diag(diag(cov(X(:, 2:size(X,2))))); %Sigma(i) = variance*I
        elseif(i == 2)
            D{j} = cov(X(:, 2:size(X,2))); %Sigma(i) = Sigma
        else
            E{j} = class_cov{j}; %Sigma(i) = arbitrary
        end
    end
end
end

            
            
            
            
        
                   
            
            
        
        
    