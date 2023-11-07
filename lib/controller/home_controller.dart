import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxString selectedValue = "All".obs;

  final RxList<String> stringNumber = <String>[
    "All",
    "1st",
    "2nd",
    "3rd",
    "4th",
    "5th",
    "6th",
    "7th",
  ].obs;
  final RxString selectedDay = "Sunday".obs;

  final RxList<String> stringDay = <String>[
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ].obs;

  final RxList<String> monthWeek = <String>[
    "Week",
    "Month",
  ].obs;

  final RxString selectedMonthWeek = "Week".obs;

  final Rx<DateTime> selectedDate = DateTime.now().obs;

  final Rx<DateTime> selectedDateNext = DateTime(
    DateTime.now().year + 1, // Set to next year
    DateTime.now().month,
    DateTime.now().day,
  ).obs;

  @override
  void onInit() {
    super.onInit();
  }
}
