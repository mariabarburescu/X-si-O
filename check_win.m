function x = check_win(T)

%verificam daca este vreo linie castigatoare si returnam castigatorul
for i=1:3
    if (T(i,1) == T(i,3) && T(i,1) == T(i,5) && (T(i,1) == 'x' || T(i,1) == 'X' || T(i,1) == '0'))
        x = T(i,1);
        return;
    endif
endfor

%verificam daca este vreo coloana castigatoare si returnam castigatorul
for i=1:2:5
    if (T(1,i) == T(2,i) && T(1,i) == T(3,i) && (T(1,i) == 'x' || T(1,i) == 'X' || T(1,i) == '0'))
        x = T(1,i);
        return;
    endif
endfor

%verificam daca este s-a castigat pe diagonala principala si returnam castigatorul
if (T(1,1) == T(2,3) && T(1,1) == T(3,5) && (T(1,1) == 'x' || T(1,1) == 'X' || T(1,1) == '0'))
    x = T(1,1);
    return;
endif

%verificam daca este s-a castigat pe diagonala secundara si returnam castigatorul
if (T(1,5) == T(2,3) && T(1,5) == T(3,1) && (T(1,5) == 'x' || T(1,5) == 'X' || T(1,5) == '0'))  
    x = T(1,5);    
    return;
endif;
x='1';

endfunction