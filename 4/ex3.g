SearchGen1 := function(L,S,i)
	local l;
	if i > Length(S) then return IsGenSet(S,L); fi;
	for l in L do
		S[i] := l;
		if SearchGen1(L,S,i+1) then return true; fi;
	od;
	return false;
end;

SearchGen2 := function(L1,S1,L2,S2,i)
	local l;
	if i > Length(S2) then 
		return IsGenSet(S2,L2) and IsIso(S1,L1,S2,L2); 
	fi;
	for l in L2 do
		S2[i] := l;
		if SearchGen2(L1,S1,L2,S2,i+1) then return true; fi;
	od;
	return false;
end;

IsoGroups := function(L1,L2)
	local n,s,S1,S2; 
	n := Length(L1);
	if n <> Length(L2) then return false; fi;
	s := Int(Log2(Float(n))); #size of gen set
	S1 := [];
	S1[s] := 0; #init S1 to size s
	SearchGen1(L1,S1,1);
	S2 := [];
	S2[s] := 0; #init S2 to size s
	return SearchGen2(L1,S1,L2,S2,1);
end;