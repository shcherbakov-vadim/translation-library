///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2026, Vadim Shcherbakov, chtcherbakov.vadim@gmail.com
// All rights reserved. This software and the related materials 
// are licensed under a Creative Commons Attribution 4.0 International license (CC BY 4.0).
// To view the license terms, follow the link:
// https://creativecommons.org/licenses/by/4.0/legalcode
// Repository link:
// https://github.com/shcherbakov-vadim/translation-library.git

Function LStrInt(Text, Splitter, Language) Export
	TranslationsTable = MOD_TranslationsServerCached.GetTranslations(Language);
	LinesArray = TranslationsTable.FindRows(New Structure("Text,Splitter", Text, Splitter));
	If ValueIsFilled(LinesArray) Then
		Return LinesArray[0].Translation;
	Else
		Return Text;
	EndIf;
EndFunction