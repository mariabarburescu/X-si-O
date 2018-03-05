function [] = joc()

%player va retine cu ce vrei sa joci, x sau 0
player=input("Alegeti X sau 0:","s");
%verificam daca s-a dat comanda de iesire din program
if player == 'q'
    return;
endif
%daca nu s-a introdus x sau 0 intra in aceasta repetitiva pana va citi x sau 0
while (player != '0' && player != 'x' && player != 'X')
    player=input("Alegeti X sau 0:","s");
    if player == 'q'
        return;
    endif
endwhile

c='';
computer='';
player_win=0;
computer_win=0;
draw=0;
games=0;

while player != 'q'
    %crestem numarul de jocuri incepute
    games=games+1;
    %afisam tabela de joc
    disp("Tabela joc:")
    T=['_' '|' '_' '|' '_';'_' '|' '_' '|' '_';'_' '|' '_' '|' '_'];
    disp(T)
    %afisam pozitiile disponibile
    disp("Pozitii disponibile:")
    A=['1' '2' '3';'4' '5' '6';'7' '8' '9'];
    disp(A)
    %cat timp nu a castigat nimeni si mai avem pozitii disponibile intram in
    %aceasta repetitiva
    while (check_win(T) == '1' && empty(A) == 1)
        %in functie de ce a ales jucator, ii atribuim calculatorului x sau 0
        if (player == 'x' || player == 'X')
            computer = '0';
            %apelam functia prin care jucatorul isi poate alege o varianta
            [c,T,A] = mutare_player(T,A,player);
            if c == 'q'
                return;
            endif
            %apelam functia prin care calculatorul va alege o pozitie disponibila
            [T,A] = mutare_computer(T,A,computer);
            %afisam tabela de joc si pozitiile disponibile ramase
            disp("Tabela joc:")
            disp(T)
            disp("Pozitii disponibile:")
            disp(A)         
        else
            %pe aceasta ramura calculatorul va incepe jocul
            computer = 'x';
            %apelam functia prin care calculatorul va alege o pozitie disponibila
            [T,A] = mutare_computer(T,A,computer);
            disp("Tabela joc:")
            disp(T)
            disp("Pozitii disponibile:")
            disp(A)
            %in cazul in care nu mai avem pozitii disponibile se incheie jocul    
            if empty(A) != 1
                break;
            endif
            %apelam functia prin care jucatorul isi poate alege o varianta
            [c,T,A] = mutare_player(T,A,player);
            if c == 'q'
                return;
            endif
            disp("Tabela joc:")
            disp(T)
            disp("Pozitii disponibile:")
            disp(A)
        endif
    endwhile
    %verificam cine a castigat sau daca este egalitate
    if check_win(T) == player
        player_win=player_win+1;
    else
        if check_win(T) == computer
            computer_win=computer_win+1;
        else
            draw=draw+1;
        endif
    endif
    %afisam scorul
    disp("Total jocuri:");
    disp(games);
    disp("Partide castigate de calculator:");
    disp(computer_win);
    disp("Partide castigate de player:");
    disp(player_win);
    disp("Partide terminate la egalitate:");
    disp(draw);
    %incepem un nou joc
    player=input("Alegeti X sau 0:","s");
    while (player != '0' && player != 'x' && player != 'X')
        if player == 'q'
            return;
        endif
        player=input("Alegeti X sau 0:","s");
    endwhile

endwhile
endfunction