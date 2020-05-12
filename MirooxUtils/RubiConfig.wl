(* ::Package:: *)

Begin["RubiConfig`"]

If[Length@PacletManager`PacletFind["Rubi"]>0,
  Unprotect[Get];
  Get["Rubi`"]/;!TrueQ@`$LoadingRubi:= (*Villegas-Gayley*)
    Block[{`$LoadingRubi=True},
      GeneralUtilities`SetupTeardown[
        ToExpression["$LoadElementaryFunctionRules=True\n$LoadShowSteps=True"],
        Get["Rubi`"],
        Rubi`Subst /: MakeBoxes[HoldPattern@Rubi`Subst[`expr_, `src_, `tar_], TraditionalForm] :=
          RowBox@{UnderscriptBox[StyleBox["Subs", FontSize -> Medium], RowBox[{MakeBoxes[`src, TraditionalForm], "\[Rule]", MakeBoxes[`tar, TraditionalForm]}]], MakeBoxes[`expr, TraditionalForm]};
        MirooxUtils`IntWithStepsOfTeXForm[`expr_, `var_] := (*thanks @wuyudi*)
          With[{`TeX2Str = Convert`TeX`ExpressionToTeX},
            Rubi`Steps[Rubi`Int[`expr, `var], Rubi`RubiPrintInformation -> False] //
              Flatten //
              Most //
              Cases[Rubi`RubiIntermediateResult[`x_] :> "=&" <> `TeX2Str[HoldForm@@`x] <> "\\\\"] //
              {"\\begin{aligned}", `TeX2Str@HoldForm@Rubi`Int[`expr, `var], Sequence@@#, "\\end{aligned}"}& //
              StringReplace[{"\\, d" <> ToString[`var] ->  "\\, \\mathrm{d}" <> ToString[`var]}] //
              StringRiffle
          ]
      ]
    ];
  Protect[Get];
]

End[]
