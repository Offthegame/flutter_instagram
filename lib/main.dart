import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './style.dart' as style;
//이렇게 스타일을 style이라는 이름으로 불러올 수 있음


var instaLogo = '../assets/svg/insta_logo.svg';

void main() {
  runApp(
      MaterialApp(
        theme: style.theme,
        //이렇게 하면 다른 변수와 헷갈리지 않음
        home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        // 아래 4개 탭이 샤샤샥 움직이려면 필요함
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: SvgPicture.asset(
              // svg파일 때문에 곤욕을 치름, but 해결
              // https://habillion.tistory.com/10 정리해둠
              instaLogo,
              semanticsLabel: 'instagram logo',
              height: 32,),
            elevation: 1,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {}, icon: Icon(CupertinoIcons.paperplane)),
              //  CupertinoIcons사용법 오지게 헤매었네
            ],
          ),
          body: TabBarView(
            //TabBarView를 통해 내용들이 Tab으로 보여지도록 함
            children: [
              Center(
                child: Text("home"),
              ),
              Center(
                child: Text("find"),
              ),
              Center(
                child: Text("shorts"),
              ),
              Center(
                child: Text("my page"),
              ),
            ],
          ),
          extendBodyBehindAppBar: true, // add this line
          bottomNavigationBar: Container(
            color: Colors.white, //색상
            child: Container(
              height: 70,
              padding: EdgeInsets.only(bottom: 10, top: 5),
              child: const TabBar(
                //tab바 하단 설정
                //tab 하단 indicator size -> .label = label의 길이
                //tab 하단 indicator size -> .tab = tab의 길이
                indicatorSize: TabBarIndicatorSize.label,
                //tab 하단 indicator color
                indicatorColor: Colors.red,
                //tab 하단 indicator weight
                indicatorWeight: 2,
                //label color
                labelColor: Colors.red,
                //unselected label color
                unselectedLabelColor: Colors.black38,
                labelStyle: TextStyle(
                  fontSize: 13,
                ),
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.home_outlined,
                    ),
                    text: 'Home',
                  ),
                  Tab(
                    icon: Icon(Icons.search),
                    text: 'Find',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.play_circle_outline_outlined,
                    ),
                    text: 'shorts',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.account_circle,
                    ),
                    text: 'My page',
                  )
                ],
              ),
            ),
          ),
        )
    );
  }

}
