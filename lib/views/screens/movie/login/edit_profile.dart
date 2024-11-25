import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../model/auth_user.dart';
import '../../../../provider/provider_utils.dart';
import '../../../../view_model/app_view_model.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/app_image.dart';
import '../../../widgets/app_scaffold.dart';
import '../../../widgets/app_text_form_field.dart';
import '../../../widgets/app_texts.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  AuthUser user = AuthUser(
    (AuthUserBuilder b) => b
      ..name = ''
      ..phoneNo = ''
    ..id =''
  );

  @override
  void initState()   {
    super.initState();
    user = context.appViewModel.getState().currentUser!;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: ApplicationAppBar(
          title: const AppText('Edit profile'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () async {
                  final AppViewModel appViewModel = context
                      .appViewModel;
                  final XFile? file = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (file == null) {
                    return;
                  }
                  final Uint8List bytes = await file.readAsBytes();
                  await appViewModel
                      .updateProfile(file: bytes, user: user);
                },
                child: CircleAvatar(
                  child: user.profile?.isNotEmpty ?? false
                      ? AppImage.network(user.profile!)
                      : AppText(user.name.toString()),
                ),
              ),
              AppTextFormField(
                initialValue: user.name,
                onChanged: (String s) {
                  user = user.rebuild((AuthUserBuilder p) => p.name = s);
                  setState(() {});
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              AppTextFormField(
                enabled: false,
                initialValue: user.phoneNo,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone number',
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<AppViewModel>().updateUser(user: user);
                  },
                  child: const AppText('Update User'))
            ],
          ),
        ));
  }
}
