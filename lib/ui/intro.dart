import 'dart:core';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

// shows the introduction screen using some public package

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

var page = PageViewModel(
  pageColor: const Color(0xFF607D8B),
  iconImageAssetPath: 'assets/images/1.jpg',
  body: Text(
    'Easy  cab  booking  at  your  doorstep  with  cashless  payment  system',
  ),
  title: Text('Cabs'),
  mainImage: Image.asset(
    'assets/taxi.png',
    height: 285.0,
    width: 285.0,
    alignment: Alignment.center,
  ),
  titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
  bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
);

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: IntroViewsFlutter(
      [
        PageViewModel(
          pageColor: Colors.amberAccent[100],
          body: Text(
            "it's never been easier to find any kind of shoes.",
          ),
          title: Text('Find The Best products'),
          mainImage: CircleAvatar(
            foregroundImage: AssetImage("assets/images/1.jpg"),
            radius: 250,
          ),
          titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.black),
          bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.black),
        ),
        PageViewModel(
          pageColor: Colors.blueAccent[100],
          body: Text(
            'The Best prices in the World.',
          ),
          title: Text('Cheep and Exclusive Sales'),
          mainImage: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CircleAvatar(
                foregroundImage: AssetImage("assets/images/5.jpg"),
                radius: 250,
              )),
          titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.black),
          bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.black),
        ),
        PageViewModel(
          pageColor: Colors.redAccent,
          body: Text(
            'Pay as you like.',
          ),
          title: Text('Buy With installments'),
          mainImage: CircleAvatar(
            foregroundImage: AssetImage("assets/images/3.jpg"),
            radius: 250,
          ),
          titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.black),
          bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.black),
        )
      ],
      onTapDoneButton: () {
        Navigator.popAndPushNamed(context, '/home');
        // Void Callback
      },
      showNextButton: true,
      showSkipButton: true,
      pageButtonTextStyles: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontFamily: 'Regular',
      ),
    )
        //     IntroductionScreen(
        //   pages: [
        //     PageViewModel(
        //         image: ClipRRect(
        //           child: Image.asset('assets/images/1.jpg'),
        //           borderRadius: BorderRadius.circular(30),
        //         ),
        //         title: "Find The Best products",
        //         body: "it's never been easier to find any kind of shoes."),
        //     PageViewModel(
        //         image: ClipRRect(
        //           child: Image.asset('assets/images/5.jpg'),
        //           borderRadius: BorderRadius.circular(30),
        //         ),
        //         title: "Cheep and Exclusive Sales",
        //         body: "The Best prices in the World."),
        //     PageViewModel(
        //         image: ClipRRect(
        //           child: Image.asset('assets/images/3.jpg'),
        //           borderRadius: BorderRadius.circular(30),
        //         ),
        //         title: "Buy in installments",
        //         body: "Pay as you like."),
        //   ],
        //   done: Container(
        //     padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        //     child: Text("Done"),
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(10), color: Colors.amber),
        //   ),
        //   onDone: () {
        //     Navigator.popAndPushNamed(context, '/home');
        //   },
        //   showDoneButton: true,
        //   showNextButton: true,
        //   next: Container(
        //     padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        //     child: Text("Next"),
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(10), color: Colors.amber[100]),
        //   ),
        //   color: Colors.black,
        // ) //Material App
        );
    // return Material(
    //   child: Column(
    //     children: [
    //       Expanded(
    //         child: TabBarView(
    //           controller: _tabController,
    //           children: [
    //             Container(
    //               color: Colors.amber,
    //             ),
    //             Container(
    //               color: Colors.blueAccent,
    //             ),
    //             Container(
    //               color: Colors.greenAccent,
    //             ),
    //           ],
    //         ),
    //       ),
    //       Container(
    //         padding: EdgeInsets.all(30),
    //         color: Colors.amber,
    //         child: Row(
    //           children: [
    //             ChangeTab('Back', _tabController),
    //             Expanded(
    //                 child: Center(
    //                     child: Text((_tabController.index + 1).toString(),
    //                         style:
    //                             TextStyle(color: Colors.black, fontSize: 18)))),
    //             ChangeTab('Next', _tabController),
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
    // ;
  }
}
