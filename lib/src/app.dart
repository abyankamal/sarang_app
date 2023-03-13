import 'package:flutter/material.dart';
import 'package:sarang_app/src/features/autentication/data/data_user_account_local.dart';
import 'package:sarang_app/src/features/autentication/presentation/sign_up_age_job_screen.dart';
import 'package:sarang_app/src/features/autentication/presentation/sign_up_screen.dart';
import 'package:sarang_app/src/features/autentication/presentation/sign_up_upload_photo_screen.dart';
import 'package:sarang_app/src/features/likes_you/presentation/explore_people_screen.dart';
import 'package:sarang_app/src/features/likes_you/presentation/people_loved_screen.dart';
import 'package:sarang_app/src/features/likes_you/presentation/people_profile_screen.dart';
import 'package:sarang_app/src/theme_manager/theme_data_manager.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({
    super.key,
  });

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  bool isRegister = false;

  isUserRegister() async {
    isRegister = await UserAccountRegister.getUserAccountRegister();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    isUserRegister();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: getApplicationThemeData(),
      home: isRegister ? ExplorePeopleScreen() : SignUpScreen(),
      routes: {
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        SignUpUploadPhotoScreen.routeName:(context) => const SignUpUploadPhotoScreen(),
        ExplorePeopleScreen.routeName:(context) => const ExplorePeopleScreen(),
        PeopleLovedScreen.routeName:(context) => const PeopleLovedScreen(),
        PeopleProfileScreen.routeName:(context) => const PeopleProfileScreen(),
      },
    );
  }
}