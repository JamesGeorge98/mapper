// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class CustomDialogBox extends StatefulWidget {
  String? message;
  bool pressed = true;

  CustomDialogBox(this.message, {Key? key}) : super(key: key);

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _controller.reverse();
        return Future.value(true);
      },
      child: Material(
        color: Colors.transparent,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
              position: _offsetAnimation,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Alert",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Text(widget.message!,
                            style: const TextStyle(fontSize: 18)),
                        const Divider(color: Colors.black),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () async {
                               
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _controller.reverse();
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

openDialog(context, message) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
          elevation: 100,
          actionsAlignment: MainAxisAlignment.center,
          alignment: Alignment.center,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Alert"),
              ),
              Text(
                message,
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ],
            )
          ],
        ));

exitDialog(context, message) => showDialog(
    context: context,
    builder: (_) => AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: const EdgeInsets.all(10),
          content: Builder(
            builder: (context) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var screenSize = MediaQuery.of(context).size;
              return SizedBox(
                width: screenSize.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Alert",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(message, style: const TextStyle()),
                    const Divider(color: Colors.black),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () async {
                            
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ));
