(* ::Package:: *)

BeginPackage["MirooxUtils`",{"GeneralUtilities`"}]

SetUsage[MakePalette,
  "MakePalette[expr$, title$] create palette notebook based on expr$ and title$."
]

Options[MakePalette]={
  "CellOptions"->{},
  "NotebookOptions"->{}
}

SetAttributes[MakePalette,{ReadProtected}]

Begin["`MakePalette`"]

MakePalette[expr_,title_,opts:OptionsPattern[]]:=TemplateApply[Get@PacletManager`PacletResource["MirooxUtils", "PaletteTemplate"], Merge[{
  "Boxes"->MakeBoxes[expr],
  "WindowTitle"->title,
  opts
}, Last]]

End[]

EndPackage[]
