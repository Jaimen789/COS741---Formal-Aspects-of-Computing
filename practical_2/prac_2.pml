/*
u20464348 Jaimen Govender
u20421169 Priyul Mahabeer
u20557622 Lehlohonolo Sehako
*/
byte leader = 0;  

proctype Node(chan ch_in, ch_out) {
    byte tok;
    bool leader_found = false;  

    ch_out ! _pid;  

    end:
    do
    :: ch_in ? tok ->
        if
        :: tok < _pid -> skip; 
        :: tok > _pid -> ch_out ! tok; 
        :: tok == _pid ->
            leader = _pid; 
            leader_found = true; 
            break;
        fi
    od
}

init {
    bool flg[4] = true;

    chan a_to_b = [1] of { byte };
    chan b_to_c = [1] of { byte };
    chan c_to_d = [1] of { byte };
    chan d_to_a = [1] of { byte };

    /* Randomize ID numbers */
    do
    ::  flg[0] -> atomic { run Node(d_to_a, a_to_b); flg[0] = false }
    ::  flg[1] -> atomic { run Node(a_to_b, b_to_c); flg[1] = false }
    ::  flg[2] -> atomic { run Node(b_to_c, c_to_d); flg[2] = false }
    ::  flg[3] -> atomic { run Node(c_to_d, d_to_a); flg[3] = false }
    ::  else -> break
    od
}

/*
Termination:
-> LTL Formula : [](<> (leader > 0))
    The formula states that at some point in the execution, the leader
    variable will be greater than 0, indicating that a leader has been elected.
    This ensures that the protocol will eventually finish once a leader is elected.

Uniqueness:
-> LTL Formula: [](<> (leader > 1 -> false))
    The LTL formula means that if at any point the leader variable becomes greater than 1, then it will
    lead to a violation(more than one node considers itself a leader). It ensures that
    eventually there will be at most one node that consides itself as a leader.

Agreement:
-> [](<> (leader > 0 -> [] (leader == 3)))
    The formula ensures that once a leader is elected, all nodes will eventually know who the leader is 
    and will continue to agree on it.
*/