import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'custom_button.dart';

late User loggedinUser;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  //using this function you can use the credentials of the user
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
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
          backgroundColor: Colors.grey[800],
        ),
        backgroundColor: Colors.grey[800],
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RoundedButton(
                  colour: Colors.greenAccent[400],
                  title: 'Register New Savings Group',
                  onPressed: () {
                    Navigator.pushNamed(context, 'register_kibiina');
                  },
                ),
                RoundedButton(
                    colour: Colors.purple,
                    title: 'Choose your Savings Group',
                    onPressed: () {
                      Navigator.pushNamed(context, 'choose_kibiina');
                    }),
              ]),
        ));
  }
}
