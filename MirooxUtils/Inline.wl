(* ::Package:: *)

BeginPackage["MirooxUtils`",{"GeneralUtilities`"}]

SetUsage[Inline,
  "Inline[{sym$1, sym$2, $$}, expr$] inserts the values of the symbols sym$1, sym$2, $$ into expr$."
]

SetAttributes[Inline,{HoldAll,ReadProtected}]
Options[Inline]={MaxIterations->16}

Begin["`Inline`Private`"]

SetAttributes[optValues,HoldAll]
optValues[sym_Symbol]:=Options[Unevaluated[sym]]

$values={OwnValues,NValues,UpValues,DownValues,SubValues,Messages,optValues,Attributes}

Inline[{sym__Symbol},expr_,opt:OptionsPattern[]]:=
  ReplaceRepeated[Hold[expr],
    Flatten@Table[Apply[List,val/@Hold[sym]],{val,$values}],
    MaxIterations->OptionValue[Inline,MaxIterations]
  ]//ReleaseHold

End[]

EndPackage[]
