function GXtest=Val_interpolation(Ltttest,Lngtest,Ltttrain,Lngtrain,tri,GXtrain,K)

p=length(Ltttest);
n=size(GXtrain,1);
GXtest=zeros(n,p);



idtrain=[Lngtrain,Ltttrain];
Areatrain=abs(Lngtrain(tri(:,1)).*Ltttrain(tri(:,2))+Lngtrain(tri(:,2)).*Ltttrain(tri(:,3))+Lngtrain(tri(:,3)).*Ltttrain(tri(:,1))-Lngtrain(tri(:,2)).*Ltttrain(tri(:,1))-Lngtrain(tri(:,3)).*Ltttrain(tri(:,2))-Lngtrain(tri(:,1)).*Ltttrain(tri(:,3)))/2;
    
for i=1:p
    id0=[Lngtest(i),Ltttest(i)];  %coordinate of new site
    Areatest=abs(Lngtrain(tri(:,1)).*Ltttrain(tri(:,2))+Lngtrain(tri(:,2))*Ltttest(i)+Lngtest(i)*Ltttrain(tri(:,1))-Lngtrain(tri(:,2)).*Ltttrain(tri(:,1))-Lngtest(i)*Ltttrain(tri(:,2))-Lngtrain(tri(:,1))*Ltttest(i))/2+abs(Lngtrain(tri(:,1))*Ltttest(i)+Lngtest(i)*Ltttrain(tri(:,3))+Lngtrain(tri(:,3)).*Ltttrain(tri(:,1))-Lngtest(i)*Ltttrain(tri(:,1))-Lngtrain(tri(:,3))*Ltttest(i)-Lngtrain(tri(:,1)).*Ltttrain(tri(:,3)))/2+abs(Lngtest(i)*Ltttrain(tri(:,2))+Lngtrain(tri(:,2)).*Ltttrain(tri(:,3))+Lngtrain(tri(:,3))*Ltttest(i)-Lngtrain(tri(:,2))*Ltttest(i)-Lngtrain(tri(:,3)).*Ltttrain(tri(:,2))-Lngtest(i)*Ltttrain(tri(:,3)))/2;
    [~,q]=min(abs(Areatest-Areatrain));
    id1=idtrain(tri(q,1),:);
    id2=idtrain(tri(q,2),:);
    id3=idtrain(tri(q,3),:);
    alpha12=abs(K(tri(q,1),tri(q,2)))*sum((id1-id2).^2);
    alpha23=abs(K(tri(q,2),tri(q,3)))*sum((id2-id3).^2);
    alpha31=abs(K(tri(q,3),tri(q,1)))*sum((id3-id1).^2);
    alpha1=alpha12+(alpha31-alpha12)*real(acos(dot(id2-id1,id0-id1)/norm(id2-id1)/norm(id0-id1)))/real(acos(dot(id2-id1,id3-id1)/norm(id2-id1)/norm(id3-id1)));
    alpha2=alpha23+(alpha12-alpha23)*real(acos(dot(id3-id2,id0-id2)/norm(id3-id2)/norm(id0-id2)))/real(acos(dot(id3-id2,id1-id2)/norm(id3-id2)/norm(id1-id2)));
    alpha3=alpha31+(alpha23-alpha31)*real(acos(dot(id1-id3,id0-id3)/norm(id1-id3)/norm(id0-id3)))/real(acos(dot(id1-id3,id2-id3)/norm(id1-id3)/norm(id2-id3)));
    for j=1:n
        Z1=GXtrain(j,tri(q,1));
        Z2=GXtrain(j,tri(q,2));
        Z3=GXtrain(j,tri(q,3));
        GXtest(j,i)=interpolation(Z1,Z2,Z3,id0,id1,id2,id3,alpha1,alpha2,alpha3);
        if isnan(GXtest(j,i))==1
            fprinf('nan');
        end
    end
end