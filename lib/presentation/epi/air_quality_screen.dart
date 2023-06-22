import 'package:air_quality/data/AirQualityApi.dart';
import 'package:air_quality/data/AirQualityRepositoryImpl.dart';
import 'package:air_quality/data/CityApi.dart';
import 'package:air_quality/domain/AirQualityUseCase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import '../../domain/models/aq_location_data.dart';
import 'AirQualityResults.dart';
import 'air_quality_display_transformer.dart';
import 'display_models/AirQualityDisplayModel.dart';

class AirQualityScreen extends HookWidget {

  const AirQualityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AirQualityContents(),
    );
  }
}

class AirQualityContents extends HookWidget {
  const AirQualityContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AirQualityDisplayModel>(
      future: fetchAirQuality(context),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return AirQualityResults(
            displayModel: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Container(
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        );
      },
    );
  }

  Future<AirQualityDisplayModel> fetchAirQuality(BuildContext context) async {
    final useCase = AirQualityUseCase(
        repository: AirQualityRepositoryImpl(
            cityApi: CityApi(), airQualityApi: AirQualityApi()));
    final airQualityDisplayTransformer =
        AirQualityDisplayTransformer(context: context);

    final location = await _determinePosition();
    final airQualityResponse = await useCase.getAirQuality(LocationData(longitude : location.longitude.toString(), latitude : location.latitude.toString()));

    return AirQualityDisplayModel(
      airQualityResult: airQualityResponse.aqi.toString(),
      airQualityResultState:
          airQualityDisplayTransformer.getStatueAqi(airQualityResponse.aqi),
      airQualityCity: airQualityResponse.city,
      airQualityDescription: airQualityDisplayTransformer
          .getDescriptionByAqi(airQualityResponse.aqi),
      airQualitySource: airQualityResponse.source,
      airQualityColor:
          airQualityDisplayTransformer.getColorByAqi(airQualityResponse.aqi),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
