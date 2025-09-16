extension DateTimeExtensions on DateTime{
  ({int months, int days}) getDifferenceBetweenDates(DateTime endDate){
    int months = 0;
    int days = 0;

    DateTime tempDate = DateTime(year, month, day);
    while (tempDate.isBefore(endDate)) {
      tempDate = DateTime(tempDate.year, tempDate.month + 1, tempDate.day);
      if (tempDate.isBefore(endDate) || tempDate.isAtSameMomentAs(endDate)) {
        months++;
      } else {
        break;
      }
    }

    final DateTime finalDate = DateTime(year, month + months, day);
    days = endDate.difference(finalDate).inDays;

    return (
      months: months,
      days: days
    );
  }
}