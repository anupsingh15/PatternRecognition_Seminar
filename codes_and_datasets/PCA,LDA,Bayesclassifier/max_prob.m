function [max max_pos] = max_prob(x,MU,SIG,A)
 classes = size(MU,2);
 [~, prior] = prior_prob(A);
 max = 0;
 for i = 1:classes
     y = f(x,MU{i},SIG{i},prior(i));
     if(y > max) % p(W(i)|x) >P(W(j)|x)
         max = y;  %stores the max posterior prob
         max_pos = i; % stores the class for which posterio prob is max
     end
 end
end

 
 