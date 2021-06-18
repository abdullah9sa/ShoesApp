import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:abdullah/themes/themes.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:abdullah/ui/hometab.dart';
import 'package:flutter/services.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _currentIndex = 0;
  PageController _pageController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            iconTheme: IconThemeData(color: Colors.black),
            foregroundColor: Colors.black,
            elevation: 0,
            // automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text("Dashoes", style: AppThemeData.mainTextStyle),
            backgroundColor: Colors.white,
            actions: [
              TextButton(
                  onPressed: () {},
                  child: Transform.scale(
                    scale: .8,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset('assets/images/abd.jpg')),
                  )),
            ],
          ),
          drawer: SideMenu(),
          body: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: [
              homepage(),
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.redAccent,
              ),
              Container(
                color: Colors.blueAccent,
              ),
            ],
          ),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: _currentIndex,
            showElevation: false, // use this to remove appBar's elevation
            onItemSelected: (index) {
              setState(() => _currentIndex = index);
              _pageController.jumpToPage(index);
            },
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                inactiveColor: Colors.black,
                activeColor: Colors.amber,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text('Cart'),
                inactiveColor: Colors.black,
                activeColor: Colors.amber,
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.favorite),
                  title: Text('Favorites'),
                  inactiveColor: Colors.black,
                  activeColor: Colors.amber),
              // activeColor: Colors.pink),
              BottomNavyBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Account'),
                  inactiveColor: Colors.black,
                  activeColor: Colors.amber)
              // activeColor: Colors.blue),
            ],
          )),
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration bd = BoxDecoration(
        gradient: LinearGradient(colors: [Colors.white, Colors.white]));
    return SafeArea(
      child: Drawer(
        child: Container(
            decoration: bd,
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      foregroundImage: AssetImage('assets/images/abd.jpg'),
                      radius: 27,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Abdulah Salih",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Divider(
                  color: Colors.amber,
                ),
                SizedBox(
                  height: 25,
                ),
                SideMenuButton(Icons.home, "Home"),
                SideMenuButton(Icons.person, "Profile"),
                SideMenuButton(Icons.message, "Messeges"),
                SideMenuButton(Icons.shopping_cart_outlined, "Orders"),
                SideMenuButton(Icons.help, "Help"),
                SideMenuButton(Icons.info, "About"),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  color: Colors.amber,
                ),
                SideMenuButton(Icons.exit_to_app, "Exit"),
              ],
            )),
      ),
    );
  }
}

class SideMenuButton extends StatelessWidget {
  IconData icn;
  String title;

  SideMenuButton(this.icn, this.title);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (title == "Exit") SystemNavigator.pop();
      },
      child: Row(
        children: [
          Icon(
            icn,
            size: 35,
            color: Colors.amber,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
          )
        ],
      ),
    );
  }
}
