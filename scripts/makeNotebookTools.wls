#!/usr/bin/env wolframscript


Begin["MirooxUtils`SaveReadableNotebook`"]
Needs["MirooxUtils`"]
ResourceFunction["SaveReadableNotebook"]

$path=FileNameJoin@{DirectoryName[$InputFileName,2],"MirooxUtils","FrontEnd","Palettes","MirooxUtils","NotebookTools.nb"}

saveReadableNotebook:=Block[
  {nb=InputNotebook[],fileName},
  fileName=Quiet@NotebookFileName[nb];
  While[FileExtension@fileName=!="nb",
    fileName=SystemDialogInput[
      "FileSave",{
        AbsoluteCurrentValue[nb,WindowTitle],{
          "Wolfram Notebook (*.nb)"->{"*.nb"}
        }
      }];
    If[fileName===$Canceled, Return[$Canceled, Block]];
  ];
  NotebookSave[nb];
  ResourceFunction["SaveReadableNotebook"][nb,fileName];
]
saveReadableNotebookButton=MirooxUtils`Inline[
  {saveReadableNotebook},
  Button["Save Readable Notebook",saveReadableNotebook,
    Appearance->"Palette",Method->"Queued",ImageSize->{All,Automatic}
  ]
]

palette=MakePalette[
  Grid[{{
    saveReadableNotebookButton
  }}],
  "Notebook Tools",
  "NotebookOptions" -> {
    TaggingRules -> {}
  }
];
ResourceFunction["SaveReadableNotebook"][palette,ResourceFunction["EnsureFilePath"][$path],"ExcludedNotebookOptions"->{}]

End[]
