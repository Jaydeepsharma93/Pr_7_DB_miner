import 'package:get/get.dart';
import '../model/modelclass.dart';
import 'apiservice.dart';
import 'dbhelper.dart';

class ApiCalling extends GetxController {
  var isLoading = false.obs;
  var quotes = <Quote>[].obs;
  var index = 0.obs;
  var likedQuotes = <Quote>[].obs;
  RxList<Quote> quoteData = <Quote>[].obs;

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    fetchData();
    loadLikedQuotes();
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

  void toggleLike(Quote quote, int index) async {
    if (likedQuotes.any((liked) => liked.quote == quote.quote)) {
      likedQuotes.removeWhere((liked) => liked.quote == quote.quote);
      await _databaseHelper.deleteLikedQuote(quote.quote.toString());
    } else {
      likedQuotes.add(quote);
      await _databaseHelper.insertLikedQuote(quote);
    }

    if (quoteData[index].id == "1") {
      quoteData[index].id = "0";
    } else {
      quoteData[index].id = "1";
    }
    update();
    quoteData.refresh();
    print(quoteData[index].id);
  }

  void onChangeIndex(int index) {
    this.index.value = index;
  }

  void fetchDataByCategory(String category) {
    isLoading(true);
    try {
      List<Quote> filteredQuotes =
          quoteData.where((quote) => quote.type == category).toList();
      quoteData(filteredQuotes);
    } catch (e) {
      print('Error filtering data by category: $e');
    } finally {
      isLoading(false);
    }
  }

  void loadLikedQuotes() async {
    List<Quote> likedQuotesFromDb = await _databaseHelper.getLikedQuotes();
    likedQuotes.value = likedQuotesFromDb;
  }

  Map<String, List<Quote>> get likedQuotesByCategory {
    var groupedQuotes = <String, List<Quote>>{};
    for (var quote in likedQuotes) {
      if (groupedQuotes.containsKey(quote.type)) {
        groupedQuotes[quote.type]!.add(quote);
      } else {
        groupedQuotes[quote.type.toString()] = [quote];
      }
    }
    return groupedQuotes;
  }
}
