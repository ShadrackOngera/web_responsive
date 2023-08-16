import 'package:intl/intl.dart';

extension CapitalizeWordsExtension on String {
  String capitalizeWords() {
    if (isEmpty) return '';
    return split(' ').map((word) {
      if (word.isNotEmpty) {
        return '${word[0].toUpperCase()}${word.substring(1)}';
      } else {
        return '';
      }
    }).join(' ');
  }
}

extension BreakLongStringsExtension on String {
  String get breakTwoWords {
    List<String> words = this.split(' ');
    if (words.length > 1) {
      return words.join('\n');
    }
    return this;
  }
}

extension DecimalAmountParsing on double {
  String thousandSeparated() {
    NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    return myFormat.format(this);
  }
}

//date formatings
//

//returns date in this format 12th July, 1 : 45 pm
String customFormatDate(String dateString) {
  if (dateString.length != 8) {
    throw ArgumentError("Invalid date string. Expected format: '07122022'");
  }

  // Parse the input string into a DateTime object
  DateTime dateTime = DateTime.parse(dateString.substring(4) +
      dateString.substring(2, 4) +
      dateString.substring(0, 2));

  final String desiredFormat = 'd MMM yyyy ';

  String formattedDate = DateFormat(desiredFormat).format(dateTime);

  formattedDate = formattedDate.replaceFirstMapped(
    RegExp(r'\d{1,2}'),
    (match) => _addOrdinalSuffix(
      int.parse(match.group(0)!),
    ),
  );

  return formattedDate;
}

String _addOrdinalSuffix(int day) {
  if (day >= 11 && day <= 13) {
    return '$day' 'th';
  }
  switch (day % 10) {
    case 1:
      return '$day' 'st';
    case 2:
      return '$day' 'nd';
    case 3:
      return '$day' 'rd';
    default:
      return '$day' 'th';
  }
}

String _addSuffix(int day) {
  if (day >= 11 && day <= 13) {
    return '$day' 'th';
  }
  switch (day % 10) {
    case 1:
      return '$day' 'st';
    case 2:
      return '$day' 'nd';
    case 3:
      return '$day' 'rd';
    default:
      return '$day' 'th';
  }
}

// returns date in the format--: Monday 15th July 2023
String customFormatDateTwo(String dateString) {
  if (dateString.length != 8) {
    
    return '';
  }

  // Parse the input string into a DateTime object
  DateTime dateTime = DateTime.parse(
    dateString.substring(4) +
        dateString.substring(2, 4) +
        dateString.substring(0, 2),
  );

  final String desiredFormat = 'EEEE d MMMM yyyy';

  String formattedDate = DateFormat(desiredFormat).format(dateTime);

  formattedDate = formattedDate.replaceFirstMapped(
    RegExp(r'\d{1,2}'),
    (match) => _addSuffix(
      int.parse(match.group(0)!),
    ),
  );

  return formattedDate;
}

String convertDateFormat(String input) {
  try {
    if (input.length != 8) {
      return '';
    }

    // Parse the input string into a DateTime object
    DateTime dateTime = DateTime.parse(
        input.substring(4) + input.substring(2, 4) + input.substring(0, 2));

    // DateTime dateTime = DateFormat("ddMyyyy").parse(input);
    // String formattedDate = DateFormat("yyyy-MM-dd").format(dateTime);

    final String desiredFormat = 'yyyy-MM-dd';
    print(dateTime);
    String formattedDate = DateFormat(desiredFormat).format(dateTime);
    print(formattedDate);

    return formattedDate;
  } catch (e) {
    print("Error converting date: $e");
    return '';
  }
}
