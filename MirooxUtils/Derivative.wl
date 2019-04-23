Begin["Derivative`"]

Derivative /: Set[Derivative[`ns__Integer][`f_Symbol], `val_] := 
 TagSet[`f, Derivative[`ns][`f], `val]
Derivative /: SetDelayed[Derivative[`ns__Integer][`f_Symbol], `val_] := 
 TagSetDelayed[`f, Derivative[`ns][`f], `val]

Derivative /: 
 Set[Derivative[`ns__Integer][`f_Symbol][`arg__Pattern], `val_] := 
 If[Length@{`ns} == Length@{`arg}, 
  Set[Derivative[`ns][`f], 
   Evaluate[First /@ {`arg}] \[Function] `val], $Failed]
Derivative /: 
 SetDelayed[Derivative[`ns__Integer][`f_Symbol][`arg__Pattern], `val_] := 
 If[Length@{`ns} == Length@{`arg}, 
  Set[Derivative[`ns][`f], 
   Evaluate[First /@ {`arg}] \[Function] `val], $Failed]

End[]
