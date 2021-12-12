Notebook[
 {
  TemplateWith[{
   "$DefaultCellOptions" -> {
    CellMargins -> {{0, 0}, {0, 0}},
    CellBracketOptions -> {"Color" -> RGBColor[0.269993, 0.308507, 0.6]},
    CellHorizontalScrolling -> True,
    PageBreakAbove -> True,
    PageBreakWithin -> False,
    ShowAutoStyles -> True,
    LineSpacing -> {1.25, 0},
    AutoItalicWords -> { },
    ScriptMinSize -> 9,
    ShowStringCharacters -> False,
    FontFamily :> CurrentValue["PanelFontFamily"],
    FontSize :> CurrentValue["PanelFontSize"]
   }
  },
   TemplateSequence[
    TemplateIf[
     MatchQ[TemplateSlot[1], _Cell],
     TemplateSlot[1],
    TemplateIf[
     MatchQ[TemplateSlot[1], _BoxData],
     Cell[
      TemplateSlot[1],
      TemplateSequence[TemplateSlot[1], TemplateSlot["CellOptions"]],
      TemplateSequence[TemplateSlot[1], TemplateSlot["$DefaultCellOptions"]]
     ],
    TemplateIf[
     MatchQ[TemplateSlot[1], (RowBox|GridBox|FrameBox|InterpretationBox|TagBox|TemplateBox|FormBox)[___]],
     Cell[
      BoxData@TemplateSlot[1],
      TemplateSequence[TemplateSlot[1], TemplateSlot["CellOptions"]],
      TemplateSequence[TemplateSlot[1], TemplateSlot["$DefaultCellOptions"]]
     ],
     Cell[
      BoxData@TemplateSlot[1, InsertionFunction -> ToBoxes],
      TemplateSequence[TemplateSlot[1], TemplateSlot["CellOptions"]],
      TemplateSequence[TemplateSlot[1], TemplateSlot["$DefaultCellOptions"]]
     ]
    ]
    ]
    ],
    TemplateSlot["Exprs"]
   ]
  ]
 },
 TemplateSequence[TemplateSlot[1], TemplateSlot["NotebookOptions"]],
 CellContext-> TemplateSlot["CellContext", DefaultValue :> $Context],
 Magnification -> 1.0,
 DynamicUpdating -> True,
 WindowSize -> All,
 WindowMargins -> {{Automatic, 0}, {Automatic, 0}},
 WindowElements -> { },
 WindowTitle -> TemplateSlot["WindowTitle", "DefaultValue"->"Untitled"],
 FrontEndVersion -> TemplateSlot["FrontEndVersion", DefaultValue :> $Version],
 StyleDefinitions -> "Palette.nb"
]