(* ::Package:: *)

BeginPackage["MirooxUtils`",{"GeneralUtilities`"}]

SetUsage[MakePalette,
  "MakePalette[expr$, title$] create palette notebook based on expr$ and title$."
]

SetAttributes[MakePalette,{ReadProtected}]

Begin["`MakePalette`"]

MakePalette[expr_,title_]:=TemplateApply[Get@PacletManager`PacletResource["MirooxUtils", "PaletteTemplate"],<|
  "Boxes"->MakeBoxes[expr],
  "WindowTitle"->title
|>]

End[]

EndPackage[]
