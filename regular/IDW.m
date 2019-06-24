

GXIDW=zeros(n,length(Lngtest));

for i=1:n
    GXIDW(i,:)=Prm_interpolation(Ltttest,Lngtest,GXtrain(i,:),(sum(sum(K))-sum(diag(K)))/2/480,s1);
end

XIDW=gevinv(normcdf(GXIDW),repmat(Gtest,n,1),repmat(Stest,n,1),repmat(Ltest,n,1));

MAE_IDW=sum(sum(abs(Xtrue-XIDW)))/400/315
MSE_IDW=sum(sum((Xtrue-XIDW).^2))/400/315