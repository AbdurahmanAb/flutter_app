import 'package:e_commerce/utils/appConstants.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';

class PopularRepo extends GetxService {
  final ApiClient apiClient;
  PopularRepo({required this.apiClient});
  Future<Response> getPopularList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
