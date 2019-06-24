function [Shape0, Scale0, Lct0] = GEVest (XDat0)

[n p]=size(XDat0);
XDat=sort(XDat0);
Shape0=zeros(1,n);
Scale0=zeros(1,n);
Lct0=zeros(1,n);
shape=[];
scale=[];
lct=[];
syms k;

for i=1:p
    for j=2:n-1
        D=(XDat(j,i)-XDat(n,i))/(XDat(1,i)-XDat(n,i));
        A0=log((j-0.35)/n)/log((n-0.35)/n);
        A1=log((1-0.35)/n)/log((n-0.35)/n);
        sh=solve((1-A0^k)/(1-A1^k)-D);
        sc=double(sh).*(XDat(1,i)-XDat(n,i))/((-log((n-0.35)/n)).^double(sh)-(-log((1-0.35)/n)).^double(sh));
        l=XDat(1,i)-sc.*(1-(-log((1-0.35)/n)).^double(sh))./double(sh);
        shape=[shape double(sh)];
        scale=[scale sc];
        lct=[lct l];
    end
    Shape0(i)=median(shape);
    Scale0(i)=median(scale);
    Lct0(i)=median(lct);
end