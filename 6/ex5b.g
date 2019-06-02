for d in [1..50] do
	possNr := 0;
	n := NrPrimitiveGroups(d);
	for i in [1..n] do
		nr := Size(MinimalNormalSubgroups(PrimitiveGroup(d,i)));
		if nr > possNr then possNr := nr; fi;
	od;
	Print(possNr," ");
od;