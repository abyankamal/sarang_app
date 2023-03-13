import 'package:sarang_app/src/features/likes_you/domain/user.dart';
import 'package:sarang_app/src/theme_manager/asset_image_icon_manager.dart';

List<User> dataUserDummy = [
  User(
    fullName: 'Yunita', 
    age: 22, 
    occupation: 'Teacher', 
    description: 'I would like to be a good teacher and making some changes with you', 
    imagePath: '${AssetImageIconManager.assetPath}/people_love1_image.png'
    ),
  User(
    fullName: 'Rimadona', 
    age: 24, 
    occupation: 'Doctor', 
    description: 'I would like to be a good doctor and making some changes with you', 
    imagePath: '${AssetImageIconManager.assetPath}/people_love2_image.png'
    ),
  User(
    fullName: 'Aninda', 
    age: 21, 
    occupation: 'Enterpreneur', 
    description: 'I would like to be a good enterpreneur and making some changes with you', 
    imagePath: '${AssetImageIconManager.assetPath}/people_love3_image.png'
    ),
];