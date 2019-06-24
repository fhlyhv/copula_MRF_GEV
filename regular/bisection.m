function kopt=bisection(Ai,A1,Di,D1)

%#codegen

D=Di/D1;
if D==1;
    D=D-1e-4;
end
A=log(Ai)/log(A1);


if D<A
    k0=0;
    kh=log(D)/log(Ai/A1);
    while 1
        knew=(k0+kh)/2;
        hnew=(1-Ai^knew)/(1-A1^knew)-D;
        if abs(hnew)<1e-4
            break;
        elseif hnew>0
            k0=knew;
        else
            kh=knew;
        end
    end
else
    k0=log(1-D)/log(Ai);
    kh=0;
    while 1
        knew=(k0+kh)/2;
        hnew=(1-Ai^knew)/(1-A1^knew)-D;
        if abs(hnew)<1e-4
            break;
        elseif hnew>0
            k0=knew;
        else
            kh=knew;
        end
    end
end

kopt=knew;
        