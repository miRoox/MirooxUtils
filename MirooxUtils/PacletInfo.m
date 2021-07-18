Paclet[
  Name->"MirooxUtils",
  Version->"0.1.0",
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
        "MirooxUtils`EchoSessionTiming"
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
