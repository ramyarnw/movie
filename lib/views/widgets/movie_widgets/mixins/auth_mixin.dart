import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../view_model/app_view_model.dart';
import '../../../screens/app/movie_home_page.dart';
import '../../../screens/login/login_verify_screen.dart';

mixin AuthMixin<T extends StatefulWidget> on State<T> {
  Future<void> sendOtp({required String phoneNo}) async {
    try {
      final String vid =
          await context.read<AppViewModel>().sendOtp(phoneNo: phoneNo);
      Navigator.push(
          context,
          LoginVerifyScreen(
            vid: vid,
          ) as Route<Object?>);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  Future<void> verifyOtp({required String smsCode, required String vid}) async {
    try {
      await context.read<AppViewModel>().verifyOtp(smsCode: smsCode, vid: vid);
      Navigator.push(context, const MovieHomePage() as Route<Object?>);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }
}
