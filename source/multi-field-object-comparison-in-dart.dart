// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;

@immutable
class Reminder {
  final bool isDone;
  final DateTime creationDate;
  const Reminder({
    required this.isDone,
    required this.creationDate,
  });
  @override
  String toString() => {
        'isDone': isDone,
        'creationDate': creationDate.toIso8601String(),
      }.toString();
}

final now = DateTime.now();
final yesterday = now.subtract(
  const Duration(days: 1),
);

final reminders = [
  Reminder(isDone: true, creationDate: now),
  Reminder(isDone: false, creationDate: now),
  Reminder(isDone: true, creationDate: yesterday),
];

extension ToInt on bool {
  int toInt() => this ? 1 : 0;
}

extension ReminderSorting on Iterable<Reminder> {
  List<Reminder> sorted() => [...this]..sort(
      (lhs, rhs) {
        final isDone = lhs.isDone.toInt().compareTo(
              rhs.isDone.toInt(),
            );
        if (isDone != 0) {
          return isDone;
        }
        return lhs.creationDate.compareTo(
          rhs.creationDate,
        );
      },
    );
}

extension Log on Object {
  void log() => devtools.log(toString());
}

void testIt() {
  reminders.log();
  final sorted = reminders.sorted();
  sorted.log();
}
