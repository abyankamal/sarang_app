import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/banner_widget.dart';
import 'package:sarang_app/src/common_widgets/costum_button_widget.dart';
import 'package:sarang_app/src/common_widgets/costum_tag_field.dart';
import 'package:sarang_app/src/features/autentication/domain/user_account.dart';
import 'package:sarang_app/src/features/autentication/presentation/sign_up_upload_photo_screen.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class SignUpAgeJobScreen extends StatefulWidget {
  static const String routeName = '/sign-up-age-job';
  const SignUpAgeJobScreen({
    super.key,
    required this.fullname,
    required this.email,
    required this.password
    });

  final String fullname;
  final String email;
  final String password;

  @override
  State<SignUpAgeJobScreen> createState() => _SignUpAgeJobScreenState();
}

class _SignUpAgeJobScreenState extends State<SignUpAgeJobScreen> {
  final jobController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void dispose() {
    jobController.clear();
    jobController.dispose();
    ageController.clear();
    ageController.dispose();
    super.dispose();
  }

  String? validationInput() {
    if(jobController.text.isEmpty || ageController.text.isEmpty){
      return 'Occupation or age cannot be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p50,
          horizontal: AppPadding.p24
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BannerWidget(),
              CostumTagFieldWidget(
                labelName: 'Occupation',
                hintText: 'Write your occupation',
                controller: jobController,
              ),
              CostumTagFieldWidget(
                labelName: 'Age',
                hintText: 'Write your age',
                controller: ageController,
              ),
              const SizedBox(
                height: 117.0,
              ),
              CustomButtonWidget(
                title: 'Continue Sign Up',
                onTap: (){
                  final message = validationInput();
                  if(message != null){
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message)));
                      return;
                  }
                  UserAccount userAccount = UserAccount(
                    fullname: widget.fullname, 
                    email: widget.email, 
                    password: widget.password, 
                    occupation: jobController.text, 
                    age: ageController.text);
                  Navigator.pushNamed(
                    context, 
                    SignUpUploadPhotoScreen.routeName,
                    arguments: userAccount);
                },
              )
            ],
          ),
        ),
        ),
    );
  }
}