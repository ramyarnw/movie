import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../movie/movie/movie_home_page.dart';
import 'splash_screen.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  late bool newLaunch;

  @override
  void initState() {
    super.initState();
    loadNewLaunch();
  }

  Future<void> loadNewLaunch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('newLaunch', false);
      final bool newL = prefs.getBool('newLaunch') ?? true;
      if (kDebugMode) {
        print('newLaunch:');
      }
      if (kDebugMode) {
        print(newL);
      }
      newLaunch = newL;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: newLaunch ? const MovieHomePage() : const SplashScreen());
  }
}
