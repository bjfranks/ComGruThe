Ord := function(g,id)
	local i,h;
	h := g;
	i := 1;
	while not h = id do
		h := h*g;
		i := i+1;
	od;
	return i;
end;

Power := function(g,n)
	local i,h;
	h := g;
	for i in [2..n] do
		h := h*g;
	od;
	return h;
end;

GenCombinations := function(i,a,g,l,S1,orders1,id1,res)
	local j;
	if i > Length(a) then
		if g*Inverse(l) = id1 then #if g = l
			Add(res,a);
		fi;
		return;
	fi;
	for j in [1..orders1[i]] do
		a[i] := j;
		GenCombinations(i+1,a,g*Power(S1[i],j),l,S1,orders1,id1,res);
	od;
end;

Map := function(a,S2)
	local i, g;
	g := Power(S2[1],a[1]);
	for i in [2..Length(a)] do
		g := g*Power(S2[i],a[i]);
	od;
	return g;
end;

ExtendsToIsomorphism := function(S1,L1,S2,L2)
	local id1, id2, e1, s, orders1, orders2, a, res, l, i;
	if not Length(S1) = Length(S2) or not Length(L1) = Length(L2) then
		return false;
	fi;
	id1 := Identity(Group(L1)); #needed to check for identity
	id2 := Identity(Group(L2)); #needed to check for identity
	for l in L1 do #search for identity in L1
		if l = id1 then
			e1 := l;
		fi;
	od;
	orders1 := [];
	for s in S1 do
		Add(orders1,Ord(s,id1));
	od;
	orders2 := [];
	for s in S2 do
		Add(orders2,Ord(s,id2));
	od;
	if not orders1 = orders2 then #no isomorphism if orders differ
		return false;
	fi;
	a := [];
	a[Length(S1)] := 1; #a is empty list of length S1, last element 1
	for l in L1 do
		res := []; #combinations of generetors to get l
		GenCombinations(1,a,e1,l,S1,orders1,id1,res);
		s := Inverse(Map(res[1],S2));
		#check if all combinations are mapped equally in S2
		for i in [2..Length(res)] do
			if not Map(res[i],S2)*s = id2 then #not Map(res[i],S2) = s
				return false; #not well-defined
			fi;
		od;
	od;
	return true;
end;