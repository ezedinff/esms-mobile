import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.infoCircle, size: 20),
            title: Text('Overview')),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.briefcase, size: 20),
            title: Text('Projects')),
      ].toList(),
      fixedColor: Colors.deepPurple[200],
      onTap: (int idx) {
        switch (idx) {
          case 0:
            // do nuttin
            break;
          case 1:
            Navigator.pushNamed(context, '/projects');
            break;
        }
      },
    );
  }
}