import 'package:flutter/cupertino.dart';

Widget buildPage(int index) {
  List<Widget> widgets = const [
    Center(child: Text('Home')),
    Center(child: Text('Search')),
    Center(child: Text('Course')),
    Center(child: Text('Chat')),
    Center(child: Text('Profile')),
  ];

  return widgets[index];
}
