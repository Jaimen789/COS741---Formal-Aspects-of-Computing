bool Y, Z;

active proctype solver() {

bool a, b, c, d;



/* Add your code here */



Y = (a || b) && (a || !b) && (a || !c) &&
 (!a || c) && (c || !d) && (!c || !d) &&
 (b || !d) && (!b || d);

Z = (a || b) && (a || !b) && (!a || !c) &&
 (!a || c) && (c || !d) && (c || !d) &&
 (b || !d) && (!b || d);

End:
}

ltl unsatY {<>(solver@End && !Y)}

ltl unsatZ {<>(solver@End && !Z)}



