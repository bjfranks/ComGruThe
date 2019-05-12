IsContained := function(x,L,id)
	local l;
	for l in L do
		if x*Inverse(l) = id then #if x = l
			return true;
		fi;
	od;
	return false;
end;

IsGenSet := function(S,L)
	local G, id, e, g, s, p, l;
	id := Identity(Group(L)); #needed to check for identity
	for l in L do #search for identity in L
		if l = id then
			e := l;
		fi;
	od;
	G := [e];
	for g in G do #until all elements in G considered and no changes
		for s in S do
			p := g*s;
			if not IsContained(p,G,id) then
				Add(G,p);
			fi;
		od;
	od;
	return Length(G) = Length(L); #sufficient since G is subset of L
end;