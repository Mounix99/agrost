import 'package:get/get.dart';

String formatDuration(Duration duration) {
  var seconds = duration.inSeconds;
  final weeks = seconds ~/ (Duration.secondsPerDay * 7);
  seconds -= weeks * (Duration.secondsPerDay * 7);
  final days = seconds ~/ Duration.secondsPerDay;
  seconds -= days * Duration.secondsPerDay;
  // final hours = seconds ~/ Duration.secondsPerHour;
  // seconds -= hours * Duration.secondsPerHour;
  // final minutes = seconds ~/ Duration.secondsPerMinute;
  // seconds -= minutes * Duration.secondsPerMinute;

  final List<String> tokens = [];
  if (weeks != 0) {
    tokens.add('$weeks ${'week'.trPlural('weeks', weeks)}');
  }
  if (days != 0) {
    tokens.add('$days ${'day'.trPlural('days', days)}');
  }
  // if (hours != 0) {
  //   tokens.add('$hours ${S.of(context).hours(hours)}');
  // }
  // if (minutes != 0) {
  //   tokens.add('$minutes ${S.of(context).minutes(minutes)}');
  // }
  return tokens.join(' ');
}
