(* ::Package:: *)

Begin["RubiConfig`"]

If[Length@PacletManager`PacletFind["Rubi"]>0,
  Unprotect[Get];
  Get["Rubi`"]/;!TrueQ@`$LoadingRubi:= (*Villegas-Gayley*)
    Block[{`$LoadingRubi=True},
      GeneralUtilities`SetupTeardown[
        ToExpression["$LoadElementaryFunctionRules=True\n$LoadShowSteps=True"],
        Get["Rubi`"],
        MirooxUtils`IntWithStepsOfTeXForm[`formula_, `j_] := (*thanks @wuyudi*)
          With[{`TeX2Str = Convert`TeX`ExpressionToTeX},
            Rubi`Steps[Rubi`Int[`formula, `j], Rubi`RubiPrintInformation -> False] //
              Flatten //
              Most //
              Cases[Rubi`RubiIntermediateResult[x_] :> "=&" <> `TeX2Str[HoldForm@@x] <> "\\\\"] //
              {"\\begin{aligned}", `TeX2Str@HoldForm@Rubi`Int[formula, j], Sequence@@#, "\\end{aligned}"}& //
              StringRiffle
          ]
      ]
    ];
  Protect[Get];
]

End[]
