

class CityResponse {
  final CityResult results;

  CityResponse({required this.results});

  factory CityResponse.fromJson(Map<String, dynamic> json) {
    return CityResponse(
        results: CityResult.fromJson(json['results'])
    );
  }
}

class CityResult {
  final CityComponentsResponse components;

  CityResult({required this.components});

  factory CityResult.fromJson(List<dynamic> json) {
    return CityResult(
      components: CityComponentsResponse.fromJson(json[0]['components']),
    );
  }
}

class CityComponentsResponse {
  final String country;
  final String? county;
  final String? city;

  CityComponentsResponse(
      {required this.country,
        required this.county,
        required this.city});

  factory CityComponentsResponse.fromJson(Map<String, dynamic> json) {
    return CityComponentsResponse(
      country: json['country'],
      county: json['county'],
      city: json['city'],
    );
  }
}