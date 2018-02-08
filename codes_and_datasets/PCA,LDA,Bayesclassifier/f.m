function y = f(x,MU,SIG,prior)
x = x(:,2:size(x,2));
d = size(x,2);
y = (exp((x-MU)*inv(SIG)*(x-MU)'*(-0.5))/((2*pi)^(d/2)*(det(SIG))^1/2))*prior; %calculates probabilty given x follows Normal distribution

end


