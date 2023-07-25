import 'package:get/get.dart';

import '../api/api_client.dart';
import '../utils/appConstants.dart';

class RecommendedRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedRepo({required this.apiClient});
  Future<Response> getRecommendedList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_URI);
  }


}
