function [y,T,A] = almost_win(T,A,computer)

y=0;

%parcurgem liniile si vedem daca am ocupat pana acum 2 pozitii pe aceeasi linie
for i=1:3
    if (T(i,1) == computer && T(i,1) == T(i,3))
        if A(i,3) != '-'
            A(i,3) = '-';
            T(i,5) = computer;
            y=1;
            return;
        endif
    endif
    if (T(i,1) == computer && T(i,1) == T(i,5))
        if A(i,2) != '-'
            A(i,2) = '-';
            T(i,3) = computer;
            y=1;
            return;
        endif
    endif  
    if (T(i,3) == computer && T(i,3) == T(i,5))
        if A(i,1) != '-'
            A(i,1) = '-';
            T(i,1) = computer;
            y=1;
            return;
        endif
    endif
endfor

j=1;
%parcurgem coloanele si vedem daca am ocupat pana acum 2 pozitii pe aceeasi coloana
for i=1:2:5
    if (T(1,i) == computer && T(1,i) == T(2,i))
        if A(3,j) != '-'
            A(3,j) = '-';
            T(3,i) = computer;
            y=1;
            return;
        endif
    endif
    if (T(1,i) == computer && T(1,i) == T(3,i))
        if A(2,j) != '-'
            A(2,j) = '-';
            T(2,i) = computer;
            y=1;
            return;
        endif
    endif
    if (T(2,i) == computer && T(2,i) == T(3,i))
        if A(1,j) != '-'
            A(1,j) = '-';
            T(1,i) = computer;
            y=1;
            return;
        endif
    endif
    j=j+1;
endfor

%parcurgem diagonala principala si vedem daca am ocupat pana acum 2 pozitii pe 
%diagonala principala
if (T(1,1) == computer && T(1,1) == T(3,5))
    if A(2,2) != '-'
        A(2,2) = '-';
        T(2,3) = computer;
        y=1;
        return;
    endif
endif
if (T(1,1) == computer && T(1,1) == T(2,3))
    if A(3,3) != '-'
        A(3,3) = '-';
        T(3,5) = computer;
        y=1;
        return;
    endif
endif
if (T(3,5) == computer && T(3,5) == T(2,3))
    if A(1,1) != '-'
        A(1,1) = '-';
        T(1,1) = computer;
        y=1;
        return;
    endif
endif

%parcurgem diagonala secundara si vedem daca am ocupat pana acum 2 pozitii pe 
%diagonala secundara
if (T(1,5) == computer && T(1,5) == T(2,3))
    if A(3,1) != '-'
        A(3,1) = '-';
        T(3,1) = computer;
        y=1;
        return;
    endif
endif
if (T(1,5) == computer && T(1,5) == T(3,1))
    if A(2,2) != '-'
        A(2,2) = '-';
        T(2,3) = computer;
        y=1;
        return;
    endif
endif
if (T(2,3) == computer && T(2,3) == T(3,1))
    if A(1,3) != '-'
        A(1,3) = '-';
        T(1,5) = computer;
        y=1;
        return;
    endif
endif
    
endfunction