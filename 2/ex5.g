estimate1 := function(n)
	local S, sum, m, a, i;
	S := SymmetricGroup(n);
	sum := 0.0;
	m := 1000;
	for i in [1..m] do
		a := Random(S);
		sum := sum + Order(a);
	od;
	return sum/m;
end;
estimate2 := function(n)
	local A, sum, m, a, b, i;
	A := AlternatingGroup(n);
	sum := 0.0;
	m := 100;
	for i in [1..m] do
		a := Random(A);
		b := Random(A);
		sum := sum + Size(Group(a,b));
	od;
	return sum/m;
end;
estimate3 := function(n)
	local S, sum, m, a, b, i;
	S := SymmetricGroup(n);
	sum := 0.0;
	m := 100;
	for i in [1..m] do
		a := Random(S);
		b := Random(S);
		sum := sum + Size(Group(a,b));
	od;
	return sum/m;
end;
estOrders1 := [];
estOrders2 := [];
estOrders3 := [];
for n in [1..50] do
	Add(estOrders1, estimate1(n));
	Add(estOrders2, estimate2(n));
	Add(estOrders3, estimate3(n));
od;
estOrders1;
estOrders2;
estOrders3;
