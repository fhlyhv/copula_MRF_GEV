row=31;
col=31;
Ltt1=[Lngtrain;Ltttest];
Lng1=[Ltttrain;Lngtest];
Ltt1=2*(Ltt1-0.5);
Lng1=2*(Lng1-0.5);

PkHs2=zeros(row,col);

Pkall=[Xtrain,XMGEV];

Pk=Pkall(111,:);



for i=1:row
    ii=row+1-i;
    for j=1:col
        if sum(Ltt1==i&Lng1==j)~=0
            PkHs2(ii,j)=Pk(Ltt1==i&Lng1==j);
        end
    end
end

figure; imagesc(PkHs2);hold on; contour(PkHs2,'k','LineWidth',2); colorbar;