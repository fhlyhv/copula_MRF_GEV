function GXtest=Val_interpolation(Ltt,Lng,GXDat,K,s1)


p=length(Ltt);
n=size(GXDat,1);
GXtest=zeros(n,p);


for i=1:n 
    Z=GXDat(i,:);
    for j=1:p
        id0=[Ltt(j),Lng(j)];  %coordinate of new site
        id1=[floor(Ltt(j)),floor(Lng(j))];
        id2=[ceil(Ltt(j)),floor(Lng(j))];
        id3=[ceil(Ltt(j)),ceil(Lng(j))];
        id4=[floor(Ltt(j)),ceil(Lng(j))];
        Z1=Z(id1(1)+s1*(id1(2)-1));
        Z2=Z(id2(1)+s1*(id2(2)-1));
        Z3=Z(id3(1)+s1*(id3(2)-1));
        Z4=Z(id4(1)+s1*(id4(2)-1));
        alpha12=-K(id1(1)+s1*(id1(2)-1),id2(1)+s1*(id2(2)-1));
        alpha23=-K(id2(1)+s1*(id2(2)-1),id3(1)+s1*(id3(2)-1));
        alpha34=-K(id3(1)+s1*(id3(2)-1),id4(1)+s1*(id4(2)-1));
        alpha41=-K(id4(1)+s1*(id4(2)-1),id1(1)+s1*(id1(2)-1));
        
        alpha1=alpha12+2*(alpha41-alpha12)*atan((id0(2)-id1(2))/(id0(1)-id1(1)))/pi;
        alpha2=alpha23+2*(alpha12-alpha23)*atan((id2(1)-id0(1))/(id0(2)-id2(2)))/pi;
        alpha3=alpha34+2*(alpha23-alpha34)*atan((id3(2)-id0(2))/(id3(1)-id0(1)))/pi;
        alpha4=alpha41+2*(alpha34-alpha41)*atan((id0(1)-id4(1))/(id4(2)-id0(2)))/pi;
        
        GXtest(i,j)=interpolation(Z1,Z2,Z3,Z4,id0,id1,id2,id3,id4,alpha1,alpha2,alpha3,alpha4);
    end
end