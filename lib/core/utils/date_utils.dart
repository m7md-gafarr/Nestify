class AppDateHelper {
  List<String> generateDeliveryDates(int daysAhead) {
    final now = DateTime.now();
    List<String> dates = [];

    for (int i = 1; i <= daysAhead; i++) {
      final date = now.add(Duration(days: i));
      final weekday = _weekdayName(date.weekday);
      final month = _monthName(date.month);
      final formatted = "$weekday, ${date.day} $month";

      if (i == 1) {
        dates.add("Tomorrow — $formatted");
      } else {
        dates.add(formatted);
      }
    }

    return dates;
  }

  String _weekdayName(int weekday) {
    const names = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return names[weekday - 1];
  }

  String _monthName(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return months[month - 1];
  }

  List<String> generateTimeSlots() {
    List<String> slots = [];

    for (int hour = 7; hour <= 17; hour++) {
      final period = hour >= 12 ? "PM" : "AM";
      final displayHour = (hour > 12) ? hour - 12 : hour;
      slots.add("$displayHour:00 $period");
    }

    return slots;
  }
}
