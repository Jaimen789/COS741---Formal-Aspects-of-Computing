//Lehlohonolo Sehako - 20557622
//Jaimen Govender - 20464348
//Priyul Mahabeer - 20421169


bool pallet1 = true;
bool pallet2 = true;
bool pallet3 = true;
bool pallet4 = true;
bool pallet5 = true;
bool pallet6 = true;
bool pallet7 = true;
bool pallet8 = true;
bool pallet9 = true;
bool pallet10 = true;
bool pallet11 = true;
bool pallet12 = true;
bool pallet13 = true;

bool energizer = true;

int xPacMan = 0;
int yPacMan = 0;
int xGhost = 3;
int yGhost = 3;

proctype PacMan()
{
    int score = 0;

    Move:
        if
        :: (pallet1 || pallet2 || pallet3 || pallet4 || pallet5 || pallet6 || pallet7 || pallet8 || pallet9 || pallet10 || pallet11 || pallet12 || pallet13) -> goto Loop;
        :: else -> goto End;
        fi;

    Loop:
        if
        :: (xPacMan < 3 && xPacMan + 1 != xGhost && yPacMan != yGhost) -> xPacMan = xPacMan + 1; printf("PacMan moves down\n"); //Down
        :: (xPacMan > 0 && xPacMan - 1 != xGhost && yPacMan != yGhost) -> xPacMan = xPacMan - 1; printf("PacMan moves up\n"); //Up
        :: (yPacMan < 3 && xPacMan != xGhost && yPacMan + 1 != yGhost) -> yPacMan = yPacMan + 1; printf("PacMan moves right\n"); //Right
        :: (yPacMan > 0 && xPacMan != xGhost && yPacMan - 1 != yGhost) -> yPacMan = yPacMan - 1; printf("PacMan moves left\n"); //Left
        :: else -> printf("X = %d, Y = %d\n", xPacMan, yPacMan);
        fi;

        Score:
            if
            :: (xPacMan == 0 && yPacMan == 1 && pallet1 == true) -> pallet1 = false; score = score + 1; printf("PacMan has score of %d\n", score);//if pacman is 
            :: (xPacMan == 0 && yPacMan == 2 && pallet2 == true) -> pallet2 = false; score = score + 1; printf("PacMan has score of %d\n", score);
            :: (xPacMan == 0 && yPacMan == 3 && pallet3 == true) -> pallet3 = false; score = score + 1; printf("PacMan has score of %d\n", score);
            
            :: (xPacMan == 1 && yPacMan == 0 && pallet4 == true) -> pallet4 = false; score = score + 1; printf("PacMan has score of %d\n", score);
            :: (xPacMan == 1 && yPacMan == 1 && pallet5 == true) -> pallet5 = false; score = score + 1; printf("PacMan has score of %d\n", score);
            :: (xPacMan == 1 && yPacMan == 2 && pallet6 == true) -> pallet6 = false; score = score + 1; printf("PacMan has score of %d\n", score);
            :: (xPacMan == 1 && yPacMan == 3 && pallet7 == true) -> pallet7 = false; score = score + 1; printf("PacMan has score of %d\n", score);
            
            :: (xPacMan == 2 && yPacMan == 0 && pallet8 == true) -> pallet8 = false; score = score + 1; printf("PacMan has score of %d\n", score);
            :: (xPacMan == 2 && yPacMan == 1 && pallet9 == true) -> pallet9 = false; score = score + 1; printf("PacMan has score of %d\n", score);
            :: (xPacMan == 2 && yPacMan == 2 && pallet10 == true) -> pallet10 = false; score = score + 1; printf("PacMan has score of %d\n", score);
            :: (xPacMan == 2 && yPacMan == 3 && pallet11 == true) -> pallet11 = false; score = score + 1; printf("PacMan has score of %d\n", score);

            :: (xPacMan == 3 && yPacMan == 0 && energizer == true) -> energizer = false; printf("PacMan has consumed energizer"); //pacman eats the energizer

            :: (xPacMan == 3 && yPacMan == 1 && pallet12 == true) -> pallet12 = false; score = score + 1; printf("PacMan has score of %d\n", score);
            :: (xPacMan == 3 && yPacMan == 2 && pallet13 == true) -> pallet13 = false; score = score + 1; printf("PacMan has score of %d\n", score);

            :: else -> goto Move;
            fi;

        goto Move;

        End:
            if
                :: (score > 12) -> Winner: printf("PacMan is the winner!\n"); //if it is least the total number of available pallets
                :: (xGhost == xPacMan && yGhost == yPacMan && energizer == false) -> printf("Ghost eats PacMan! Ghost wins!\n");
                :: (xGhost == xPacMan && yGhost == yPacMan && energizer == true) -> printf("PacMan eats Ghost! PacMan wins!\n");
                :: else -> printf("Ghost is the winner!\n"); skip;
            fi;
}

proctype Ghost()
{
    Move:
        if
            :: (xGhost < 3 && xGhost + 1 != xPacMan && yGhost != yPacMan) -> xGhost = xGhost + 1; printf("Ghost moves down\n"); //Down
            :: (xGhost > 0 && xGhost - 1 != xPacMan && yGhost != yPacMan) -> xGhost = xGhost - 1; printf("Ghost moves up\n"); //Up
            :: (yGhost < 3 && xGhost != xPacMan && yGhost + 1 != yPacMan) -> yGhost = yGhost + 1; printf("Ghost moves right\n"); //Right
            :: (yGhost > 0 && xGhost != xPacMan && yGhost - 1 != yPacMan) -> yGhost = yGhost - 1; printf("Ghost moves left\n"); //Left
            :: else -> printf("X = %d, Y = %d\n", xGhost, yGhost);
        fi;

        if
            :: (xGhost == xPacMan && yGhost == yPacMan && energizer == false) -> printf("Ghost eats PacMan! Ghost wins!\n"); goto End;
            :: (xGhost == xPacMan && yGhost == yPacMan && energizer == true) -> printf("PacMan eats Ghost! PacMan wins!\n"); goto End;
            :: else -> goto Move;
        fi;
    End:
        skip;
}

init
{
  run PacMan();
  run Ghost();
}

#define WinnerPacMan (PacMan@Winner)
#define WinnerGhost (Ghost@Winner)


ltl termination { <> (WinnerPacMan || WinnerGhost) }

/**
The game's termination condition is based on either Pac-Man consuming all the pallets or the ghost catching Pac-Man. 
The LTL property "Eventually either Pac-Man or the ghost will win the game" holds true within this logic, as both Pac-Man and 
the ghost have conditions that lead to victory, ensuring that the game eventually ends with one of them winning.
 */

ltl energizer_win { [](energizer && <> WinnerPacMan) }

/**
The additional LTL property "If Pac-Man reaches the energizer before he and the ghost enter the same field, then he will eventually 
win the game" specifies that Pac-Man's reaching the energizer guarantees his eventual victory, provided that he does not encounter 
the ghost at the same time. In this game's logic, Pac-Man consumes the energizer, granting him the ability to eat the ghost.
 If Pac-Man can reach the energizer before encountering the ghost, and the game ensures that consuming the energizer leads to Pac-Man's victory, 
 then this property holds. However, if there are circumstances where Pac-Man cannot reach the energizer before encountering the ghost, 
 or if consuming the energizer does not guarantee Pac-Man's victory, then this property may not hold.
 */