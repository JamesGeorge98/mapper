import 'package:flutter/material.dart';
import 'package:mapper/views/screens/location.dart';
import 'package:mapper/views/screens/profile.dart';
import 'package:mapper/views/widgets/appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currrentindex = 0;
  final screens = <Widget>[Profile(), Location()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 203, 228, 226),
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
                icon: Icon(Icons.location_history),label: "Location")
          ]),
      body: screens[_currrentindex],
    );
  }
}
