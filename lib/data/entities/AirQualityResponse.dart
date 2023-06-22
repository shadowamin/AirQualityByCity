

class AirQualityResponse {
  final AirQualityDataResponse data;

  AirQualityResponse({required this.data});

  factory AirQualityResponse.fromJson(Map<String, dynamic> json) {
    return AirQualityResponse(
      data: AirQualityDataResponse.fromJson(json['data'])
    );
  }
}

class AirQualityDataResponse {
  final int aqi;
  final AirQualityAttributeResponse attributions;

  AirQualityDataResponse(
      {required this.aqi,
        required this.attributions});

  factory AirQualityDataResponse.fromJson(Map<String, dynamic> json) {
    return AirQualityDataResponse(
      aqi: json['aqi'],
      attributions: AirQualityAttributeResponse.fromJson(json['attributions'][0]),
    );
  }
}

class AirQualityAttributeResponse {
  final String url;
  final String name;

  AirQualityAttributeResponse(
      {required this.url,
        required this.name});

  factory AirQualityAttributeResponse.fromJson(Map<String, dynamic> json) {
    return AirQualityAttributeResponse(
      url: json['url'],
      name: json['name'],
    );
  }
}