import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/match_button_widget.dart';
import 'package:sarang_app/src/features/likes_you/presentation/explore_people_screen.dart';
import 'package:sarang_app/src/theme_manager/asset_image_icon_manager.dart';
import 'package:sarang_app/src/theme_manager/font_manager.dart';
import 'package:sarang_app/src/theme_manager/style_manager.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class PeopleDetailImageWidget extends StatelessWidget {
  const PeopleDetailImageWidget({
    super.key,
    required this.imagePath
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
            children: [
              Container(
                width: double.infinity,
                height: 420.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      imagePath
                    ))
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppPadding.p40,
                  horizontal: AppPadding.p26
                ),
                child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MatchButtonWidget(
          dimensions: 30.0,
          iconPath: 'icon_arrow_left.png', 
          onTap: (){
            Navigator.pop(context);
          }
        ),
        Text(
          textAlign: TextAlign.center,
          'Lover People\nDetailed',
          style: getWhiteTextStyle(
            fontSize: FontSizeManager.f20,
            fontWeight: FontWeightManager.semiBold
          ),
        ),
        MatchButtonWidget(
          dimensions: 30.0,
          iconPath: 'icon_close_circle.png', 
          onTap: (){
            Navigator.pushNamedAndRemoveUntil(
              context, ExplorePeopleScreen.routeName, (route) => false);
          }
        ),
      ],
    ),
              )
            ],
          );
  }
}