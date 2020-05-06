datatype StateSpace = StateSpace(n:int,a:int)

method fibonacci(n:int) returns (a:int)
{
	if n == 1
	{
		return 0;
	}
	if n == 2
	{
		return 1;
	}
	if n > 2
	{
		var a := fibonacci(n - 1);
		var b := fibonacci(n - 2);
		return a + b;
	}
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
	
	if n == 1
	{
		return StateSpace(0,0);
	}
	if n == 2
	{
		return StateSpace(0,1);
	}
	var k := fibonacci(n);
	return StateSpace(0,k);
}

method Main()
{
       var initState := rho(5);
       var terminalState := FibonacciTransitions(initState);
       var out := pi(terminalState);
}