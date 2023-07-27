import 'package:e_commerce/screen/cart/cart_page.dart';
import 'package:e_commerce/screen/detail/Recommend.dart';
import 'package:e_commerce/screen/detail/popular_items.dart';
import 'package:e_commerce/screen/home/MainPage.dart';
import 'package:get/get.dart';

class Routes {
  static const String initial = "/";
  static const String PopularPage = "/popular";
  static const String RecommendedPage = "/recommended";
  static const String cart = "/cart";

  static String getInital() => '$initial';
  static String getPopular(int pageId) => '$PopularPage?pageId=$pageId';
  static String getRecommended(int pageId) => '$RecommendedPage?pageId=$pageId';

  static List<GetPage> route = [
    GetPage(name: initial, page: () => MainPage()),
    GetPage(
        name: PopularPage,
        page: () {
          var pageId = Get.parameters['pageId'];
          return Popular(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: RecommendedPage,
        page: () {
          var pageId = Get.parameters["pageId"];
          return Recommended(
            pageId: int.parse(pageId!),
          );
        }),
    GetPage(name: cart, page: () => CartPage())
  ];
}
