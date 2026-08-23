&AtServer
Procedure OnCreateAtServer(Cancel, StandardProcessing)
	Message(LStr("Procedure OnCreateAtServer was called", 1));	
EndProcedure

&AtClient
Procedure OnOpen(Cancel)
	Message(LStr("Procedure OnOpen was called.
		|After that form considered to be opened", 1))
EndProcedure
