// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;

extension Normalize on double {
  double normalized(
    double selfRangeMin,
    double selfRangeMax, [
    double normalizedRangeMin = 0.0,
    double normalizedRangeMax = 1.0,
  ]) =>
      (normalizedRangeMax - normalizedRangeMin) *
          ((this - selfRangeMin) / (selfRangeMax - selfRangeMin)) +
      normalizedRangeMin;
}

extension Log on Object {
  void log() => devtools.log(toString());
}

void testIt() async {
  2.0.normalized(0, 2.0).log(); // 1.0
  4.0.normalized(0, 8.0).log(); // 0.5
  5.0.normalized(4.0, 6.0, 10.0, 20.0).log(); // 15
}
