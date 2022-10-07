import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mapper/views/screens/location.dart';
import 'package:mapper/views/widgets/appbar.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({Key? key}) : super(key: key);

  @override
  State<GuestPage> createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  var _currrentindex = 0;
  final screens = <Widget>[Profile(), Location()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(0),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() {
                _currrentindex = index;
              }),
          currentIndex: _currrentindex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.details), label: "Details"),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_history), label: "Location")
          ]),
      body: screens[_currrentindex],
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

bool invisible = true;
var _email = "james";
var _password = "james";
var _address = "so and so";
var _username = "james";

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 25, 5, 5),
      child: Center(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: TextFormField(
              controller: TextEditingController()..text = _email,
              enabled: false,
              decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0)),
                  prefixIcon: Icon(
                    Icons.mail,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  label: const Text("Email ID"),
                  labelStyle: const TextStyle(color: Colors.black),
                  hintStyle: const TextStyle(color: Colors.black),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: TextFormField(
              controller: TextEditingController()..text = _username,
              onChanged: (value) {
                _username = value;
              },
              decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0)),
                  prefixIcon: Icon(
                    Icons.person,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  label: const Text("Username"),
                  labelStyle: const TextStyle(color: Colors.black),
                  hintStyle: const TextStyle(color: Colors.black),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: TextFormField(
              controller: TextEditingController()..text = _address,
              onChanged: (value) {
                _address = value;
              },
              decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0)),
                  prefixIcon: Icon(
                    Icons.map,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  label: const Text("address"),
                  labelStyle: const TextStyle(color: Colors.black),
                  hintStyle: const TextStyle(color: Colors.black),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: TextFormField(
              obscureText: invisible,
              controller: TextEditingController()..text = _password,
              onChanged: (value) {
                _password = value;
              },
              decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0)),
                  prefixIcon: Icon(
                    Icons.person,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      invisible ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        invisible = !invisible;
                      });
                    },
                  ),
                  label: const Text("password"),
                  labelStyle: const TextStyle(color: Colors.black),
                  hintStyle: const TextStyle(color: Colors.black),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0))),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,
              ),
              child: TextButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: 'Log In To Display Account',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.SNACKBAR,
                      backgroundColor: Colors.black54,
                      textColor: Colors.white,
                      fontSize: 16.0,
                      timeInSecForIosWeb: 1);
                },
                child: const Text(
                  "Update Profile",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
        padding: const EdgeInsets.all(10),
      )),
    );
  }
}
