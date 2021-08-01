import 'package:classroom/model/class_model.dart';
import 'package:classroom/model/subjects_.dart';
import 'package:classroom/screens/classroom_list.dart';
import 'package:classroom/screens/students_list.dart';
import 'package:classroom/screens/subject_list.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _pages = <Widget>[
    StudentsList(),
    FirstScreen(),
    SubjectList(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Students',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.class_),
            label: 'Class',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subject),
            label: 'Subjects',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
