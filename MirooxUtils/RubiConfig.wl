(* ::Package:: *)

If[Length@PacletManager`PacletFind["Rubi"]>0,
  Unprotect[Get];
  Get["Rubi`"]/;!TrueQ@RubiConfig`$LoadingRubi:= (*Villegas-Gayley*)
    Block[{RubiConfig`$LoadingRubi=True},
      ToExpression["$LoadElementaryFunctionRules=True\n$LoadShowSteps=True"];
      Get["Rubi`"]
    ];
  Protect[Get];
]
