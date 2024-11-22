import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../view_model/app_view_model.dart';
import '../../../screens/app/movie_home_page.dart';
import '../../../screens/login/login_verify_screen.dart';

mixin AuthMixin<T extends StatefulWidget> on State<T> {
  Future<void> sendOtp({required String phoneNo}) async {
    final NavigatorState n = Navigator.of(context);
    final ScaffoldMessengerState a = ScaffoldMessenger.of(context);
    try {
      final String vid = await context.appViewModel.sendOtp(phoneNo: phoneNo);
      n.push(
        MaterialPageRoute<void>(
            builder: (BuildContext context) => LoginVerifyScreen(
                  vid: vid,
                )),
      );
    } catch (e) {
      a.showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  Future<void> verifyOtp({required String smsCode, required String vid}) async {
    final NavigatorState n = Navigator.of(context);
    final ScaffoldMessengerState a = ScaffoldMessenger.of(context);
    try {
      await context.read<AppViewModel>().verifyOtp(smsCode: smsCode, vid: vid);
      n.push(
        MaterialPageRoute<void>(
            builder: (BuildContext context) => const MovieHomePage()),
      );
    } catch (e) {
      a.showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }
}
