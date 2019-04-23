(* ::Package:: *)

Begin["PreFunctions`"]

If[!VectorQ[System`$PreFunctions],
  System`$PreFunctions={}
]
$Pre:=Function[{`expr}, (Composition@@System`$PreFunctions)[Unevaluated[`expr]], HoldAllComplete]

End[]
