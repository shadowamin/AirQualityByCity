


import '../../EpiDataType.dart';
import 'EpiObject.dart';

class EpiDisplayModel {
  final String country;
  final Map<EpiDataType, List<EpiObject>> epiData;

  EpiDisplayModel({required this.country, required this.epiData});
}