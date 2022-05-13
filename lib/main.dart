import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './style.dart' as style;
//이렇게 스타일을 style이라는 이름으로 불러올 수 있음
import 'package:http/http.dart' as http;
import 'dart:convert';

var instaLogo = '../assets/svg/insta_logo.svg';
var like = 0;
var img = [
  '../assets/img/img01.jpg',
];

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
  var homeData;
  getData() async {
    var result = await http
        .get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    // GET함수를 통해 데이터를 가져옴
    homeData = jsonDecode(result.body);
    print(homeData[0]);
    //  jsonDecode하는 이유는 GET으로 가져오면서 String으로 바뀌어있기 때문
    //  데이터를 뽑기 위해선 homeData[0]['likes']와 같은 방법을 써야함
    //  jQuery에서는 homeData[0].likes했던 것 같음
    //  javascript [array] => [list]
    //  javascript {object} => {map}
  }

  @override
  void initState() {
    // MyAppState 위젯이 실행될 때 실행하는 함수
    // TODO: implement initState
    super.initState();
    getData();
    //  initState에는 async를 붙여줄 수 없어서 getData()함수를 별도로 제작
  }

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
      body: [MainContents(homeData: homeData), Text('샵페이지')][tab],
      //개쩐다. list로 그냥 페이지를 구현해버리네;
      // Page넘어가듯이 만들고 싶으면 PageView로 감싸면 됨
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tab,
        //currentIndex를 통해서 현재 선택된 item이 무엇인지 알려줌
        showUnselectedLabels: false,
        //선택 안 된 label 보여줌
        showSelectedLabels: true,
        //선택 된 label 보여줌
        onTap: (i) {
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

class MainContents extends StatefulWidget {
  MainContents({Key? key, this.homeData}) : super(key: key);
  final homeData;

  @override
  State<MainContents> createState() => _MainContentsState();
}

class _MainContentsState extends State<MainContents> {
  @override
  Widget build(BuildContext context) {
    if (widget.homeData != null) {
      // 수업에서 .isNotEmpty 함수를 썼었는데 작동이 안돼서 !=null로 바꿈
      // 처음에 데이터 null상태일 때 ListView를 실행해서 Error가 발생
      return ListView.builder(
        // ListView.builder안에 return이 꼭 필요함
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            // ListTile을 안 쓴 이유는 터치 시 하나의 작업만 하지 않도록 하기 위함
            children: [
              Image.network(widget.homeData[index]['image'].toString()),
              Container(
                constraints: BoxConstraints(maxWidth: 600),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('좋아요 ' + widget.homeData[index]['likes'].toString()),
                    Text(widget.homeData[index]['user'].toString()),
                    Text(widget.homeData[index]['content'].toString()),
                  ],
                ),
              )
            ],
          );
        },
      );
    } else {
      return Text('로딩중');
    }
  }
}
