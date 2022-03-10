// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:math' show min;

@immutable
class VirtualTab {
  final Icon icon;
  final String text;

  const VirtualTab({
    required this.icon,
    required this.text,
  });
}

const tabs = [
  VirtualTab(
    icon: Icon(Icons.picture_as_pdf),
    text: 'All PDF files',
  ),
  VirtualTab(
    icon: Icon(Icons.ac_unit_outlined),
    text: 'Data page',
  ),
  VirtualTab(
    icon: Icon(Icons.person),
    text: 'Profile page',
  ),
];

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabCount = useState(1);
    return DefaultTabController(
      length: tabCount.value,
      initialIndex: tabCount.value - 1,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: tabs
                .take(tabCount.value)
                .map((tab) => Tab(icon: tab.icon))
                .toList(),
          ),
        ),
        body: CustomTabBarView(tabCount: tabCount),
      ),
    );
  }
}

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({
    Key? key,
    required this.tabCount,
  }) : super(key: key);

  final ValueNotifier<int> tabCount;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: tabs
          .take(tabCount.value)
          .map(
            (tab) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(tab.text),
                  TextButton(
                    onPressed: () {
                      final newLength = min(
                        tabs.length,
                        tabCount.value + 1,
                      );
                      tabCount.value = newLength;
                    },
                    child: const Text('Create next tab'),
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
