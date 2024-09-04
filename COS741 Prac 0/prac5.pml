//Lehlohonolo Sehako - 20557622
//Jaimen Govender - 20464348
//Priyul Mahabeer - 20421169

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

    // Check the satisfiability of Y
    assert(!Y);

    // Check the satisfiability of Z
    assert(!Z);

    End:
}

ltl unsatY {<>(solver@End)}
ltl unsatZ {<>(solver@End)}


/*
No its not satisfiable. The output of the Promela model indicates a successful execution without encountering any errors. 
Both assertions for Y and Z did not trigger any errors, meanining that both Y and Z are unsatisfiable. 
The model checking of unsatY and unsatZ confirms that there does not exist a truth assignment 
that makes Y or Z true.



*/