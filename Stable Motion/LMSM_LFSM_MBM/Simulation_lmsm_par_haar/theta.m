
function [r]=theta(u,v,alpha)
r=(1+v-1/alpha)^(-1).*( ((u-1).*((u-1)>0)).^(1+v-1/alpha)-2.*((u-0.5).*((u-0.5)>0)).^(1+v-1/alpha)+((u).*(u>0)).^(1+v-1/alpha) );
end