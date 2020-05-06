datatype StateSpace = StateSpace(n:int,a:int)

method fibonacci(n:int) returns (a:int)
{
	var i := 0;
	var j := 1;
	var k := 1;
	var l := 2;
	if n == 1
	{
	    a := i;
	}
	if n == 2
	{
	    a := j;
	}
	while l < n
        decreases n - l
	{
		k := i + j;
		i := j;
		j := k;
		l := l + 1;
	}
	a := k;
}

function method rho(n:int): StateSpace
{
	StateSpace(n,0)
}

function method pi(state:StateSpace): int
{
	state.a
}

method FibonacciTransitions(initState: StateSpace) returns (finalState: StateSpace)
{
	var n: int := initState.n;
	var i := 0;
	var j := 1;
	var k := 1;
	var l := 2;

	if n == 1
	{
		return StateSpace(0,0);
	}
	if n == 2
	{
		return StateSpace(0,1);
	}
	while l < n
	decreases n - l
	{
		k := i + j;
		i := j;
		j := k;
		l := l + 1;
	}
	return StateSpace(0,k);
}

method Main()
{
       var initState := rho(5);
       var terminalState := FibonacciTransitions(initState);
       var out := pi(terminalState);
}