//Lehlohonolo Sehako - 20557622
//Jaimen Govender - 20464348
//Priyul Mahabeer - 20421169

#define GRID_SIZE 4

/* Define constants for representing the elements */
#define EMPTY 0
#define ROBOT_R1 1
#define ROBOT_R2 2
#define ROBOT_R3 3
#define ROBOT_R4 4
#define TROLLEY 5
#define DESTINATION 6

/* Define variables to represent the grid and positions */
int grid[GRID_SIZE][GRID_SIZE] = {0}; 

int x_robot_1 = 0;
int y_robot_1 = 2;

int x_robot_2 = 1;
int y_robot_2 = 1;

int x_robot_3 = 2;
int y_robot_3 = 0;

int x_robot_4 = 3;
int y_robot_4 = 1;

int x_trolley = 1;
int y_trolley = 2;

int x_dest = 0;
int y_dest = 1;

/* Initialize the grid */
init {
    /* Place robots on the grid */
    grid[x_robot_1][y_robot_1] = ROBOT_R1;
    grid[x_robot_2][y_robot_2] = ROBOT_R2;
    grid[x_robot_3][y_robot_3] = ROBOT_R3;
    grid[x_robot_4][y_robot_4] = ROBOT_R4;
    /* Place trolley and destination on the grid */
    grid[x_trolley][y_trolley] = TROLLEY;
    grid[x_dest][y_dest] = DESTINATION;

    run Robot_R1(); 
    run Robot_R2(); 
    run Robot_R3(); 
    run Robot_R4(); 
}

#define VALID_MOVE(x, y) ((x >= 0) && (x < GRID_SIZE) && (y >= 0) && (y < GRID_SIZE) && (grid[x][y] == EMPTY))

proctype Robot_R1() {
    do
    :: (x_robot_1 == x_trolley + 1) && VALID_MOVE(x_trolley - 1, y_trolley) -> {
        grid[x_trolley][y_trolley] = EMPTY;
        x_trolley--;
        grid[x_trolley][y_trolley] = TROLLEY;
        x_robot_1 = x_trolley + 1;
    }
    :: (x_robot_1 == x_trolley - 1) && VALID_MOVE(x_trolley + 1, y_trolley) -> {
        grid[x_trolley][y_trolley] = EMPTY;
        x_trolley++;
        grid[x_trolley][y_trolley] = TROLLEY;
        x_robot_1 = x_trolley - 1;
    }
    :: else -> skip; 
    od
}

proctype Robot_R2() {
    do
    :: (x_robot_2 == x_trolley + 1) && VALID_MOVE(x_trolley - 1, y_trolley) -> {
        grid[x_trolley][y_trolley] = EMPTY;
        x_trolley--;
        grid[x_trolley][y_trolley] = TROLLEY;
        x_robot_2 = x_trolley + 1;
    }
    :: (x_robot_2 == x_trolley - 1) && VALID_MOVE(x_trolley + 1, y_trolley) -> {
        grid[x_trolley][y_trolley] = EMPTY;
        x_trolley++;
        grid[x_trolley][y_trolley] = TROLLEY;
        x_robot_2 = x_trolley - 1;
    }
    :: else -> skip; 
    od
}

proctype Robot_R3() {
    do
    :: (y_robot_3 == y_trolley + 1) && VALID_MOVE(x_trolley, y_trolley - 1) -> {
        grid[x_trolley][y_trolley] = EMPTY;
        y_trolley--;
        grid[x_trolley][y_trolley] = TROLLEY;
        y_robot_3 = y_trolley + 1;
    }
    :: (y_robot_3 == y_trolley - 1) && VALID_MOVE(x_trolley, y_trolley + 1) -> {
        grid[x_trolley][y_trolley] = EMPTY;
        y_trolley++;
        grid[x_trolley][y_trolley] = TROLLEY;
        y_robot_3 = y_trolley - 1;
    }
    :: else -> skip; 
    od
}

proctype Robot_R4() {
    do
    :: (y_robot_4 == y_trolley + 1) && VALID_MOVE(x_trolley, y_trolley - 1) -> {
        grid[x_trolley][y_trolley] = EMPTY;
        y_trolley--;
        grid[x_trolley][y_trolley] = TROLLEY;
        y_robot_4 = y_trolley + 1;
    }
    :: (y_robot_4 == y_trolley - 1) && VALID_MOVE(x_trolley, y_trolley + 1) -> {
        grid[x_trolley][y_trolley] = EMPTY;
        y_trolley++;
        grid[x_trolley][y_trolley] = TROLLEY;
        y_robot_4 = y_trolley - 1;
    }
    :: else -> skip; 
    od
}


/*
b (i): []<>(x_trolley == x_dest && y_trolley == y_dest). This property states that eventually, at some point in the execution of the system, 
the trolley's position (x_trolley and y_trolley) will be equal to the position of the delivery point (x_dest and y_dest).


(ii). spin -a prac3.pml
gcc -o pan pan.c
./pan -a -N property.pml



*/ 