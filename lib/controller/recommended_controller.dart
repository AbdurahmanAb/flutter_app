import 'package:e_commerce/repository/recommended_repo.dart';
import 'package:get/get.dart';

import '../model/popular_model.dart';

class RecommendedController extends GetxController {
  final RecommendedRepo recommedRepo;
  RecommendedController({required this.recommedRepo});
  List<dynamic> _recommendedList = [];
  List<dynamic> get recommendedList => _recommendedList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedList() async {
    Response response = await recommedRepo.getRecommendedList();
    if (response.statusCode == 200) {
      _isLoaded = true;
      print("From Recommended Controller");
      _recommendedList = [];
      _recommendedList
          .addAll(PopularModel.fromJson(response.body).products as Iterable);
      //_recommendedList.addAll();
      update();
    }
  }
}
