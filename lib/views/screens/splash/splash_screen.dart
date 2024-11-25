import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ui.dart';
import '../../navigation/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> resetNewLaunch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (kDebugMode) {
      print('SplashScreen:');
    }
    if (kDebugMode) {
      print(prefs.getBool('newLaunch'));
    }
    await prefs.setBool('newLaunch', true);
    if (kDebugMode) {
      print(prefs.getBool('newLaunch'));
    }
  }

  @override
  void initState() {
    super.initState();
    context.appViewModel.init();
    //resetNewLaunch();
    //Navigator.of(context);
    Future<dynamic>.delayed(const Duration(seconds: 2), () {
      resetNewLaunch();
      return context.go(MovieHomePageRoute().location);
        //n.push(MaterialPageRoute<dynamic>(builder: (BuildContext context) {
       // return const MovieHomePage();
      //}));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              color: Colors.white,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Movie App',
                        style: TextStyle(color: Colors.blue, fontSize: 40)),
                AppProgressIndicator(),
                  ],
                ),
              ))),
    );
  }
}
