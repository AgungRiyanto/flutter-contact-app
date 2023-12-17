import 'dart:convert';
import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:flutter_contact_app/models/contact.dart';

class HttpService {
  final String baseUrl =
      "https://657dbc473e3f5b1894630c84.mockapi.io/api/contacts";
  final Dio dio = Dio();

  Future<List<Contact>> getContactList(
      {int? p = 1, String name = "", String gender = ""}) async {
    Response res = await dio.get(baseUrl, queryParameters: {
      "p": p,
      "l": 20,
      "name": name,
      "gender": gender,
    });

    try {
      return (res.data as List).map((x) => Contact.fromJson(x)).toList();
    } on DioException catch (e) {
      if (e.response != null) {
        throw "e.response?.statusCode.";
      } else {
        // Error due to setting up or sending the request
        throw "${e.message}";
      }
    }
  }
}
