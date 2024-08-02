import 'package:get/get.dart';
import '../model/modelclass.dart';
import 'apiservice.dart';

class ApiCalling extends GetxController {
  var isLoading = false.obs;

  RxList<Quote> quoteData = <Quote>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading(true);

    List? json = await ApiService.apiService.getData()!;
    quoteData.value = json!
        .map(
          (e) => Quote.fromJson(e),
        )
        .toList();

    isLoading(false);
  }
}
