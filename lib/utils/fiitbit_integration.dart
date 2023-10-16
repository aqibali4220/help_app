import 'dart:io';

import 'package:fitbitter/fitbitter.dart';
import 'package:flutter/material.dart';

class FitbitIntegration {
  late FitbitCredentials? fitbitCredentials;
  Future fitbitAuth() async {


    fitbitCredentials = await FitbitConnector.authorize(
        clientID: "23RDTF",
        clientSecret: "673cc3a1cfa4ec68f7063d1d8f5af09d",
        redirectUri: "help_app://home",
        callbackUrlScheme: "example");
    print(fitbitCredentials);

    //Instantiate a proper data manager (for example, for SpO2 data)
    FitbitSpO2DataManager fitbitSpO2DataManager = FitbitSpO2DataManager(
      clientID: "23RDTF",
      clientSecret: "673cc3a1cfa4ec68f7063d1d8f5af09d",
    );

    final spO2Data = await fitbitSpO2DataManager.fetch(FitbitSpO2APIURL.day(
      date: DateTime.now().subtract(Duration(days: 1)),
      fitbitCredentials: fitbitCredentials!,
    )) as List<FitbitSpO2Data>;
    print(spO2Data);

    Text('Yesterday your SpO2 was ${spO2Data[0].avgValue}% on average!');
  }

  FitbitActivityTimeseriesDataManager fitbitActivityTimeseriesDataManager =
      FitbitActivityTimeseriesDataManager(
    clientID: '23RDTF',
    clientSecret: '673cc3a1cfa4ec68f7063d1d8f5af09d',
  );
  // countSteps() async {
  //   final stepsData = await fitbitActivityTimeseriesDataManager.fetch(
  //     FitbitCardioScoreAPIURL(fitbitCredentials: fitbitCredentials, url: "help_app")
  //       // FitbitActivityTimeseriesAPIURL.dayWithResource(
  //       //   date: DateTime.now().subtract(Duration(days: 1)),
  //       //   // userID: fitbitAccount.id,
  //       //   resource: fitbitActivityTimeseriesDataManager,
  //       //   fitbitCredentials: fitbitCredentials!,
  //       // )
  //   ) as List<FitbitCardioScoreAPIURL>;
  // }
}
