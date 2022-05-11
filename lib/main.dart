import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cupertino_icons/cupertino_icons.dart';


var instaLogo = '../assets/svg/insta_logo.svg';

void main() {
  runApp(
      MaterialApp(
        theme: ThemeData(
          iconTheme: IconThemeData(color:Colors.blue),
          appBarTheme: AppBarTheme(
              color: Colors.white,
            actionsIconTheme: IconThemeData(color: Colors.black87),
          //  하, 이놈 Jonna 까다롭네 IconThemeData라니...;
          ),
        ),
        home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          instaLogo,
          semanticsLabel: 'instagram logo',
          height: 32,),
        elevation: 0.0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add_box_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.paperplane)),
        //  CupertinoIcons사용법 오지게 헤매었네
        ],
      ),
      body: Text('sdf'),
    );
  }
}
