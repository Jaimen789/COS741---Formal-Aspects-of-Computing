mtype = {COOPERATE, DEFECT};

chan p1_to_guard = [2] of {mtype};
chan p2_to_guard = [2] of {mtype};

active [2] proctype prisoner()
{
    mtype decision;
    do
    :: decision = COOPERATE;  // Non-deterministically decide to cooperate
       p1_to_guard ! decision;
    :: decision = DEFECT;     // Non-deterministically decide to defect
       p2_to_guard ! decision; // Sending decision to the correct channel
    od
}

active proctype guard()
{
    int p1_penalty = 0;
    int p2_penalty = 0;
    mtype p1_decision, p2_decision;

    do
    :: p1_to_guard ? p1_decision;
       p2_to_guard ? p2_decision;

       if
           :: (p1_decision == COOPERATE && p2_decision == COOPERATE) -> 
               p1_penalty = p1_penalty + 1;
               p2_penalty = p2_penalty + 1;
           :: (p1_decision == DEFECT && p2_decision == DEFECT) -> 
               p1_penalty = p1_penalty + 2;
               p2_penalty = p2_penalty + 2;
           :: (p1_decision == COOPERATE && p2_decision == DEFECT) -> 
               p1_penalty = p1_penalty + 3;
           :: (p1_decision == DEFECT && p2_decision == COOPERATE) -> 
               p2_penalty = p2_penalty + 3;
       fi;

       printf("Round: %d, P1 penalty: %d, P2 penalty: %d\n", _pid, p1_penalty, p2_penalty);
    od
}

init
{
    run prisoner();
    run prisoner();
    run guard();
}
