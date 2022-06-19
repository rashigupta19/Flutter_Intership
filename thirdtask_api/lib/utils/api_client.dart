import 'dart:convert';

import 'package:dio/dio.dart';
//import 'dart:convert' as jsonconvert;
import 'package:thirdtask_api/models/university.dart';

List<University> parseUniversity(List<dynamic> responseBody) {
  print(responseBody.runtimeType);
  //List<dynamic> list = json.decode(responseBody) as List<dynamic>;
  final List<University> universities =
      responseBody.map((model) => University.fromJson(model)).toList();
  print("$universities");
  return universities;
}

Future<List<University>> fetchUniversity() async {
  Dio _dio = Dio();
  const URL = "http://universities.hipolabs.com/search?country";
  final response = await _dio.get(URL);
  if (response.statusCode == 200) {
    return parseUniversity(response.data);
  } else {
    throw Exception("Can't get Universities");
  }
}
