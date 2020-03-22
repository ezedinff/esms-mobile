import 'package:esms/screens/screens.dart';
import 'package:esms/shared/item_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  bool isSwitched = false;
  final List<Widget> _children = [
    Overview(),
    ProjectScreen()
  ];
  onTabTapped(index) {
    setState(() {
      this._currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        title: Text('EzSMS'),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        elevation: 1,
        actions: <Widget>[
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                print(isSwitched);
              });
            },
            activeTrackColor: Colors.deepPurple[200],
            activeColor:  Colors.deepPurple[700],
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.infoCircle, size: 20),
              title: Text('Overview')),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.briefcase, size: 20),
              title: Text('Projects')),
        ].toList(),
        selectedItemColor: Colors.deepPurple[200],
        unselectedItemColor: Colors.white,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        onTap: (int idx) => onTabTapped(idx)
      ),
    );
  }
}