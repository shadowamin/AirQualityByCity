
import 'models/AirQualityEntity.dart';
import 'models/aq_location_data.dart';

abstract class AirQualityRepository {
  Future<AirQualityEntity> getAirQuality(LocationData location);
}