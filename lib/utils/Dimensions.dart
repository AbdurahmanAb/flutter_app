import 'package:get/get.dart';

class Dimensions {
  //We used get because our stateless classes can't access media query context's
  // so we used Get.Context
  static double screeHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

//The Screnn Containing All Sliders
//We make ScreenHeigh/320 since 320 is the original the container size
  static double pageView = screeHeight / 2;
  //Our inital height of conatiner is 220 so on everyscreen We have to make the container size 220
  //J5 prime Screnn Size = 731.42/220 == 3.34
  static double pageViewContainer = screeHeight / 3;
  //Our Screen Height / The Small container height 731/122 = 6  it's the ratio;
  static double textViewContainer = screeHeight / 5;

//SizedBox
  static double height10 = screeHeight / 73.1;
  static double height15 = screeHeight / 48.8;
  static double height20 = screeHeight / 36.55;
  static double height25 = screeHeight / 29.94;
  static double height45 = screeHeight / 16.4;
  static double height70 = screeHeight / 10.44;

//container
  static double TextcontainerHeight = screeHeight / 7.34;
  static double imageContainerHeight = screeHeight / 6.1;

  //Width
  static double width10 = screeHeight / 73.1;
  static double width15 = screeHeight / 48.8;
  static double width20 = screeHeight / 36.55;
  static double width25 = screeHeight / 29.94;
  static double width30 = screeHeight / 24.34;
  static double width300 = screeHeight / 2.434;

  //FontSize

  static double font20 = screeHeight / 36.55;
  static double font16 = screeHeight / 44;
  static double font26 = screeHeight / 28.6;
//Radius
  static double radius15 = screeHeight / 48.8;
  static double radius20 = screeHeight / 36.55;
  static double radius30 = screeHeight / 24.55;
  //Icon Size
  static double Icon24 = screeHeight / 30.45;
  static double Icon16 = screeHeight / 42.5;

  //Popular
  static double popularImgHeight = screeHeight / 2.1;

//Toolbar Heighet Sliver
  static double ToolbarHeight = screeHeight / 9.13;
}
