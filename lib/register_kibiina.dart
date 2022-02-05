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
  int _selectedYear = DateTime.now().year;

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
                  'Year of establishment:',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                DropdownButtonFormField(
                    value: _selectedYear,
                    hint: const Text(
                      'Enter the date of establishment.',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    items: <int>[
                      2022,
                      2021,
                      2020,
                      2019,
                      2018,
                      2017,
                      2016,
                      2015,
                      2013,
                      2012,
                      2011,
                      2010,
                      2009,
                      2008,
                      2007,
                      2006,
                      2005,
                      2004,
                      2003,
                      2002,
                      2001,
                      2000,
                      1999,
                      1998,
                      1997,
                      1996,
                      1995,
                      1994,
                      1993,
                      1992,
                      1991,
                      1990,
                      1989,
                      1988,
                      1987,
                      1986,
                      1985,
                      1984,
                      1983,
                      1982,
                      1981,
                      1980,
                      1979,
                      1978,
                      1977,
                      1976,
                      1975,
                      1974,
                      1973,
                      1972,
                      1971,
                      1970,
                      1969,
                      1968,
                      1967,
                      1966,
                      1965,
                      1964,
                      1963,
                      1962,
                      1961,
                      1960,
                      1959,
                      1958,
                      1957,
                      1956,
                      1955,
                      1954,
                      1953,
                      1952,
                      1951,
                      1950,
                      1949,
                      1948,
                      1947,
                      1946,
                      1945,
                      1944,
                      1943,
                      1942,
                      1941,
                      1940,
                      1939,
                      1938,
                      1937,
                      1936,
                      1935,
                      1934,
                      1933,
                      1932,
                      1931,
                      1930,
                      1929,
                      1928,
                      1927,
                      1926,
                      1925,
                      1924,
                      1923,
                      1922,
                      1921,
                      1920,
                      1919,
                      1918,
                      1917,
                      1916,
                      1915,
                      1914,
                      1913,
                      1912,
                      1911,
                      1910,
                      1909,
                      1908,
                      1907,
                      1906,
                      1905,
                      1904,
                      1903,
                      1902,
                      1901,
                      1900
                    ].map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(
                          value.toString(),
                          style: const TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      );
                    }).toList(growable: true),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedYear = newValue as int;
                      });
                    }),
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
