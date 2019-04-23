(* ::Package:: *)

BeginPackage["MirooxUtils`"]

LimitMemory::usage="LimitMemory[expr] limits the amount of memory used."
SetAttributes[LimitMemory,HoldAllComplete]

Begin["`LimitMemory`Private`"]

LimitMemory[expr_]:=MemoryConstrained[expr,
    Ramp[MemoryAvailable[]-16^^10000000],
    Failure["OutOfMemory",<|"MessageTemplate"->"Out of memory when evaluating `Expr`.","MessageParameters" -> <|"Expr":> HoldForm[expr]|>|>]
  ]

End[]

If[VectorQ[System`$PreFunctions],
  PrependTo[System`$PreFunctions,LimitMemory],
  System`$PreFunctions={LimitMemory}
]

EndPackage[]
