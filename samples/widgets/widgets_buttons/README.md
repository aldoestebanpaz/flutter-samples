**widgets_buttons**

Shows usage of following Buttons:
* ElevatedButton
* TextButton
* OutlinedButton
* FloatingActionButton in Scaffold class

Deprecated buttons:
* RaisedButton.
* FlatButton
* OutlineButton

NOTE: run `flutter logs` to see `print(...)` and `debugPrint()` messages.

**New button classes vs deprecated ones difference**
Each new button class has its own theme: TextButtonTheme, ElevatedButtonTheme, and OutlinedButtonTheme. The original ButtonTheme class is no longer used. The appearance of buttons is specified by a ButtonStyle object, instead of a large set of widget parameters and properties. This is roughly comparable to the way that the appearance of text is defined with a TextStyle object. The new button themes are also configured with a ButtonStyle object. A ButtonStyle is itself just a collection of visual properties. Many of these properties are defined with MaterialStateProperty, which means that their value can depend on the button’s state.

Reference:
https://api.flutter.dev/flutter/material/ElevatedButton-class.html
https://api.flutter.dev/flutter/material/OutlinedButton-class.html
https://api.flutter.dev/flutter/material/TextButton-class.html
https://api.flutter.dev/flutter/material/Scaffold-class.html
