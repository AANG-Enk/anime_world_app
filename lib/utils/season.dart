String getCurrentSeason(){
  final month = DateTime.now().month;
  final year = DateTime.now().year;

  if (month >= 4 && month <= 6) {
    return 'Spring $year';
  } else if (month >= 7 && month <= 9) {
    return 'Summer $year';
  } else if (month >= 10 && month <= 12) {
    return 'Fall $year';
  } else if (month >= 1 && month <= 3) {
    return 'Winter $year';
  } else {
    throw Exception('This season doesn\'t exsit in reality.');
  }
}