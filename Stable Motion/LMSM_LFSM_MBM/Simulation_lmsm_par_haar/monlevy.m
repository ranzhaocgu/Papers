%%%simultion d'un levy  alpha stable sur [0,1] avec J+1 points
function [L,t]=monlevy(alpha,J)
t=linspace(0,1,J+1);
X=[0,stblrnd(alpha,0,J^(-1/alpha),0,1,length(t)-1)];
L=cumsum(X);
%plot(t,L)
end


