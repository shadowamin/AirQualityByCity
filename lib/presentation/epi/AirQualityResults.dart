import 'package:flutter/material.dart';

import 'display_models/AirQualityDisplayModel.dart';

class AirQualityResults extends StatelessWidget {
  final AirQualityDisplayModel displayModel;

  const AirQualityResults({super.key, required this.displayModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 400.0,
          decoration: BoxDecoration(
            color: displayModel.airQualityColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16,96,16,16),
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children : [
                      Text(displayModel.airQualityResult,
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: 120,
                              color: Colors.white, fontWeight: FontWeight.w500)),
                      Text("Aqi",
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Colors.white)),
                    ]
                ),
                const SizedBox(height: 12.0),
                Text(displayModel.airQualityResultState,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 12.0),
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      displayModel.airQualityCity,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 26, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      displayModel.airQualityDescription,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium?.copyWith(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12.0),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),
          ]),
        ),
      ],
    );
  }
}
