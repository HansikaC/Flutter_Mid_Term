import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_assignment_3/authentication.dart';
import 'package:mad_assignment_3/screens/current_chats.dart';
import 'package:mad_assignment_3/screens/logout.dart';
import 'package:mad_assignment_3/screens/profile.dart';

import 'newconv.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    ChatPage(),
    Profile(),
    Logout(),

  ];
  void _onItemTapped(int index){
    setState((){
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add),
        backgroundColor: Colors.blueGrey,onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>newConv()));},),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text("Chats"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text("Profile"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            title: Text("Logout"),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black45,
        onTap: _onItemTapped,
      ),

    );
  }
}
