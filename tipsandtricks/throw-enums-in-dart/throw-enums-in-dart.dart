// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:developer' as dev show log;

enum Exceptions { invalidUserName, invalidPassword }

void thisMethodThrows() {
  throw Exceptions.invalidPassword;
}

void testIt() {
  try {
    thisMethodThrows();
  } on Exceptions catch (e) {
    switch (e) {
      case (Exceptions.invalidUserName):
        dev.log("Invalid user name");
        break;
      case (Exceptions.invalidPassword):
        dev.log("Invalid password");
        break;
    }
  }
}
