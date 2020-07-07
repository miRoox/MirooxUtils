#!/usr/bin/env wolframscript
(* ::Package:: *)


$pacletDir=FileNameJoin@{DirectoryName[$InputFileName], "MirooxUtils"}

If[$VersionNumber>=12.1,
  System`PacletDirectoryLoad[$pacletDir],
  PacletManager`PacletDirectoryAdd[$pacletDir]
]

return[exitcode_:0]:=If[
  exitcode=!=0,
  Throw[exitcode, return]
]

Catch[
  Block[{Exit=return},
    <<"src/makeNotebookTools.wls"
  ],
  return,
  Function[{value, tag}, Exit[value]]
]

paclet=If[$VersionNumber>=12.1,
  System`CreatePacletArchive[$pacletDir],
  PacletManager`PackPaclet[$pacletDir]
];

If[FailureQ@paclet,
  Exit[1],
  Print["::set-output name=name::", FileNameTake@paclet];
]

Exit[]
