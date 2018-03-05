function [c,T,A] = mutare_player(T,A,player)

ok=0;
while ok == 0    
    c=input("Alegeti o pozitie:","s");
    %daca s-a introdus 'q' se iese din joc
    if c == 'q'
        return;
    endif
    %parcugem matricea care contine pozitiile disponibile si cautam mutarea
    %aleasa de jucator
    for i=1:3
        for j=1:3
            %daca s-a gasit pozitia, aceasta va fi ocupata 
            if A(i,j) == c
                ok=1;
                A(i,j) = '-';
                if j == 1
                    T(i,j) = player;
                else
                    if j == 2
                        T(i,3) = player;
                    else
                        T(i,5) = player;
                    endif
                endif
            endif
        endfor
    endfor
    %daca ok-ul nu s-a modificat, inseamna ca nu s-a gasit mutarea aleasa de 
    %jucator, adica pozitia respectiva este ocupata
    if ok == 0
        disp("Pozitie indisponibila");
    endif
endwhile
endfunction
