// import 'package:coin/services/shared_prefs.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // void checkLogin() {
  //   getUuidPreference().then((value) {
  //     if (value != null) {
  //       Navigator.pushReplacementNamed(context, "homepage");
  //     } else {
  //       Navigator.pushReplacementNamed(context, "login");
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = PageController();
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 203, 228, 226),
        body: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            // Positioned(
            //   top: -30,
            //   right: -10,
            //   child: Image(
            //     image: const AssetImage("assets/logo/navigation-logo.png"),
            //     width: screenSize.width * 1.2,
            //     height: screenSize.height * 0.5,
            //     fit: BoxFit.contain,
            //   ),
            // ),
            // Positioned(
            //   bottom: -150,
            //   left: -100,
            //   child: Image(
            //     image: const AssetImage("assets/logo/navigation-logo.png"),
            //     width: screenSize.width,
            //     height: screenSize.height * 0.5,
            //     fit: BoxFit.contain,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 220),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Center(
                    child: Image(
                        image: AssetImage("assets/logo/navigation-logo.png"),
                        fit: BoxFit.fill,
                        width: 150,
                        height: 150),
                  ),
                  Spacer(),
                  Text(
                    "Welcome to Mapper",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 30),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(45),
                      padding: const EdgeInsets.all(5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 48, 156, 210),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "loginpage");
                        },
                        child: Text(
                          "GET STARTED",
                          style:
                              TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
