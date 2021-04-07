import 'dart:ui';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
//import 'package:flutter_mobile_vision/flutter_mobile_vision.dart' hide Size;
import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  Grid({Key key}) : super(key: key);

  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  int _selectedIndex = 0;

  String _fileState = 'No Picture Chosen';

  String _result;

  File _file;

  _onSubmit() {}

  _onChange() {
    setState(() {
      _fileState = 'Picture Chosen From Camera';
    });
  }

  _chooseFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    File file;

    if (result != null) {
      file = File(result.files.single.path);
      print(file.toString());
      setState(() {
        _fileState = 'File Chosen From Files';
        _file = file;
      });
    }
  }

  _onUnscramble() {}

  List<Widget> _widgetOptions() => <Widget>[
        _OptionOne(
          onUnscramble: _onUnscramble,
          onChange: _onChange,
          onSubmit: _onSubmit,
          fileState: _fileState,
          chooseFile: _chooseFile,
        ),
        _OptionTwo()
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            child: _widgetOptions().elementAt(_selectedIndex),
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
                  onTap: _onItemTapped,
                  currentIndex: _selectedIndex,
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

class _OptionOne extends StatelessWidget {
  final String fileState;
  final Function onSubmit;
  final Function onChange;
  final Function onUnscramble;
  final Function chooseFile;
  _OptionOne(
      {this.onUnscramble,
      this.onChange,
      this.onSubmit,
      this.fileState,
      this.chooseFile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 24,
              spreadRadius: 3,
              color: Colors.black.withOpacity(0.2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 40.0,
              sigmaY: 40.0,
            ),
            child: Container(
              height: 450,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
              ),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        height: 250,
                        child: Container(
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            child: Text(
                              'Choose File',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                              ),
                            ),
                            onPressed: () async {
                              await chooseFile();
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.camera_alt_rounded),
                            onPressed: null,
                          ),
                          TextButton(
                            child: Text(
                              'Unscramble',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                              ),
                            ),
                            onPressed: () async {
                              await onUnscramble();
                            },
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      fileState,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _OptionTwo extends StatelessWidget {
  const _OptionTwo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('OptionTwo'),
    );
  }
}
