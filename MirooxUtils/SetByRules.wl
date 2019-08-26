(* ::Package:: *)

BeginPackage["MirooxUtils`",{"GeneralUtilities`"}]

SetUsage[SetByRules,
  "SetByRules[rules$] replace '->' to '=' and ':>' to ':=' in rules$, and then evaluate it.",
  "With[SetByRules[rules$],body$] replace '->' to '=' and ':>' to ':=' in rules$ as local variable list."
]

SetAttributes[SetByRules,{ReadProtected}]

Begin["`SetByRules`"]

iSetByRules[rules : {(_Rule|_RuleDelayed)...}] := Unevaluated@Unevaluated[rules] /. {Rule->Set, RuleDelayed->SetDelayed}

SetByRules[rule : (_Rule|_RuleDelayed)] := First@SetByRules[{rules}]
SetByRules[rules : {(_Rule|_RuleDelayed)...}] := Identity@@iSetByRules[rules]
SetByRules[rules : {__List}] := SetByRules/@rules

SetByRules /: With[SetByRules[rules_],body__] := With[{vars=iSetByRules[rules]},With[vars,body]/;MatchQ[vars,_List]]

End[]

EndPackage[]
