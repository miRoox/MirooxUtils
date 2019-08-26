(* ::Package:: *)

BeginPackage["MirooxUtils`",{"GeneralUtilities`"}]

SetUsage[SetByRules,
  "SetByRules[rules$] assignment according to the rules$.",
  "With[SetByRules[rules$],body$] use rules$ as a local variable list.."
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
