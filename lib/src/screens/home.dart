import 'package:camel/src/ressources/fsthree.dart';
import 'package:camel/src/screens/fs_display.dart';
import 'package:camel/src/screens/homeBody.dart';
import 'package:camel/src/widgets/custom_appbar.dart';
import 'package:camel/src/widgets/custom_bottombar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController tabController;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (Platform.isLinux || Platform.isMacOS || Platform.isWindows)
            ? null
            : CustomAppBar(
                title: Text("Camel",
                    style: TextStyle(
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w400,
                        fontSize: 20)),
                centerTitle: true,
                actions: buildActions(),
                leading: buildLeading(),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(15))),
              ),
        bottomNavigationBar: (Platform.isLinux ||
                Platform.isMacOS ||
                Platform.isWindows)
            ? null
            : CustomBottomBar(
                children: [
                  IconButton(
                      tooltip: "Notes",
                      icon: Icon(Icons.note_add_outlined),
                      onPressed: () {},
                      iconSize: 30,
                      padding: EdgeInsets.only(left: 35, top: 15, bottom: 15)),
                  IconButton(
                      tooltip: "Time Track",
                      icon: Icon(Icons.access_time),
                      onPressed: () {},
                      iconSize: 30,
                      padding: EdgeInsets.only(right: 35, top: 15, bottom: 15)),
                ],
              ),
        floatingActionButton:
            (Platform.isLinux || Platform.isMacOS || Platform.isWindows)
                ? FloatingActionButton.extended(
                    backgroundColor: Colors.amber[200],
                    foregroundColor: Colors.black,
                    label: Row(
                      children: [
                        Icon(Icons.mic),
                        Text("Click here to call the assistant")
                      ],
                    ),
                    onPressed: () {},
                  )
                : FloatingActionButton(
                    backgroundColor: Colors.amberAccent,
                    foregroundColor: Colors.black,
                    child: Icon(Icons.mic),
                    onPressed: () {},
                  ),
        floatingActionButtonLocation:
            (Platform.isLinux || Platform.isMacOS || Platform.isWindows)
                ? FloatingActionButtonLocation.endFloat
                : FloatingActionButtonLocation.centerDocked,
        body: (Platform.isLinux || Platform.isMacOS || Platform.isWindows)
            ? desktopBody()
            : HomeBody());
  }

  Widget desktopBody() {
    return Stack(
      children: [
        Positioned(top: 100, left: 300, right: 0, bottom: 0, child: TabBarView(controller: tabController,children: [
          HomeBody(),
          HomeBody(),
          HomeBody(),
          FsDisplay(FsThree(Directory.current.path)),
          HomeBody(),
        ],)),
        Positioned(
            top: 80,
            left: 300,
            right: 0,
            child: Center(
                child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(offset: Offset.fromDirection(10))]),
              child: Center(
                  child: TabBar(
                indicatorWeight: 3,
                labelPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                controller: tabController,
                unselectedLabelStyle: TextStyle(color: Colors.grey[700]),
                isScrollable: true,
                tabs: <Widget>[
                  Tab(
                    child: Text("Year"),
                  ),
                  Tab(
                    child: Text("Semester"),
                  ),
                  Tab(
                    child: Text("Month"),
                  ),
                  Tab(
                    child: Text("Week"),
                  ),
                  Tab(
                    child: Text("Day"),
                  ),
                ],
                onTap: (value) {
                  tabController.animateTo(value,
                      duration: Duration(seconds: 2));
                },
              )),
            ))),
        Positioned(
            top: 0,
            left: 300,
            right: 0,
            child: AppBar(
                elevation: 0,
                leading: buildLeading(),
                leadingWidth: 100,
                actions: buildActions(),
                centerTitle: true,
                backgroundColor: Colors.amberAccent,
                toolbarHeight: 80,
                title: TextField(
                  enableInteractiveSelection: true,
                  smartDashesType: SmartDashesType.enabled,
                  smartQuotesType: SmartQuotesType.enabled,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: "Search Something",
                      hintStyle: TextStyle(color: Colors.grey[900]),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                  controller: textEditingController,
                  onChanged: (value) {},
                  onTap: () {},
                ))),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: Drawer(
              elevation: 2,
              child: Container(
                child: ListView(
                  children: [
                    DrawerHeader(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Colors.deepOrange[100],
                        Colors.amberAccent
                      ])),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 12.0,
                            left: 20.0,
                            child: Text("Camel Desktop",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 24)),
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      onLongPress: () {},
                      title: Row(
                        children: <Widget>[
                          Icon(Icons.analytics),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("analytics"),
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      onLongPress: () {},
                      title: Row(
                        children: <Widget>[
                          Icon(Icons.book),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("Notes"),
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      onLongPress: () {},
                      title: Row(
                        children: <Widget>[
                          Icon(Icons.timelapse),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("Time Tracking"),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {},
                      onLongPress: () {},
                      title: Row(
                        children: <Widget>[
                          Icon(Icons.search),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("Search"),
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      onLongPress: () {},
                      title: Row(
                        children: <Widget>[
                          Icon(Icons.logout),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("logout"),
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      onLongPress: () {},
                      title: Row(
                        children: <Widget>[
                          Icon(Icons.settings),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("Settings"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }

  List<Widget> buildActions() {
    return [
      IconButton(
          icon: Icon(Icons.search_sharp), onPressed: () {}, iconSize: 24),
      IconButton(icon: Icon(Icons.filter_list), onPressed: () {}, iconSize: 24)
    ];
  }

  Widget buildLeading() {
    return Icon(Icons.analytics_outlined);
  }
}
