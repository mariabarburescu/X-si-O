function x = empty(A)

%verificam daca mai sunt pozitii disponibile
for i=1:3
    for j=1:3
        if A(i,j) != '-'
            x=1;
            return;
        endif
    endfor
endfor
x=0;

endfunction