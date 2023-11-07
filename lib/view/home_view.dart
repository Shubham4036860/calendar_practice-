import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pratical_task/controller/home_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 28.0, top: 20),
                child: Text(
                  "Current Date Calendar 1",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: calendarCurrent(),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 28.0, top: 20),
                child: Text(
                  "Current Date Next Year Calendar 2",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: calendarWithNext(),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 28.0, top: 20),
                child: Text(
                  "DropDown 1",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: dropDownOfNumber(),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 28.0, top: 20),
                child: Text(
                  "DropDown 2",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: dropDownOfDay(),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 28.0, top: 20),
                child: Text(
                  "DropDown 3",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: dropDownOfWeekMonth(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: submitButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dropDownOfNumber() {
    return Obx(() {
      return DropdownButtonHideUnderline(
        child: DropdownButton(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          icon: Transform.rotate(
              angle: 270 * 3.14 / 180,
              child: const Icon(Icons.chevron_left_rounded)),
          items: controller.stringNumber
              .map((element) => DropdownMenuItem(
                  value: element,
                  child: Text(
                    element,
                  )))
              .toList(),
          focusColor: Colors.transparent,
          isExpanded: true,
          isDense: true,
          value: controller.selectedValue.value,
          onChanged: (String? newValue) {
            controller.selectedValue.value = newValue ?? '';
            print("Select A Day Number${controller.selectedValue.value}");
          },
        ),
      );
    });
  }

  Widget dropDownOfDay() {
    return Obx(() {
      return DropdownButtonHideUnderline(
        child: DropdownButton(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          icon: Transform.rotate(
              angle: 270 * 3.14 / 180,
              child: const Icon(Icons.chevron_left_rounded)),
          items: controller.stringDay
              .map((element) => DropdownMenuItem(
                  value: element,
                  child: Text(
                    element,
                  )))
              .toList(),
          focusColor: Colors.transparent,
          isExpanded: true,
          isDense: true,
          value: controller.selectedDay.value,
          onChanged: (String? newValue) {
            controller.selectedDay.value = newValue ?? '';
            print("selectedDay==>${controller.selectedDay.value}");
          },
        ),
      );
    });
  }

  Widget dropDownOfWeekMonth() {
    return Obx(() {
      return DropdownButtonHideUnderline(
        child: DropdownButton(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          icon: Transform.rotate(
              angle: 270 * 3.14 / 180,
              child: const Icon(Icons.chevron_left_rounded)),
          items: controller.monthWeek
              .map((element) => DropdownMenuItem(
                  value: element,
                  child: Text(
                    element,
                  )))
              .toList(),
          focusColor: Colors.transparent,
          isExpanded: true,
          isDense: true,
          value: controller.selectedMonthWeek.value,
          onChanged: (String? newValue) {
            controller.selectedMonthWeek.value = newValue ?? '';
            print("selectedMonthWeek==>${controller.selectedMonthWeek.value}");
          },
        ),
      );
    });
  }

  Widget submitButton() {
    return Center(
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
        child: const Center(
            child: Text(
          "Submit",
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
      ),
    );
  }

  Widget calendarCurrent() {
    return TableCalendar(
      firstDay: DateTime(2000),
      lastDay: DateTime(2050),
      focusedDay: controller.selectedDate.value,
      selectedDayPredicate: (day) {
        return isSameDay(day, controller.selectedDate.value);
      },
      onDaySelected: (selectedDay, focusedDay) {
        controller.selectedDate.value = selectedDay;
      },
    );
  }

  Widget calendarWithNext() {
    return TableCalendar(
      firstDay: DateTime(2000),
      lastDay: DateTime(2050),
      focusedDay: controller.selectedDateNext.value,
      selectedDayPredicate: (day) {
        return isSameDay(day, controller.selectedDateNext.value);
      },
      onDaySelected: (selectedDay, focusedDay) {
        controller.selectedDateNext.value = selectedDay;
      },
    );
  }
}
