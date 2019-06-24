function Ztest=Prm_interpolation(Ltt,Lng,Z,alpha,s1)

% Determine coordinate and value of Ztest's neighbours
% Yu Hang, Mar. 2012, NTU

p=length(Ltt);

if alpha==Inf
    Ztest=Z(1)*ones(1,p);
else
    Ztest=zeros(1,p);
    for i=1:p
        id0=[Ltt(i),Lng(i)];  %coordinate of new site
        id1=[floor(Ltt(i)),floor(Lng(i))];
        id2=[ceil(Ltt(i)),floor(Lng(i))];
        id3=[ceil(Ltt(i)),ceil(Lng(i))];
        id4=[floor(Ltt(i)),ceil(Lng(i))];
        Z1=Z(id1(1)+s1*(id1(2)-1));
        Z2=Z(id2(1)+s1*(id2(2)-1));
        Z3=Z(id3(1)+s1*(id3(2)-1));
        Z4=Z(id4(1)+s1*(id4(2)-1));
        Ztest(i)=interpolation(Z1,Z2,Z3,Z4,id0,id1,id2,id3,id4,alpha);
    end
end
        