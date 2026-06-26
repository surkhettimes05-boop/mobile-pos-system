import 'package:intl/intl.dart';

class NepaliDateUtils {
  static String getNepaliDate(DateTime dateTime) {
    // Simple conversion to Nepali date format
    // This is a basic implementation - for full accuracy, consider using a dedicated library
    final nepaliMonths = [
      'Baishakh', 'Jestha', 'Ashadh', 'Shrawan', 'Bhadra', 'Ashwin',
      'Kartik', 'Mangsir', 'Poush', 'Magh', 'Falgun', 'Chaitra'
    ];
    
    // Approximate conversion (Nepali calendar is complex)
    // This is a simplified version for display purposes
    final englishDate = dateTime;
    final nepaliYear = englishDate.year + 56; // Approximate
    final nepaliMonthIndex = (englishDate.month - 1) % 12;
    final nepaliDay = englishDate.day;
    
    return '$nepaliDay ${nepaliMonths[nepaliMonthIndex]} $nepaliYear';
  }

  static String getEnglishDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static String getFormattedDate(DateTime dateTime, {bool useNepali = false}) {
    if (useNepali) {
      return getNepaliDate(dateTime);
    } else {
      return DateFormat('dd MMM yyyy').format(dateTime);
    }
  }
}
