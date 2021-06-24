# Flutter Samples

Samples, reusable code, and doc useful for Flutter projects.

## Cheat Sheet

### Commands

**Create app project**
```sh
flutter create --org <com.yourorg> <output directory>
```
**Create app project from a sample**
```sh
flutter create --sample=<id> <output directory>
```

**Add dependency to project**
```sh
flutter pub add <package_name>
# e.g.: flutter pub add permission_handler
```

**Run debug version of your app**
```sh
flutter run --device-id <device-id>
# e.g.: flutter run --device-id 3300be62ed5925d9
```

**Show log output for running app**
```sh
flutter logs --device-id <device-id>
# or look at the DEBUG CONSOLE on vscode
# or
# adb -s 3300be62ed5925d9 logcat -s flutter:*
# or
# adb -s 3300be62ed5925d9 logcat flutter:* *:S
```

**Uninstall the app**
```sh
flutter install --uninstall-only
# or
# adb uninstall com.example.plugins_sqflite
```

### Help commands

**Show current brach/channel**
```sh
flutter channel
```

**Show available devices**
```sh
flutter devices
# or
# adb devices -l
```

**Disable web**
```sh
flutter config --no-enable-web
```

**Diagnose if flutter is ok**
```sh
flutter doctor
```

**Get "--sample=<id>" options**
Create JSON file listing of Flutter code samples that can be created with "--sample"
```sh
flutter create --list-samples=samples.json
```


### adb commands

**List installed apps (a.k.a. packages) on device**
```sh
adb -s <device-id> shell 'pm list packages' | sort
```

**Show package .apk file location**
```sh
pm path <package-name>
# e.g. pm path com.example.plugins_sqflite
```

**Explore internal storage (private files) of a package**
```sh
adb -s <device-id> shell
run-as <package-name>
# e.g. run-as com.example.plugins_sqflite
# pwd
ls -la
exit
exit
```

## Samples

**widgets_containers**

Shows container widget usage.
Reference:
https://api.flutter.dev/flutter/widgets/Container-class.html

**widgets_texts_and_fonts**

Shows text widget usage + fonts.
Reference:
https://api.flutter.dev/flutter/widgets/Text-class.html
https://api.flutter.dev/flutter/widgets/RichText-class.html
https://api.flutter.dev/flutter/painting/TextStyle-class.html

Resources:
https://fonts.google.com/

**widgets_columns_rows**

Shows column and row widget usage.
Reference:
https://api.flutter.dev/flutter/widgets/Column-class.html
https://api.flutter.dev/flutter/widgets/Row-class.html
https://flutter.dev/docs/development/ui/layout

**widgets_images**

Shows column and row widget usage.

Notes:
* The apk size increases with the number of asset images.
* The loading time: NetworkImage > FileImage > AssetImage > MemoryImage

Reference:
https://api.flutter.dev/flutter/widgets/Image-class.html
https://api.flutter.dev/flutter/painting/AssetImage-class.html
https://flutter.dev/docs/development/ui/assets-and-images
https://flutter.dev/docs/cookbook/images/network-image

Resources:
https://openclipart.org/
https://commons.wikimedia.org/wiki/Main_Page

**widgets_buttons**

Shows usage of following Buttons:
* ElevatedButton
* TextButton
* OutlinedButton
* PopupMenuButton
* FloatingActionButton in Scaffold class

Deprecated buttons:
* RaisedButton.
* FlatButton
* OutlineButton

**New button classes vs deprecated ones difference**
Each new button class has its own theme: TextButtonTheme, ElevatedButtonTheme, and OutlinedButtonTheme. The original ButtonTheme class is no longer used. The appearance of buttons is specified by a ButtonStyle object, instead of a large set of widget parameters and properties. This is roughly comparable to the way that the appearance of text is defined with a TextStyle object. The new button themes are also configured with a ButtonStyle object. A ButtonStyle is itself just a collection of visual properties. Many of these properties are defined with MaterialStateProperty, which means that their value can depend on the button’s state.

Reference:
https://api.flutter.dev/flutter/material/ElevatedButton-class.html
https://api.flutter.dev/flutter/material/OutlinedButton-class.html
https://api.flutter.dev/flutter/material/TextButton-class.html
https://api.flutter.dev/flutter/material/Scaffold-class.html
https://api.flutter.dev/flutter/material/PopupMenuButton-class.html
https://api.flutter.dev/flutter/material/FloatingActionButton-class.html

**widgets_listview**

Shows usage of ListView, Card, ListTile and CircleAvatar widgets.

Reference:
https://api.flutter.dev/flutter/widgets/ListView-class.html
https://api.flutter.dev/flutter/material/Card-class.html
https://api.flutter.dev/flutter/material/CircleAvatar-class.html
https://api.flutter.dev/flutter/material/ListTile-class.html

**state_simple_form**

Shows usage of StatefulWidget, State, TextField, TextEditingController, DropdownButton, DropdownMenuItem and ElevatedButton.

Reference:
https://flutter.dev/docs/development/ui/interactive
https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html
https://api.flutter.dev/flutter/widgets/State-class.html
https://api.flutter.dev/flutter/material/TextField-class.html
https://api.flutter.dev/flutter/widgets/TextEditingController-class.html
https://api.flutter.dev/flutter/material/DropdownButton-class.html
https://api.flutter.dev/flutter/material/DropdownMenuItem-class.html
https://api.flutter.dev/flutter/material/ElevatedButton-class.html

**screens_simple**

Shows usage of Scaffold with Navigator and BackButton to show multiple screens.

Reference:
https://flutter.dev/docs/cookbook/navigation/navigation-basics
https://flutter.dev/docs/cookbook/animation/page-route-animation
https://api.flutter.dev/flutter/widgets/Navigator-class.html
https://api.flutter.dev/flutter/material/BackButton-class.html

**plugins_sqfline**

Shows sqflite usage.

Reference:
https://pub.dev/packages/sqflite
https://pub.dev/documentation/sqflite/latest/
https://pub.dev/packages/path_provider
https://pub.dev/documentation/path_provider/latest/
https://pub.dev/packages/intl
https://pub.dev/documentation/intl/latest/
https://api.flutter.dev/flutter/intl/intl-library.html


DB alternatives:
https://pub.dev/packages/sembast
https://pub.dev/packages/hive

**gestures_simple**

Shows usage of GestureDetector, Stack, Positioned and widget size determination with GlobalKey and WidgetsBinding.instance.addPostFrameCallback.

Reference:
https://api.flutter.dev/flutter/widgets/GestureDetector-class.html
https://api.flutter.dev/flutter/widgets/Stack-class.html
https://api.flutter.dev/flutter/widgets/Positioned-class.html
https://api.flutter.dev/flutter/widgets/GlobalKey-class.html
https://api.flutter.dev/flutter/widgets/WidgetsBinding-mixin.html
https://api.flutter.dev/flutter/scheduler/SchedulerBinding/addPostFrameCallback.html

**animations_simple**

Shows an animation using Animation, AnimationController and SingleTickerProviderStateMixin.

Reference:
https://api.flutter.dev/flutter/widgets/SingleTickerProviderStateMixin-mixin.html
https://api.flutter.dev/flutter/animation/AnimationController-class.html
https://api.flutter.dev/flutter/animation/Animation-class.html


## Useful references

- [Layout widgets](https://flutter.dev/docs/development/ui/widgets/layout)
- [Themes](https://flutter.dev/docs/cookbook/design/themes)
- [Color class](https://api.flutter.dev/flutter/dart-ui/Color-class.html)
- [Colors utils](https://api.flutter.dev/flutter/material/Colors-class.html)
- [Scaffold class](https://api.flutter.dev/flutter/material/Scaffold-class.html)
- [AppBar class](https://api.flutter.dev/flutter/material/AppBar-class.html)

## Links

- [online documentation](https://flutter.dev/docs)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
- [Codelab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Codelab: Write your first Flutter app, part 1](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt1)
- [Codelab: Write Your First Flutter App, part 2](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt2)
- [Codelab: Building beautiful UIs with Flutter](https://codelabs.developers.google.com/codelabs/flutter)
- [Codelab: Building Beautiful Transitions with Material Motion for Flutter](https://codelabs.developers.google.com/codelabs/material-motion-flutter)
- [Codelab: How to test a Flutter app](https://codelabs.developers.google.com/codelabs/flutter-app-testing)
- [Codelab: Building a Cupertino app with Flutter](https://codelabs.developers.google.com/codelabs/flutter-cupertino)
- [Codelab: MDC-101 Flutter: Material Components (MDC) Basics (Flutter)](https://codelabs.developers.google.com/codelabs/mdc-101-flutter)
- [Codelab: MDC-102 Flutter: Material Structure and Layout (Flutter)](https://codelabs.developers.google.com/codelabs/mdc-102-flutter)
- [Codelab: MDC-103 Flutter: Material Theming with Color, Shape, Elevation, and Type (Flutter)](https://codelabs.developers.google.com/codelabs/mdc-103-flutter)
- [Codelab: MDC-104 Flutter: Material Advanced Components (Flutter)](https://codelabs.developers.google.com/codelabs/mdc-104-flutter)
