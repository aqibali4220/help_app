


import 'package:help_app/utils/images.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController{


  List dashBoardTextList=[
    "Personal Safety",
    "Health Monitor",
    "Daily Activities",
    "Home Alerts",
    "Mental Health",
    "Home Protection",
  ];
  List dashBoardImageList=[
    personalSafety,
    health_monitor,
    daily_activities,
    home_alerts,
    mental_health,
    home_protection
  ];



  List personalSafetyTextList=[
   "Notification of Falls",
    "Notifications of Fainting",
    "Sign of Stroke",
    "Diabetes Monitoring",
    "Temperature Check",
  ];


  List homeProtectionTextList=[
   "Doors Locked",
    "Stove on/off",
    "Faucet on/off",
    "Fridge closed/opened",
    "Fireplace in use",
  ];


  List dailyActivitiesTextList=[
   "Restroom visit counts",
    "Wake and sleepy times",
    "Medicine Reminders",
    "Doors locked and check",
    "Proximity Alerts"
  ];


  List mentalHealthTextList=[
   "Exercising and Charts",
    "Social Gathering",
    "Mind Games",
    "Volunteer Opportunities",
  ];


  List healthMonitorTextList=[
   "Heart Rate Check",
    "ECG check",
    "Blood Oxygen",
    "Blood Sugar",
    "Temperature Check"
  ];




}