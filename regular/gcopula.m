function GXDat = gcopula(XDat,Lh,Gh,Sh)

% Yu Hang, Mar. 2012
% It reads GEV distributed data and outputs standard Gaussian data

n=size(XDat,1);
cdfTable=gevcdf(XDat,repmat(Gh,n,1),repmat(Sh,n,1),repmat(Lh,n,1));
GXDat = norminv(cdfTable,0,1);

