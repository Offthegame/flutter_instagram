import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './style.dart' as style;
//이렇게 스타일을 style이라는 이름으로 불러올 수 있음

var instaLogo = '../assets/svg/insta_logo.svg';

void main() {
  runApp(MaterialApp(
    theme: style.theme,
    //이렇게 하면 다른 변수와 헷갈리지 않음
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
          // svg파일 때문에 곤욕을 치름, but 해결
          // https://habillion.tistory.com/10 정리해둠
          instaLogo,
          semanticsLabel: 'instagram logo',
          height: 32,
        ),
        elevation: 1,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.paperplane)),
          //  CupertinoIcons사용법 오지게 헤매었네
        ],
      ),
      body: Text('tsdf'),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        //선택 안 된 label 보여줌
        showSelectedLabels: false,
        //선택 된 label 보여줌
        items: [
          BottomNavigationBarItem(
              label: '홈',
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: '샵',
              icon: Icon(Icons.shopping_bag_outlined),
              activeIcon: Icon(Icons.shopping_bag))
        ],
      ),
    );
  }
}
