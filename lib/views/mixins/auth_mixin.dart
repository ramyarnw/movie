import '../../ui.dart';
import '../navigation/app_routes.dart';

mixin AuthMixin<T extends StatefulWidget> on State<T> {
  Future<void> sendOtp({required String phoneNo}) async {
    //final NavigatorState n = Navigator.of(context);
    final ScaffoldMessengerState a = ScaffoldMessenger.of(context);
    try {
      final String vid = await context.appViewModel.sendOtp(phoneNo: phoneNo);
      context.go(LoginVerifyScreenRoute(vid).location);
      // n.push(
      //   MaterialPageRoute<void>(
      //       builder: (BuildContext context) => LoginVerifyScreen(
      //             vid: vid,
      //           )),
      // );
    } catch (e) {
      a.showSnackBar(
        SnackBar(
          content: AppText(
            e.toString(),
          ),
        ),
      );
    }
  }

  Future<void> verifyOtp({required String smsCode, required String vid}) async {
    //final NavigatorState n = Navigator.of(context);
    final ScaffoldMessengerState a = ScaffoldMessenger.of(context);
    try {
      await context.appViewModel.verifyOtp(smsCode: smsCode, vid: vid);
      context.go(MovieHomePageRoute().location);
      // n.push(
      //   MaterialPageRoute<void>(
      //       builder: (BuildContext context) => const MovieHomePage()),
      // );
    } catch (e) {
      a.showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }
}
