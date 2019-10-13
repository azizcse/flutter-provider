import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserState extends ChangeNotifier {
  String _dataUrl = "https://reqres.in/api/users?per_page=20";
  UserState();

  String _searchText = "";
  String _jsonResponse = "";
  bool _isFetching = false;

  void setSearchText(String text) {
    _searchText = text;
    notifyListeners();
  }

  String get searchText => _searchText;

  bool get isFetching => _isFetching;

  String get responseText => _jsonResponse;

  Future<void> fetchData() async {
    _isFetching = true;
    notifyListeners();

    var response = await http.get(_dataUrl);

    if (response.statusCode == 200) {
      _jsonResponse = response.body;
    }

    _isFetching = false;
    notifyListeners();
  }

  List<dynamic> getResponseJson() {
    if (_jsonResponse.isNotEmpty) {
      Map<String, dynamic> json = jsonDecode(_jsonResponse);
      // print(json['data']['avatar']);
      return json['data'];
    }
    return null;
  }
}
