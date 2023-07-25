import 'package:e_commerce/api/api_client.dart';
import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/controller/popular_controller.dart';
import 'package:e_commerce/repository/cart_repo.dart';
import 'package:e_commerce/repository/popular_repo.dart';
import 'package:e_commerce/utils/appConstants.dart';
import 'package:get/get.dart';

import '../controller/recommended_controller.dart';
import '../repository/recommended_repo.dart';

Future<void> init() async {
  //API CLIENT
  Get.lazyPut(() => ApiClient(BaseUrl: AppConstants.BASE_URL));

//Repos
  Get.lazyPut(() => PopularRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  //Controllers
  Get.lazyPut(() => PopularController(popularRepo: Get.find()));
  Get.lazyPut(() => RecommendedController(recommedRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
