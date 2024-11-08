import 'dart:io';

import 'package:elusiv/core/common_widgets/test_widgets/go_named_back_button_testing.dart';
import 'package:elusiv/core/common_widgets/themed_text_field.dart';
import 'package:elusiv/core/localization/string_extensions.dart';
import 'package:elusiv/core/navigation/routing.dart';
import 'package:elusiv/core/theme/app_theme.dart';
import 'package:elusiv/features/authentication/presentation/widgets/login_register_button.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AdditionalInfoPage extends StatefulWidget {
  const AdditionalInfoPage({super.key});

  @override
  
  State<AdditionalInfoPage> createState() => _AdditionalInfoPageState();
}

class _AdditionalInfoPageState extends State<AdditionalInfoPage> {
  final usernameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  XFile? profileImage; // Add this variable

  Future<void> updateProfile(BuildContext context, String username, String phoneNumber, XFile profileImage) async {
    // Try updating the profile with pb, if successful nav to home, else show error
    if (username.isEmpty || phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill out all fields'.hardcoded)),
      );
      return;
    }
    final pb = Provider.of<PocketBase>(context, listen: false);

    // Add the profile image to the body

    //send to pb
    //final user = await pb.collection('users').authWithPassword("asd@gmail.com", "asdasdasd");
    final userId = pb.authStore.model.id;

    final body = {
      'username': username,
      'phoneNumber': phoneNumber,
    };
    final files = [
      http.MultipartFile.fromBytes('avatar', await profileImage.readAsBytes(), filename: '$userId-avatar.${profileImage.path.split('.').last}'),
    ];

    pb.collection('users').update(userId, body: body, files: files).then((_) {
      if (mounted) {
        context.goNamed(AppRoute.homePage.name);
      }
    }).catchError((error) {
      if (mounted) {
        //username already in use
        if (error.toString().contains('The username is invalid or already in use')) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Username already in use'.hardcoded)),
          );
          return;
        }
        if (error.toString().contains('Invalid value format')) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid Phone Number'.hardcoded)),
          );
          return;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.toString())),
          );
        }
      }
    });
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      profileImage = image;
    });
  }

  Widget wrap(Widget widget, double height) {
    return SizedBox(
      height: height,
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.75;
    const double heightPerObject = 75;

    return Scaffold(
      appBar: null,
      body: Center(
        child: SizedBox(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              wrap(Text('Finish your Profile Setup'.hardcoded, style: Theme.of(context).textTheme.headlineSmall), heightPerObject),
              wrap(
                const SizedBox(height: 20), // Add spacing
                heightPerObject,
              ),
              wrap(
                GestureDetector(
                  onTap: pickImage,
                  child: profileImage == null
                      ? Text('Pick Profile Image'.hardcoded, style: Theme.of(context).textTheme.bodyMedium)
                      : ClipOval(
                          child: Image.file(
                            File(profileImage!.path),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                100,
              ),
              wrap(
                const SizedBox(height: 20), // Add spacing
                heightPerObject,
              ),
              wrap(
                  ThemedTextField(
                    hintText: 'Username'.hardcoded,
                    controller: usernameController,
                  ),
                  heightPerObject),
                wrap(
                  ThemedTextField(
                  hintText: 'Phone Number'.hardcoded,
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  ),
                  heightPerObject),
              wrap(
                  LoginRegisterButton(
                    onTap: () {
                      if (profileImage != null) {
                        updateProfile(context, usernameController.text, phoneNumberController.text, profileImage!);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please select a profile image'.hardcoded)),
                        );
                      }
                    },
                    message: 'Update Profile'.hardcoded,
                    textStyle: titleStyleMedium,
                    padding: 4,
                    elevation: 4,
                  ),
                  heightPerObject),
            ],
          ),
        ),
      ),
    );
  }
}
