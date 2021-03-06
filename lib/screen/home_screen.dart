import 'package:flutter/material.dart';
import 'package:social_app_flutter/data/data.dart';
import 'package:social_app_flutter/widgets/custom_drawer.dart';
import 'package:social_app_flutter/widgets/following_users.dart';
import 'package:social_app_flutter/widgets/post_loder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  final GlobalKey <ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0,viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
        icon: Icon(
        Icons.menu,
        size: 30,
        color: Colors.blue,
      ),
          onPressed: ()=>_scaffoldKey.currentState.openDrawer(),
    ),
        title: Text(
          "MeetBook",
          style: TextStyle(
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        bottom: TabBar(
          indicatorWeight: 3.0,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          unselectedLabelStyle:
              TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          tabs: [
            Tab(
              text: "Trending",
            ),
            Tab(
              text: "Latest",
            ),
          ],
        ),
      ),

      body: ListView(
        children: [
          FollowingUsers(),
          PostLoader(
            pageController: _pageController,
            title: "Posts",
            posts: posts,
          ),

        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
