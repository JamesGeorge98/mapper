import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:mapper/services/network_status_service.dart';
import 'package:mapper/services/shared_pre.dart';

import 'package:mapper/views/widgets/network_aware.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/login_model.dart';
import '../../services/login_service.dart';
import '../../services/network_status_service.dart';
import '../widgets/network_aware.dart';
import '../widgets/toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LoginRequestModel? requestModel;
  bool isLoading = false;
  bool invisible = false;

  @override
  void initState() {
    super.initState();
    requestModel = LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () {
          var message = "Are you sure want to exit ?";
          showDialog(
            context: context,
            builder: (_) => CustomDialogBox(message),
          );
          return Future.value(false);
        },
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 203, 228, 226),
          key: scaffoldKey,
          body: StreamProvider<NetworkStatus?>(
            initialData: NetworkStatus.Online,
            create: (context) =>
                NetworkStatusService().networkStatusController.stream,
            child: NetworkAwareWidget(
              onlineChild: SingleChildScrollView(
                child: Form(
                  key: globalFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: screenSize.height * 0.15),
                        child: Center(
                          child: SizedBox(
                              width: screenSize.width * 0.3,
                              height: screenSize.height * 0.3,
                              child: Image.asset(
                                  'assets/logo/navigation-logo.png')),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 20),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 27),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }

                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return "Please enter a valid email address";
                            }

                            return null;
                          },
                          onSaved: (input) {
                            requestModel?.email = input!;
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
                            floatingLabelStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                            labelText: 'Email id',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 0),
                        child: TextFormField(
                          onSaved: (input) {
                            requestModel?.password = input!;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'password cannot be black';
                            }
                            return null;
                          },
                          obscureText: invisible,
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
                            floatingLabelStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
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
                            labelText: 'Password',
                          ),
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
                              if (validateAndSave()) {
                                setState(() {
                                  isLoading = true;
                                });
                                APILoginService apiSignUpService =
                                    APILoginService();
                                apiSignUpService
                                    .login(requestModel!)
                                    .then((value) {
                                  setState(() {
                                    if (value.status == true) {
                                      var email = requestModel!.email;
                                      saveEmailPreference(email!);
                                      Navigator.pushNamed(context, "homepage");
                                      isLoading = false;
                                    } else {
                                      var message = value.msg;
                                      openDialog(context, message);
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  });
                                });
                              } else {
                                var message = "Fill All Fields";
                                openDialog(context, message);
                              }
                            },
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white)
                                : const Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: (Text(
                                "Skip for Now?",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              )),
                            ),
                            Flexible(
                              child: RichText(
                                  text: TextSpan(
                                      text: "Guest Account",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 16),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushReplacementNamed(
                                              context, "guest");
                                        })),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
                                child: const Divider(
                                  color: Colors.black,
                                  height: 36,
                                )),
                          ),
                          const Text(
                            'Dont have an account',
                          ),
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 20.0),
                                child: const Divider(
                                  color: Colors.black,
                                  height: 36,
                                )),
                          ),
                        ],
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
                              Navigator.pushReplacementNamed(context, "signup");
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              offlineChild: const Center(),
            ),
          ),
        ));
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
