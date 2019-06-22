GroupOfType := function(type)
	local d,n,G,i;
	d := 1;
	while true do
		n := NrPrimitiveGroups(d);
		for i in [1..n] do
			G := PrimitiveGroup(d,i);
			if ONanScottType(G) = type then 
				Print(SmallGeneratingSet(G));
				return;
			fi;
		od;
		d := d+1;
	od;
end;