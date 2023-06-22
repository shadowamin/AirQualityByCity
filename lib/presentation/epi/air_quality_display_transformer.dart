import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AirQualityDisplayTransformer{

  final BuildContext context;

  AirQualityDisplayTransformer({required this.context});

  Color getColorByAqi(int aqi) {
    if (aqi <= 30) {
      return Colors.green;
    } else if (aqi <= 50) {
      return Colors.teal;
    } else if (aqi <= 100) {
      return Colors.yellow;
    } else if (aqi <= 150) {
      return Colors.orange;
    } else if (aqi <= 200) {
      return Colors.red;
    } else if (aqi < 250) {
      return Colors.purple;
    } else {
      return Colors.redAccent;
    }
  }

  String getDescriptionByAqi(int aqi) {
    final appLocalization = AppLocalizations.of(context)!;
    if (aqi <= 30) {
      return appLocalization.aqi_very_low_des;
    } else if (aqi <= 50) {
      return appLocalization.aqi_low_des;
    } else if (aqi <= 100) {
      return appLocalization.aqi_mod_des;
    } else if (aqi <= 150) {
      return appLocalization.aqi_unh_low_des;
    } else if (aqi <= 200) {
      return appLocalization.aqi_unh_des;
    } else if (aqi < 250) {
      return appLocalization.aqi_unh_very_des;
    } else {
      return appLocalization.aqi_biohasard;
    }
  }

  String getStatueAqi(int aqi) {
    final appLocalization = AppLocalizations.of(context)!;
    if (aqi <= 30) {
      return appLocalization.aqi_low;
    } else if (aqi <= 50) {
      return appLocalization.aqi_low;
    } else if (aqi <= 100) {
      return appLocalization.aqi_mod;
    } else if (aqi <= 150) {
      return appLocalization.aqi_unh_low;
    } else if (aqi <= 200) {
      return appLocalization.aqi_unh;
    } else if (aqi < 250) {
      return appLocalization.aqi_unh_very;
    } else {
      return appLocalization.aqi_hazardous;
    }
  }
}