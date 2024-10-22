import 'package:intl/intl.dart';

String getNumberFormat(int number){
  return NumberFormat("#,##0","en_US").format(number);
}

double getScore(double nilai){
  return double.parse(nilai.toStringAsFixed(1));
}

String getDateTime(DateTime? date){
  if(date == null) return 'Unknown';
  return DateFormat('MMM yyyy').format(date);
}