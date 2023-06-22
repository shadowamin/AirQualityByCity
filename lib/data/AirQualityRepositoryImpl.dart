import '../domain/models/AirQualityEntity.dart';
import '../domain/models/aq_location_data.dart';
import 'AirQualityApi.dart';
import '../domain/AirQualityRepository.dart';
import 'CityApi.dart';

class AirQualityRepositoryImpl implements AirQualityRepository {
  final CityApi cityApi;
  final AirQualityApi airQualityApi;

  AirQualityRepositoryImpl({required this.cityApi, required  this.airQualityApi});

  @override
  Future<AirQualityEntity> getAirQuality(LocationData location) async {
    final cityResponse = await cityApi.fetchCity("${location.latitude}%2C${location.longitude}");
    final airQualityData = await airQualityApi
        .fetchAirQuality("geo:${location.latitude};${location.longitude}");
    final cityRes = cityResponse.results.components.city;
    final countyRes = cityResponse.results.components.county;
    final String city;
    if (cityRes == null || cityRes.isEmpty) {
      if(countyRes == null || countyRes.isEmpty){
        city = "";
      }else{
        city = countyRes;
      }
    } else {
      city = cityRes;
    }
    return AirQualityEntity(
      aqi: airQualityData.data.aqi,
      source: airQualityData.data.attributions.name,
      city: city,
      country: cityResponse.results.components.country,
    );
  }
}
