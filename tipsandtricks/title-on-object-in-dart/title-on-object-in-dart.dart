// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;

extension CapTitle on Object {
  String get capitalizedTitle {
    String str;
    if (this is Enum) {
      str = (this as Enum).name;
    } else {
      str = toString();
    }
    return str[0].toUpperCase() + str.substring(1);
  }
}

enum EmailProviders { gmail, yahoo, hotmail }

void testIt() {
  EmailProviders.values.map((p) => p.capitalizedTitle).forEach(devtools.log);
  // prints these:
  // Gmail
  // Yahoo
  // Hotmail
}
