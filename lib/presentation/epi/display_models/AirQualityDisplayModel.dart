import 'package:flutter/material.dart';

class AirQualityDisplayModel {
  final String airQualityResult;
  final String airQualityResultState;
  final String airQualityCity;
  final String airQualityDescription;
  final String airQualitySource;
  final Color airQualityColor;

  AirQualityDisplayModel({
    required this.airQualityResult,
    required this.airQualityResultState,
    required this.airQualityCity,
    required this.airQualityDescription,
    required this.airQualitySource,
    required this.airQualityColor,
  });
}