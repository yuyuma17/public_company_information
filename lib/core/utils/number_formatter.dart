import 'package:intl/intl.dart';

// Ex: 221,590,214
String formatToThousandComma(int number) {
  final formatter = NumberFormat("###,###", "en_US");
  return formatter.format(number);
}
