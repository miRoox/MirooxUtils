(* ::Package:: *)

BeginPackage["MirooxUtils`",{"GeneralUtilities`"}]

SetUsage[MakePalette,
  "MakePalette[expr$, title$] create palette notebook based on expr$ and title$.",
  "MakePalette[{expr$1, expr$2, $$}, title$] create palette notebook based on a expr$i sequence and title$."
]

Options[MakePalette]={
  "CellOptions"->{},
  "NotebookOptions"->{},
  "CellContext"->Automatic
}

SetAttributes[MakePalette,{ReadProtected}]

Begin["`MakePalette`"]

MakePalette[exprs_,title_,opts:OptionsPattern[]]:=TemplateApply[Get@PacletManager`PacletResource["MirooxUtils", "PaletteTemplate"], Merge[{
  "Exprs"->If[ListQ@exprs, exprs, {exprs}],
  "WindowTitle"->title,
  opts
}, Last]]

End[]

EndPackage[]
