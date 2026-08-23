**Translation Library**

One of the main oddities of the 1C:Enterprise platform is its method of storing translations inside the source code, which has always been and continues to be considered a bad practice in other programming languages. This library is designed for developers who refuse to tolerate this approach.

In the Translation Library, one of the languages is selected as the main - and this is the only language that you will encounter in the source code. Usually, the English language is selected for this role, because the source code itself uses it. Configurations written in the Russian language should use the localized version of the Translation Library.

**Translation storage**

All translations are stored in the common template *MOD_Translations* in JSON format. You can use several translations for the same string and use the one you need depending on the context.

```json
{
  "MainLanguage": "<the main language>",
  "Strings": [
    {
      "Text": "<text in the main language>",
      "<variant number>": {
        "<translation language>": "translation",
      },
    },
  ],
}
```

When the value of Text or <translation language> attribute is a multiline string, it must be a collection of string

It is recommended to sort Strings collection in alphabetical order by the Text property, especially when a VCS is used. Also, to see clean diffs in your VCS, trailing commas are welcome, despite violating the JSON standard

**Using translations**

The global function LStr was chosen as the method to retrieve translations in the Translation Library. This name was chosen with the expectation of seeing such a function natively in the 1C: Enterprise platform. If your development guidelines forbid using a global function, or a global function without the gl prefix you can freely rename it or use your own method to call the *MOD_TranslationsServerCall.LStrInt* function with the same parameters

```bsl
LStr(Text, Splitter, Language)
```
Parameters:

*Text* - String, text in the main language

*Splitter* - Number - variant number

*Language* (optional) - String - specific translation language instead of the current language, returned by the *CurrentLanguage()* function
