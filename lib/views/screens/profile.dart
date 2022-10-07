import 'dart:async';

import "package:flutter/material.dart";
import 'package:mapper/services/profile_services.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? _password;
  String? _username;
  String? _address;
  String? _email;
  bool _isLoading = false;
  bool invisible = true;

  @override
  void initState() {
    super.initState();
    ProfileApiService profileapiservice = ProfileApiService();
    profileapiservice.profile().then((value) {
      setState(() {
        _username = value.name;
        _password = value.password;
        _email = value.email;
        _address = value.address;
        _isLoading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 25, 5, 5),
      child: Center(
          child: _isLoading
              ? ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                      child: TextFormField(
                        controller: TextEditingController()..text = _email!,
                        enabled: false,
                        decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0)),
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
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 2.0))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                      child: TextFormField(
                        controller: TextEditingController()..text = _username!,
                        onChanged: (value) {
                          _username = value;
                        },
                        decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0)),
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
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 2.0))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                      child: TextFormField(
                        controller: TextEditingController()..text = _address!,
                        onChanged: (value) {
                          _address = value;
                        },
                        decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0)),
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
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 2.0))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                      child: TextFormField(
                        obscureText: invisible,
                        controller: TextEditingController()..text = _password!,
                        onChanged: (value) {
                          _password = value;
                        },
                        decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0)),
                            prefixIcon: Icon(
                              Icons.person,
                              size: 30,
                              color: Theme.of(context).primaryColor,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                invisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
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
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 2.0))),
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
                            ProfileUpdateApiService apiSignUpService =
                                ProfileUpdateApiService();
                            apiSignUpService
                                .profileupdate(
                                    _email, _password, _address, _username)
                                .then((value) {
                              setState(() {
                                _isLoading = false;
                              });
                              Timer.periodic(const Duration(seconds: 2),
                                  (callback) {
                                setState(() {
                                  _isLoading = true;
                                });
                                Fluttertoast.showToast(
                                    msg: 'Updated Succesfully',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.SNACKBAR,
                                    backgroundColor: Colors.black54,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                    timeInSecForIosWeb: 1);
                                callback.cancel();
                              });
                            });
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
                )
              : CircularProgressIndicator(
                  color: Theme.of(context).primaryColor)),
    );
  }
}
