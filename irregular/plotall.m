PkHs=[Xtrain,Xfake];

Pk=PkHs(150,:);

Ltt=[Ltttrain;Ltttest];
Lng=[Lngtrain;Lngtest];

PkHs2=(max(Pk)+1)*ones(max(Ltt),max(Lng));



[row,col]=size(PkHs2);

for i=1:row
    ii=row+1-i;
    for j=1:col
        if sum(Ltt==i&Lng==j)~=0
            PkHs2(ii,j)=Pk(Ltt==i&Lng==j);
        end
    end
end

figure; imagesc(PkHs2);hold on; contour(PkHs2,'k','LineWidth',2); colorbar;