
# bouncing_character
[![pub package](https://img.shields.io/pub/v/flutter_screenutil.svg)](https://pub.dartlang.org/packages/bouncing_character)

**A flutter plugin to make elegant illustation of bouncing charater on flutter web**


[README](https://github.com/iamabhishek229313/bouncing_character/blob/master/README.md)

**Github**: https://github.com/iamabhishek229313/bouncing_character

[Update log](/CHANGELOG.md)

## Usage:

### Add dependency：
Please check the latest version before installation.
```
dependencies:
  flutter:
    sdk: flutter
  # add bouncing_character
  bouncing_character: ^1.0.0
```

### Add the following imports to your Dart code:
```
import 'package:bouncing_character/bouncing_character.dart';
```

### Property
   
|Property|Type|Default Value|Description|
|:---|:---|:---|:---| 
|text|String|**@required**|The whole text that you want to get illustration|
|duration|Duration|**@required**|Animation Duration|
|style|TextStyle|**null**|Text style that you want to be there.|
|onHoverTranslate|Matrix4|Matrix4.identity()..translate(0,-10,0)|Transformation of animation|



### API
**Too simple example**
```dart
    Container(
        width : 600.0,
        height : 300.0,
        child : BouncingCharacter(
            text : "I'm a developer" , // it is @required
            duration : Duration(milliseconds : 200) , // it's too
        )       
    )
```
**All functionaries**
```dart
    
  // Initializing some custom attributes .
  const BgColor = Color.fromRGBO(27, 26, 31, 1.0);
  const TextStyle customStyle = TextStyle(fontSize: 44.0, fontFamily: 'BioRhyme', color: Colors.grey);
  const Duration customDuration = Duration(milliseconds: 200);
  Matrix4 customTransform = Matrix4.identity()..translate(0, -10, 0);   
  
   BouncingCharacter(
        text: "I'm a developer",
        duration: customDuration,
        style: customStyle,
        onHoverTranslate: customTransform,
    )
```
###Example 
**main.dart**
```dart
import 'package:bouncing_character_example/home_page.dart';
import 'package:flutter/material.dart';
import 'package:bouncing_character/bouncing_character.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
    );
  }
}
```

**home_page.dart**
```dart
import 'package:bouncing_character/bouncing_character.dart';
import 'package:flutter/material.dart';

// Initializing some custom attributes .

const BgColor = Color.fromRGBO(27, 26, 31, 1.0);
const TextStyle customStyle = TextStyle(fontSize: 44.0, fontFamily: 'BioRhyme', color: Colors.grey);
const Duration customDuration = Duration(milliseconds: 200);
Matrix4 customTransform = Matrix4.identity()..translate(0, -10, 0);


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BgColor,
        body: Center(
            child: BouncingCharacter(
              text: "I'm a developer",
              duration: customDuration,
              style: customStyle,
              onHoverTranslate: customTransform,
            )));
  }
}
```


