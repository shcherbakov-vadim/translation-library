///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2026, Vadim Shcherbakov, chtcherbakov.vadim@gmail.com
// All rights reserved. This software and the related materials 
// are licensed under a Creative Commons Attribution 4.0 International license (CC BY 4.0).
// To view the license terms, follow the link:
// https://creativecommons.org/licenses/by/4.0/legalcode
// Repository link:
// https://github.com/shcherbakov-vadim/translation-library.git

Function GetTranslations(Language) Export
	JSONReader = New JSONReader;
	JSONReader.SetString(GetCommonTemplate("MOD_Translations").GetText());
	
	TranslationTable = New ValueTable;
	TranslationTable.Columns.Add("Text");
	TranslationTable.Columns.Add("Splitter");
	TranslationTable.Columns.Add("Translation");

	TranslationsMap = ReadJSON(JSONReader, True);
	If Language = TranslationsMap["MainLanguage"] Then
		Return TranslationTable;
	EndIf;
	
	For Each StringsValue In TranslationsMap["Strings"] Do
		For Each KeyAndValue In StringsValue Do
			If KeyAndValue.Key = "Text" Then
				Text = ReadValue(KeyAndValue.Value);
			EndIf;
		EndDo;
		
		For Each KeyAndValue In StringsValue Do
			If KeyAndValue.Key <> "Text" Then
				Value = KeyAndValue.Value[Language];
				If Value <> Undefined Then
					NewLine = TranslationTable.Add();
					NewLine.Text = Text;
					NewLine.Splitter = Number(KeyAndValue.Key);
					NewLine.Translation = ReadValue(Value);
				EndIf;
			EndIf;
		EndDo;
	EndDo;
	
	TranslationTable.Indexes.Add("Text,Splitter");
	Return TranslationTable;
EndFunction

Function ReadValue(Value)
	If TypeOf(Value) = Type("Array") Then
		Return StrConcat(Value, Chars.LF);
	Else
		Return Value;
	EndIf;
EndFunction