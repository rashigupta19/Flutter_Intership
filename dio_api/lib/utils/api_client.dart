import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as jsonconvert;

import 'package:third_task_api/models/university.dart';

class ApiClient {
  Dio _dio = Dio();
  static ApiClient _apiClient = ApiClient._();
  ApiClient._() {}
  static ApiClient getInstance() {
    return _apiClient;
  }

  getUniversities() async {
    const URL = "http://universities.hipolabs.com/search?country=india";
    Future<Response> future = _dio.get(URL);

    future.then((response) {
      // String json = response.data;

      //conversion
      // List<dynamic,Map<String, dynamic>> map1 =
      //     jsonconvert.jsonDecode(json).castList<dynamic, Map<String, dynamic>>();
      // List<dynamic> list1 =
      //     jsonconvert.jsonDecode(json); //json is converted into map
      // print("$list1");
      // List<University> universities =
      //     list1.map((i) => University.fromJson(i)).toList();
      //     print("$universities");

      final body = (response.data) as List;
      print("$body");

      final List<University> sublist =
          body.map((val) => University.fromJson(val)).toList();
      // data.add(sublist);

      print("$sublist");

      return sublist;
      // Map<String, dynamic> map1 = Map<String, dynamic>();
      // List<University> temp =
      //     list1.map((itemWord) => University.fromJSON(itemWord)).toList();

      // List<Map<String, dynamic>> list =
      //     list1[""]; // List of maps is returned from results in json file
      // print("$list");
      // List<University> university = list
      //     .map((universityMap) => University.fromJSON(universityMap))
      //     .toList();
      // print("Universities are $university");
      // each map is then given to Song.fromJson contructor method in Song.dart for inintialization

      // List<University> songs = list1.map((element) => University(element['name'], element['artworkUrl30'],element['previewUrl']))
      //     .toList();
    }).catchError((err) => print(err));
  }
}
