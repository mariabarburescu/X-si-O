function [T,A] = mutare_computer(T,A,computer)

%Prima data verificam daca putem castiga printr-o singura mutare
[y,T,A] = almost_win(T,A,computer);
if y == 1
    return;
endif

%Verificam daca jucatorul este pe punctul de castiga
[y,T,A] = defense(T,A,computer);
if y == 1
    return;
endif

%Daca mijlocul e liber, calculatorul il va ocupa
if A(2,2) != '-'
    A(2,2) = '-';
    T(2,3) = computer;
    return;
endif

%Daca calculatorul a ocupat mijlocul, incearca sa ocupe si colturile
if T(2,3) == computer
    if ((T(1,1) != computer && A(1,1) == '-') || (T(3,5) != computer && A(3,3) == '-'))
        if A(1,3) != '-'
            A(1,3) = '-';
            T(1,5) = computer;
            return;
        else
            if A(3,1) != '-'
                A(3,1) = '-';
                T(3,1) = computer;
                return;
            endif
        endif
    else
        if ((T(1,5) != computer && A(1,3) == '-') || (T(3,1) != computer && A(3,1) == '-'))
            if A(1,1) != '-'
                A(1,1) = '-';
                T(1,1) = computer;
                return;
            else
                if A(3,3) != '-'
                    A(3,3) = '-';
                    T(3,5) = computer;
                    return;
                endif
            endif
        endif
    endif
endif

%Daca mijlocul si colturile sunt ocupate, va incerca sa ocupe alta pozitie
k=1;
for i=1:3
    for j=1:2:5
        if T(i,j) == '_'
            A(i,k) = '-';
            T(i,j) = computer;
            return;
        endif
        k=k+1;
    endfor
    k=1;
endfor

endfunction