(* ::Package:: *)

BeginPackage["MirooxUtils`"]


BeginSessionTiming::usage="\
BeginSessionTiming[] starts timing.
BeginSessionTiming[id] starts timing with the id."
EndSessionTiming::usage="\
EndSessionTiming[] finish timing.
EndSessionTiming[id] finish timing with the id."
EchoSessionTiming::usage="\
EchoSessionTiming[] echo timing.
EchoSessionTiming[id] echo timing with the id."
Tic::usage="Tic starts timing."
Toc::usage="Toc finish timing."


Begin["`Timing`Private`"]


`$t


EchoSessionTiming::nostart="Not started."
EchoSessionTiming::noid="No such id `1`."


timingString[t_]:=TemplateApply["Elapsed time is `1` seconds.",{t}]


BeginSessionTiming[id:(_|PatternSequence[])]:=($t[id]=AbsoluteTime[];)
EndSessionTiming[id:(_|PatternSequence[])]:=With[{t=EchoSessionTiming[id]},$t[id]=.;t]
EchoSessionTiming[id_]:=If[ValueQ[$t[id]],Echo[AbsoluteTime[]-$t[id],id,timingString],Message[EchoSessionTiming::noid,id]]
EchoSessionTiming[]:=If[ValueQ[$t[]],AbsoluteTime[]-$t[]//EchoFunction[timingString],Message[EchoSessionTiming::nostart]]
Tic:=BeginSessionTiming[]
Toc:=EndSessionTiming[]


End[]


EndPackage[]
