import 'package:get/get.dart';

class Utils {
  static bool isNullOrEmpty(final String? value) {
    if (value == null || value.isEmpty) {
      return true;
    }
    return false;
  }

  static String formatDuration(final Duration duration) {
    String twoDigits(final int n) => '$n'.padLeft(2, '0');

    String formatDurationSeconds() => twoDigits(duration.inSeconds % 60);

    String formatDurationMinutes() => twoDigits(duration.inSeconds ~/ 60);

    return '${formatDurationMinutes()}:${formatDurationSeconds()}';
  }
}
