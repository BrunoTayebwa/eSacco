import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'custom_button.dart';

//code for designing the UI of our text field where the user writes his email id or password

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

class RegisterKibiina extends StatefulWidget {
  @override
  _RegisterKibiinaState createState() => _RegisterKibiinaState();
}

class _RegisterKibiinaState extends State<RegisterKibiina> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;
  late TextEditingController _passController, _confPassController;
  Color? buttonColor = Colors.grey[800];
  Color confPasswordColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _passController = TextEditingController();
    _confPassController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                const Text(
                  'Enter the name of the savings Groups: ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                      //Do something with the user input.
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter name of savings Group.')),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                const Text(
                  'Location:',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                      //Do something with the user input.
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter location of savings group')),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                const Text(
                  'Email:',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                      //Do something with the user input.
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your email')),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                const Text(
                  'Password:',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                TextField(
                    obscureText: true,
                    controller: _passController,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                      //Do something with the user input.
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your Password')),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                Text(
                  'Confirm Password:',
                  style: TextStyle(
                    color: confPasswordColor,
                  ),
                ),
                TextField(
                    obscureText: true,
                    controller: _confPassController,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        confPasswordColor = Colors.red;
                      });
                      if ((_passController.text == _confPassController.text) &&
                          (_passController.text.isNotEmpty &&
                              _confPassController.text.isNotEmpty)) {
                        setState(() {
                          confPasswordColor = Colors.green;
                          buttonColor = Colors.purple;
                        });
                        password = value;
                      } else {
                        setState(() {
                          buttonColor = Colors.grey[800];
                        });
                      }
                      //Do something with the user input.
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: confPasswordColor, width: 3.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        hintText: 'Re-enter your Password for confirmation')),
                const SizedBox(
                  height: 24.0,
                ),
                Center(
                    child: RoundedButton(
                  colour: buttonColor,
                  title: 'Sign Up',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      if (_passController.text == _confPassController.text) {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (newUser != null) {
                          Navigator.pushNamed(context, 'home_Kibiina');
                        }
                      }
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  },
                )),
              ],
            ),
          )),
    );
  }

  void dispose() {
    _passController.dispose();
    _confPassController.dispose();
  }
}
