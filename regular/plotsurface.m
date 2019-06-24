[col,row]=meshgrid(1:s2,1:s1);
Ltt=row(:);
Lng=col(:);


figure; surf(col,row,reshape(Xtrain(150,1:256),16,16));
xlabel('longitude','fontsize',14);
ylabel('latitude','fontsize',14);
zlabel('waveheight','fontsize',14);
% figure; surf(col,row,reshape(Ltrain(1:256),16,16));
% xlabel('longitude','fontsize',14);
% ylabel('latitude','fontsize',14);
% zlabel('location parameter \mu','fontsize',14);
% figure; surf(col,row,reshape(Strain(1:256),16,16));
% xlabel('longitude','fontsize',14);
% ylabel('latitude','fontsize',14);
% zlabel('scale parameter \sigma','fontsize',14);