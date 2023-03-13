import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/costum_button_widget.dart';
import 'package:sarang_app/src/common_widgets/people_detail_image_widget.dart';
import 'package:sarang_app/src/common_widgets/people_identity_widget.dart';
import 'package:sarang_app/src/features/likes_you/data/data_hobby_dummy.dart';
import 'package:sarang_app/src/features/likes_you/domain/user.dart';
import 'package:sarang_app/src/theme_manager/asset_image_icon_manager.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class PeopleProfileScreen extends StatelessWidget {
  static const String routeName = "people-profile";
  const PeopleProfileScreen({
    super.key,
    });

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PeopleDetailImageWidget(imagePath: user.imagePath),
            const SizedBox(
              height: AppSize.s30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p24
              ),
              child: PeopleIdentityWidget(
                user: user,
              ),
            ),
            Container(
              height: 80.0,
              margin: EdgeInsets.only(
                left: AppMargin.m24
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final hobby = dataHobbyDummy[index];
                  return Container(
                    height: 80.0,
                    width: 120.0,
                    margin: EdgeInsets.only(
                      right: AppMargin.m16
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s18),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          hobby,
                        ),
                        )
                    ),
                  );
                },
                itemCount: dataHobbyDummy.length,
                ),
            ),
            const SizedBox(
              height: AppSize.s40,
            ),
            Padding(padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p40
            ),
            child: CustomButtonWidget(
              title: 'Chat Now',
              onTap: () {
                
              },),)
          ],
        ),
      ),
    );
  }
}