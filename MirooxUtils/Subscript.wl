Begin["Subscript`"]

SetAttributes[Subscript,HoldFirst]
Subscript /: Set[Subscript[`sym_Symbol, `rest__], `val_] := 
 TagSet[`sym, Subscript[`sym, `rest], `val]
Subscript /: SetDelayed[Subscript[`sym_Symbol, `rest__], `val_] := 
 TagSetDelayed[`sym, Subscript[`sym, `rest], `val]

End[]
