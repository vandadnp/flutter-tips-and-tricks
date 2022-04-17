// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

enum TypeOfThing { animal, person, object }

abstract class Thing {
  final TypeOfThing type;
  final String name;
  const Thing({
    required this.type,
    required this.name,
  });
}

class Person extends Thing {
  const Person({
    required String name,
  }) : super(
          name: name,
          type: TypeOfThing.person,
        );
}

class Animal extends Thing {
  const Animal({
    required String name,
  }) : super(
          name: name,
          type: TypeOfThing.animal,
        );
}

class Object extends Thing {
  const Object({
    required String name,
  }) : super(
          name: name,
          type: TypeOfThing.object,
        );
}

const things = [
  Person(name: 'Foo'),
  Person(name: 'Bar'),
  Animal(name: 'Goof ball'),
  Animal(name: 'Fluffers'),
  Object(name: 'Chair'),
  Object(name: 'Table'),
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FilterChip in Flutter'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: ListOfThings(),
      ),
    );
  }
}

class ListOfThings extends StatefulWidget {
  const ListOfThings({Key? key}) : super(key: key);

  @override
  State<ListOfThings> createState() => _ListOfThingsState();
}

class _ListOfThingsState extends State<ListOfThings> {
  TypeOfThing? filter;

  Iterable<Thing> get filteredThings => filter != null
      ? things.where(
          (thing) => thing.type == filter,
        )
      : things;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 10,
          children: TypeOfThing.values.map(
            (typeOfThing) {
              return FilterChip(
                selectedColor: Colors.blueAccent[100],
                checkmarkColor: Colors.white,
                onSelected: (value) {
                  setState(
                    () => filter = (value ? typeOfThing : null),
                  );
                },
                label: Text(typeOfThing.name),
                selected: filter == typeOfThing,
              );
            },
          ).toList(),
        ),
        const SizedBox(height: 10),
        ThingsList(
          filteredThings: filteredThings,
        )
      ],
    );
  }
}

class ThingsList extends StatelessWidget {
  const ThingsList({
    Key? key,
    required this.filteredThings,
  }) : super(key: key);

  final Iterable<Thing> filteredThings;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: filteredThings.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              filteredThings.elementAt(index).name,
            ),
            subtitle: Text(
              filteredThings.elementAt(index).type.name,
            ),
          );
        },
      ),
    );
  }
}
