// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobxreminders/extensions/if_debugging.dart';
import 'package:mobxreminders/state/app_state.dart';

import 'package:provider/provider.dart' show ReadContext;

class LoginView extends HookWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final button = TextButton(
      onPressed: () {
        context.read<AppState>().goToRegisterScreen();
      },
      child: const Text(
        'Not registered yet? Register here!',
      ),
    );
    
    ... rest of your code goes here
 
