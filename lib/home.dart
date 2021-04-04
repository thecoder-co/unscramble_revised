import 'dart:ui';
import 'dart:async' show Future;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  String _value = '';
  List _foundWords = [];
  List _foundWords3 = [];
  List _foundWords4 = [];
  List _foundWords5 = [];
  List _foundWords6 = [];
  List _foundWords7 = [];
  List<List> _words = [];

  void _onSubmit(String value) {
    setState(() => _value = value);
  }

  void _onChange(String value) {
    setState(() => _value = value);
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/texts/words_alpha.txt');
  }

  List<Widget> _widgetOptions() => <Widget>[
        _OptionOne(
          onUnscramble: () async {
            print(_value);
            List _toList(String lily) {
              List a = [];
              for (var i = 0; i < lily.length; i++) {
                a.add(lily[i]);
              }

              return a;
            }

            int freql(var w, List lst) {
              int count = 0;
              for (var i = 0; i < lst.length; i++) {
                if (lst[i] == w) {
                  count += 1;
                }
              }
              return count;
            }

            bool isin(String lily, String ylil) {
              List a = _toList(lily);
              List b = _toList(ylil);
              for (var i = 0; i < a.length; i++) {
                if (!b.contains(a[i])) {
                  return false;
                }
              }
              for (var i = 0; i < a.length; i++) {
                if (freql(a[i], a) > freql(b[i], b)) {
                  return false;
                }
              }
              return true;
            }

            List foundWords = [];
            String fileContent = await loadAsset();
            List wordList = fileContent.split('\n');
            List necessaryWords = [];

            for (String i in wordList) {
              List lst = Iterable<int>.generate(_value.length + 1).toList();
              if (lst.contains(i.length)) {
                necessaryWords.add(i);
              }
            }

            for (var j in necessaryWords) {
              if (isin(j, _value)) {
                foundWords.add(j);
              }
            }
            setState(() {
              _foundWords = [];
              _foundWords3 = [];
              _foundWords4 = [];
              _foundWords5 = [];
              _foundWords6 = [];
              _foundWords7 = [];
            });
            _foundWords = foundWords;
            for (var i in foundWords) {
              if (i.length == 3) {
                _foundWords3.add(i);
              } else if (i.length == 4) {
                _foundWords4.add(i);
              } else if (i.length == 5) {
                _foundWords5.add(i);
              } else if (i.length == 6) {
                _foundWords6.add(i);
              } else if (i.length == 7) {
                _foundWords7.add(i);
              }
            }
            _words.add(_foundWords3);
            _words.add(_foundWords4);
            _words.add(_foundWords5);
            _words.add(_foundWords6);
            _words.add(_foundWords7);
            _words.add(_foundWords);
          },
          onChange: _onChange,
          onSubmit: _onSubmit,
        ),
        _OptionTwo(
          value: _value,
          words: _words,
        )
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        appBar: PreferredSize(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15,
                sigmaY: 15,
              ),
              child: AppBar(
                backgroundColor: Colors.white.withOpacity(0.3),
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
                backgroundColor: Colors.white.withOpacity(0.3),
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
    );
  }
}

class _OptionOne extends StatelessWidget {
  final Function onUnscramble;
  final Function onChange;
  final Function onSubmit;

  _OptionOne({this.onUnscramble, this.onChange, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Input Letters',
                        ),
                        autocorrect: true,
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        onSubmitted: onSubmit,
                        onChanged: onChange,
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
  final String value;
  final List<List> words;

  _OptionTwo({
    this.value = '',
    this.words,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('3 Letter words'),
            SizedBox(
              height: 10,
            ),
            Center(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 6,
                separatorBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text('${index + 4} Letter Words'),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
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
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                          ),
                          child: Container(
                            height: words[index].length == 0 ? 75 : 300,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.separated(
                                itemCount: words[index].length,
                                separatorBuilder: (context, index) => Divider(
                                  color: Colors.white,
                                ),
                                itemBuilder: (context, index1) => Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                    child: ListTile(
                                      onLongPress: () {
                                        Clipboard.setData(
                                          ClipboardData(
                                            text: words[index][index1],
                                          ),
                                        );
                                        Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                '${words[index][index1]} copied to clipboard'),
                                          ),
                                        );
                                      },
                                      dense: true,
                                      title: Center(
                                        child: Text(
                                          words[index][index1],
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
