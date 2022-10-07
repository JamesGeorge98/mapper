// ignore_for_file: must_be_immutable

// import 'package:coin/services/dashboard_service.dart';
// import 'package:coin/services/shared_prefs.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/profile_services.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  int index = 0;

  CustomAppBar(this.index, {Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _CustomAppBarState extends State<CustomAppBar> {
  String _username = "User";
  String? _starColor;

  getColors() {
    if (_starColor == "0") {
      return Colors.green;
    } else if (_starColor == "1") {
      return Colors.red;
    } else if (_starColor == "2") {
      return Colors.yellow;
    }
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  @override
  void initState() {
    super.initState();
    ProfileApiService profileapiservice = ProfileApiService();
    profileapiservice.profile().then((value) {
      setState(() {
        _username = value.name;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      bottomOpacity: 0.0,
      elevation: 0.0,
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      leading: Icon(
        Icons.account_circle_outlined,
        size: 40,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Good ${greeting()}".toUpperCase(),
                  style: const TextStyle(fontSize: 15)),
              SizedBox(
                height: 10,
              ),
              Text(_username.toUpperCase(),
                  style: const TextStyle(fontSize: 18))
            ],
          ),
          PopupMenuButton(
              itemBuilder: (_) => [
                    PopupMenuItem(
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.clear();
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(context, 'loginpage');
                        },
                        child: Text("Log Out"))
                  ])
        ],
      ),
    );
  }
}
