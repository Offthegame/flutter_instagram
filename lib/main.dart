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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;
  // tab='홈';과 같이 표현해도 상관없음
  // TabBar 써도 되긴 하지만 극한의 Customizing에서 한계옴

  // 동적 UI만드는 방법의 핵심은 아래 3 STEP임
  // 1. state에 현재 UI 상태 저장
  // 2. state에 따라서 UI가 어떻게 보일지 작성
  // 3. 유저도 state 조작할 수 있게 제작

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
      body: [Text('홈'), Text('샵페이지')][tab],
      //개쩐다. list로 그냥 페이지를 구현해버리네;
      // Page넘어가듯이 만들고 싶으면 PageView로 감싸면 됨
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tab,
        //currentIndex를 통해서 현재 선택된 item이 무엇인지 알려줌
        showUnselectedLabels: false,
        //선택 안 된 label 보여줌
        showSelectedLabels: true,
        //선택 된 label 보여줌
        onTap: (i){
          //onPressed와 유사하게 tab하면 실행하는 함수
          //print(i)하면 0부터 차례로 숫자가 할당된 걸 알 수 있음
          //맨 왼쪽 tab누르면 i에 0이 들어가 있음
          setState(() {
            //또 이걸 setState없이 적어주면 안됨ㅠ
            tab = i;
          });

        },
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
