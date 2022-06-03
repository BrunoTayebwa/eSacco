import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  final _auth = FirebaseAuth.instance;

  static  List<Widget> _widgetOptions = <Widget>[
    Scaffold(
      backgroundColor: Colors.lightBlueAccent[50],
    ),
    Scaffold(
      backgroundColor: Colors.blue,
    ),
    Scaffold(
      backgroundColor: Colors.brown,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        leading: null,
        elevation: 7.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);

                //Implement logout functionality
              }),
        ],
        title: Text('Home Page'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar:
          // ignore: prefer_const_literals_to_create_immutables
          BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet), 
                label: 'Payments',
                ),
            BottomNavigationBarItem(
                icon: Icon(Icons.auto_graph_rounded),
                label: 'Facts and Figures',
                ),
            BottomNavigationBarItem(
                icon: Icon(Icons.money_off_rounded), 
                label: 'Loans',
                )
          ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amberAccent[200],
              onTap: _onItemTapped,
              backgroundColor: Colors.indigo[900],
              unselectedItemColor: Colors.white70,
              selectedFontSize: 15.0,
              ),
    );
  }
}
