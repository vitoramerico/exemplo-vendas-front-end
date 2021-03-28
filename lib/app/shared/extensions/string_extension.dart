import 'package:intl/intl.dart';

extension StringExt on String {
  String get toDisplayDateTime {
    var value = this;

    var dateTime = DateTime.parse(value);

    var inputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');

    return inputFormat.format(dateTime);
  }
}
