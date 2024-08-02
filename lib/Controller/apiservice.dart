import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiService {

  static final ApiService apiService = ApiService();

  Future<List?> getData() async {
    String apiData = 'https://sheetdb.io/api/v1/gikodefwkazl3';
    Uri uri = Uri.parse(apiData);
    Response response = await http.get(uri);
    if (response.statusCode == 200) {
      List dataList = jsonDecode(response.body);
      return dataList;
    }
    return null;
  }
}