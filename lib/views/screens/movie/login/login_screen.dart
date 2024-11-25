import 'package:flutter/material.dart';

import '../../../mixins/auth_mixin.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/app_scaffold.dart';
import '../../../widgets/app_text_form_field.dart';
import '../../../widgets/app_texts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with AuthMixin<LoginScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: ApplicationAppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            AppTextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone Number',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await sendOtp(phoneNo: _controller.text);
              },
              child: const AppText('Send OTP'),
            )
          ],
        ),
      ),
    );
  }
}
