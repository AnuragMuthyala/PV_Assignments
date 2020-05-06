datatype StateSpace = StateSpace(a:array<int>,n:int)

function method rho(a:array<int>): StateSpace
{
	StateSpace(a,a.Length)
}

function method pi(state:StateSpace): array<int>
{
	state.a
}

method BubbleSortTransition(initialState:StateSpace) returns (finalState:StateSpace)
modifies initialState.a
{
	var a: array<int> := initialState.a;
	var b := new int[a.Length];
	var l: int := a.Length;
	var i := 1;
	var j := 0;
	var t := 0;

	while i < l
	decreases l - i
	{
		j := 0;
		while j < l - i
		decreases l - i - j
		{
			if a[j] > a[j + 1]
			{
				t := a[j];
				a[j] := a[j + 1];
				a[j + 1] := t;
			}
			j := j + 1;
		}
		i := i + 1;
	}
	return StateSpace(a,0);
}

method is_sort(a:array<int>) returns (n:int)
{
	var i := 0;
	while i < a.Length - 1
	decreases a.Length - i - 1
	{
		if a[i] > a[i + 1]
		{
			return 1;
		}
		i := i + 1;
	}
	return 1;
}

method Main()
{
        var a := new int[5];
        a[0],a[1],a[2],a[3],a[4] := 9,4,6,3,8;
        var initState := rho(a);
        var terminalState := BubbleSortTransition(initState);
        var output := pi(terminalState);
	var out := is_sort(output);
}