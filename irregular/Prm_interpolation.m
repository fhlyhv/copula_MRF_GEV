function Ztest=Prm_interpolation(Ltttest,Lngtest,Ltttrain,Lngtrain,tri,Z,alpha)

% Determine coordinate and value of Ztest's neighbours
% Yu Hang, Mar. 2012, NTU

p=length(Ltttest);

if alpha==Inf
    Ztest=Z(1)*ones(1,p);
else
    idtrain=[Lngtrain,Ltttrain];
    Areatrain=abs(Lngtrain(tri(:,1)).*Ltttrain(tri(:,2))+Lngtrain(tri(:,2)).*Ltttrain(tri(:,3))+Lngtrain(tri(:,3)).*Ltttrain(tri(:,1))-Lngtrain(tri(:,2)).*Ltttrain(tri(:,1))-Lngtrain(tri(:,3)).*Ltttrain(tri(:,2))-Lngtrain(tri(:,1)).*Ltttrain(tri(:,3)))/2;
    Ztest=zeros(1,p);
    for i=1:p
        id0=[Lngtest(i),Ltttest(i)];  %coordinate of new site
        Areatest=abs(Lngtrain(tri(:,1)).*Ltttrain(tri(:,2))+Lngtrain(tri(:,2))*Ltttest(i)+Lngtest(i)*Ltttrain(tri(:,1))-Lngtrain(tri(:,2)).*Ltttrain(tri(:,1))-Lngtest(i)*Ltttrain(tri(:,2))-Lngtrain(tri(:,1))*Ltttest(i))/2+abs(Lngtrain(tri(:,1))*Ltttest(i)+Lngtest(i)*Ltttrain(tri(:,3))+Lngtrain(tri(:,3)).*Ltttrain(tri(:,1))-Lngtest(i)*Ltttrain(tri(:,1))-Lngtrain(tri(:,3))*Ltttest(i)-Lngtrain(tri(:,1)).*Ltttrain(tri(:,3)))/2+abs(Lngtest(i)*Ltttrain(tri(:,2))+Lngtrain(tri(:,2)).*Ltttrain(tri(:,3))+Lngtrain(tri(:,3))*Ltttest(i)-Lngtrain(tri(:,2))*Ltttest(i)-Lngtrain(tri(:,3)).*Ltttrain(tri(:,2))-Lngtest(i)*Ltttrain(tri(:,3)))/2;
        [~,q]=min(abs(Areatest-Areatrain));
        id1=idtrain(tri(q,1),:);
        id2=idtrain(tri(q,2),:);
        id3=idtrain(tri(q,3),:);
        Z1=Z(tri(q,1));
        Z2=Z(tri(q,2));
        Z3=Z(tri(q,3));
        Ztest(i)=interpolation(Z1,Z2,Z3,id0,id1,id2,id3,alpha);
    end
end
        