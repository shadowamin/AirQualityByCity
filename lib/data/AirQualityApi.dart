

import 'dart:convert';
import 'entities/AirQualityResponse.dart';
import 'package:http/http.dart' as http;

class AirQualityApi {

  Future<AirQualityResponse> fetchAirQuality(String geo) async {
    final response = await http
        .get(Uri.parse('https://api.waqi.info/feed/$geo?token=54b8b664c6e9d260c00d2f087a5081e60ee6f77a'));
    if (response.statusCode == 200) {
      return AirQualityResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load AirQuality');
    }
  }
}