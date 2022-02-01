// Free Flutter Course 💙 https://linktr.ee/vandadnp

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    ),
  );
}

extension ExpandEqually on Iterable<Widget> {
  Iterable<Widget> expandedEqually() => map(
        (w) => Expanded(
          flex: 1,
          child: w,
        ),
      );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 200,
                color: Colors.yellow,
              ),
              Container(
                height: 200,
                color: Colors.blue,
              ),
            ].expandedEqually().toList(),
          )
        ],
      ),
    );
  }
}
