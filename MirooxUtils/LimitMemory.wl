(* ::Package:: *)

BeginPackage["MirooxUtils`"]

LimitMemory::usage="LimitMemory[expr] limits the amount of memory used."
LimitMemory::limit="Memory limit exceeded and computation aborted!"
SetAttributes[LimitMemory,HoldAllComplete]

Begin["`LimitMemory`Private`"]

LimitMemory[expr_]:=MemoryConstrained[expr,
    Ramp[MemoryAvailable[]-16^^10000000],
    Message[LimitMemory::limit];
    Failure["OutOfMemory",<|"MessageTemplate":>LimitMemory::limit,"MessageParameters"-><||>|>]
  ]

End[]

If[VectorQ[System`$PreFunctions],
  PrependTo[System`$PreFunctions,LimitMemory],
  System`$PreFunctions={LimitMemory}
]

EndPackage[]
