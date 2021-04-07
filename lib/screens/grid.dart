import 'dart:ui';
//import 'package:flutter_mobile_vision/flutter_mobile_vision.dart' hide Size;
import 'package:flutter/material.dart';


class Grid extends StatefulWidget {
  Grid({Key key}) : super(key: key);

  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple,
              Colors.indigo,
            ],
          ),
        ),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          backgroundColor: Colors.white.withOpacity(0),
          drawerScrimColor: Colors.transparent,
          drawer: Container(
            width: 300,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(31, 38, 135, 0.4),
                  blurRadius: 8.0,
                )
              ],
            ),
            child: Stack(
              children: [
                SizedBox(
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 4.0,
                        sigmaY: 4.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Colors.grey.withOpacity(0.0),
                          Colors.white.withOpacity(0.2),
                        ])),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    DrawerHeader(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20.0,
                          ),
                          Text("User Name")
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/home', (Route<dynamic> route) => false);
                            },
                            leading: Icon(
                              Icons.home,
                              color: Colors.black,
                            ),
                            title: Text("Home"),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/grid', (Route<dynamic> route) => false);
                            },
                            leading: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            title: Text("Grid"),
                          ),
                          ListTile(
                            onTap: () {},
                            leading: Icon(
                              Icons.settings,
                              color: Colors.black,
                            ),
                            title: Text("Settings"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          appBar: PreferredSize(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 15,
                  sigmaY: 15,
                ),
                child: AppBar(
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white.withOpacity(0.2),
                  title: Text(
                    'Unscramble',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  elevation: 0,
                ),
              ),
            ),
            preferredSize: Size(
              double.infinity,
              56.0,
            ),
          ),
          body: Center(
            child: Text('grid'), //_widgetOptions().elementAt(_selectedIndex),
          ),
          bottomNavigationBar: PreferredSize(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 15,
                  sigmaY: 15,
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  selectedItemColor: Colors.black,
                  /*onTap: _onItemTapped,
                currentIndex: _selectedIndex,*/
                  elevation: 0,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.pending_actions),
                      label: 'Unscramble',
                    ),
                  ],
                ),
              ),
            ),
            preferredSize: Size(
              double.infinity,
              56.0,
            ),
          ),
        ),
      ),
    );
  }
}
