// 🐦 Twitter:                  https://twitter.com/vandadnp
// 🔵 LinkedIn:                 https://linkedin.com/in/vandadnp
// 🎥 YouTube:                  https://youtube.com/c/vandadnp
// 💙 Free Flutter Course:      https://linktr.ee/vandadnp
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ConnectionText extends StatelessWidget {
  final AsyncSnapshot<ConnectivityResult> snapshot;
  const ConnectionText({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.active:
        final state = snapshot.data!;
        switch (state) {
          case ConnectivityResult.none:
            return const Text('Not connected');
          default:
            return const Text('Connected');
        }
        break;
      default:
        return const Text('');
    }
  }
}

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final connectivity = useMemoized(
      () => Connectivity(),
      [key],
    );
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<ConnectivityResult>(
          stream: connectivity.onConnectivityChanged,
          builder: (_, snapshot) => ConnectionText(
            snapshot: snapshot,
          ),
        ),
      ),
    );
  }
}
