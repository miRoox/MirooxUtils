Paclet[
  Name->"MirooxUtils",
  Version->"0.2.2",
  WolframVersion->"12+",
  Creator->"miRoox <miRoox@outlook.com>",
  Description->"Program utilities",
  Loading->Manual,
  Extensions->{
    {
      "Kernel",
      "Context"->{"MirooxUtils`"},
      "Symbols"->{
        "System`$PreFunctions","System`$Pre",
        "System`Subscript","System`Derivative",
        "System`Clear","System`ClearAll",
        "MirooxUtils`LimitMemory",
        "MirooxUtils`Tic","MirooxUtils`Toc",
        "MirooxUtils`BeginSessionTiming",
        "MirooxUtils`EndSessionTiming",
        "MirooxUtils`EchoSessionTiming",
        "MirooxUtils`MakePalette"
      }
    },
    {
      "FrontEnd",
      "Prepend"->True
    },
    {
      "Resource",
      Root->"Resources",
      Resources->{
        {"PaletteTemplate", "PaletteTemplate.wl"}
      }
    }
  }
]
