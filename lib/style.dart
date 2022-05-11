import 'package:flutter/material.dart';

// 기본 위젯을 쓰려면 이것들을 import 해와야 함!

var theme = ThemeData(
  iconTheme: IconThemeData(color:Colors.blue),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    actionsIconTheme: IconThemeData(color: Colors.black87),
    //  하, 이놈 Jonna 까다롭네 IconThemeData라니...;
  ),
);

var _var1;
// 이름 왼쪽에 '_'를 붙이면 다른 파일에 같이 import 안 됨