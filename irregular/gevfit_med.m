function [G,S,L]=gevfit_med(X0)


%med method to estimate the parameters in GEV distribution
%Choo Zheng, Yu Hang, Mar.2012
%#codegen

X=sort(X0);
n=length(X);
Gall=zeros(n-2,1);
Sall=zeros(n-2,1);
Lall=zeros(n-2,1);
%syms k
D1=X(1)-X(n);
A1=log((1-0.35)/n)/log((n-0.35)/n);

for i=2:n-1
    Di=X(i)-X(n);    
    if Di==0
        Di=-1e-4;
    end
    Ai=log((i-0.35)/n)/log((n-0.35)/n);    
    Gall(i-1)=bisection(Ai,A1,Di,D1); %double(solve((1-Ai^k)/(1-A1^k)-Di/D1));
    Sall(i-1)=Gall(i-1)*(X(1)-X(n))/((-log((n-0.35)/n))^Gall(i-1)-(-log((1-0.35)/n))^Gall(i-1));
    Lall(i-1)=X(1)-Sall(i-1)*(1-(-log((1-0.35)/n))^Gall(i-1))/Gall(i-1);
%      if isempty(Gtemp)==0
%          Gall(i-1)=Gtemp;
%          Sall(i-1)=Gall(i-1)*(X(1)-X(n))/((-log((n-0.35)/n))^Gall(i-1)-(-log((1-0.35)/n))^Gall(i-1));
%          Lall(i-1)=X(1)-Sall(i-1)*(1-(-log((1-0.35)/n))^Gall(i-1))/Gall(i-1);
%      else
%          Gall(i-1)=0;
%          Sall(i-1)=(X(1)-X(i))/(log(-log((i-0.35)/n))-log(-log((1-0.35)/n)));
%          Lall(i-1)=X(1)+Sall(i-1)*log(-log((1-0.35)/n));
%      end
end

G=median(-Gall);
S=median(Sall);
L=median(Lall);
    
    
    
    
