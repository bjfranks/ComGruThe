n:=50000;Sn := SymmetricGroup(n); An := AlternatingGroup(n);
Centralizer(Sn,Random(Sn));
Print(time,"\n");
Centralizer(An,Random(Sn));
Print(time,"\n");