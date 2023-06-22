

import 'package:air_quality/domain/AirQualityRepository.dart';
import 'models/AirQualityEntity.dart';
import 'models/aq_location_data.dart';

class AirQualityUseCase {
  final AirQualityRepository repository;

  AirQualityUseCase({required this.repository});

  Future<AirQualityEntity> getAirQuality(LocationData location) {
    return repository.getAirQuality(location);
  }
}