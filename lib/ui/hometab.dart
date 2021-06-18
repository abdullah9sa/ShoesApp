import 'package:flutter/material.dart';
import 'package:abdullah/themes/themes.dart';
import 'package:abdullah/ui/imagesProvider.dart';

// The home tab

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  hoverColor: Colors.amber[100],
                  fillColor: Color.fromRGBO(0, 0, 0, .07),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search for a Shoe'),
            ),
          ),
          NestedTabBar()
        ],
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  TabController _nestedTabController;
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Expanded(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TabBar(
            controller: _nestedTabController,
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                text: "All",
              ),
              Tab(
                text: "New",
              ),
              Tab(
                text: "Top Ratings",
              ),
              Tab(
                text: "Sales",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _nestedTabController,
              children: <Widget>[
                // Shows images based on the passed number of images

                ItemsGrid(10),
                ItemsGrid(4),
                ItemsGrid(7),
                ItemsGrid(4),
              ],
            ),
          )
        ],
      ),
    );
  }
}
