// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';

T centered<T>() {
  switch (T) {
    case CrossAxisAlignment:
      return CrossAxisAlignment.center as T;
    case MainAxisAlignment:
      return MainAxisAlignment.center as T;
    case Alignment:
      return Alignment.center as T;
    default:
      throw UnsupportedError('$T is not supported');
  }
}

class MyRow extends StatelessWidget {
  const MyRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: centered(),
      mainAxisAlignment: centered(),
      children: [
        TextButton(
          onPressed: () {},
          child: const Text('Press me'),
        ),
      ],
    );
  }
}
