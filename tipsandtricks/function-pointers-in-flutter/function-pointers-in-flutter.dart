// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

typedef LoginOrRegisterFunction = Future<UserCredential> Function({
  required String email,
  required String password,
});

Future<bool> _registerOrLogin({
  required LoginOrRegisterFunction fn,
  required String email,
  required String password,
}) async {
  try {
    await fn(
      email: email,
      password: password,
    );
    // do some processing
    return true;
  } catch (e) {
    // handle the error here
    return false;
  } finally {
    // perform cleanup
  }
}

Future<bool> register({
  required String email,
  required String password,
}) =>
    _registerOrLogin(
      fn: FirebaseAuth.instance.createUserWithEmailAndPassword,
      email: email,
      password: password,
    );

Future<bool> login({
  required String email,
  required String password,
}) =>
    _registerOrLogin(
      fn: FirebaseAuth.instance.signInWithEmailAndPassword,
      email: email,
      password: password,
    );
