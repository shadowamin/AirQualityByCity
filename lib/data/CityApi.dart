

import 'dart:convert';
import 'entities/AirQualityResponse.dart';
import 'package:http/http.dart' as http;

import 'entities/CityResponse.dart';

class CityApi {

  Future<CityResponse> fetchCity(String location) async {
    final response = await http
        .get(Uri.parse('https://api.opencagedata.com//geocode/v1/json?key=334bff27424c4294bc85be2b5de7e628&q=$location'));

    if (response.statusCode == 200) {
      return CityResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load City');
    }
  }
}