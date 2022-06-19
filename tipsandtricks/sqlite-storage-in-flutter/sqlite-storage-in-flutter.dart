//Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class Person implements Comparable {
  final int id;
  final String firstName;
  final String lastName;
  const Person(this.id, this.firstName, this.lastName);

  String get fullName => '$firstName $lastName';

  Person.fromData(Map<String, Object?> data)
      : id = data['ID'] as int,
        firstName = data['FIRST_NAME'] as String,
        lastName = data['LAST_NAME'] as String;

  @override
  int compareTo(covariant Person other) => other.id.compareTo(id);
}

typedef OnCompose = void Function(String firstName, String lastName);

class ComposeWidget extends StatefulWidget {
  final OnCompose onCompose;

  const ComposeWidget({Key? key, required this.onCompose}) : super(key: key);

  @override
  State<ComposeWidget> createState() => _ComposeWidgetState();
}

class _ComposeWidgetState extends State<ComposeWidget> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        TextField(
          style: TextStyle(fontSize: 24),
          decoration: InputDecoration(
            hintText: 'Enter first name',
          ),
          controller: firstNameController,
        ),
        TextField(
          style: TextStyle(fontSize: 24),
          decoration: InputDecoration(
            hintText: 'Enter last name',
          ),
          controller: lastNameController,
        ),
        TextButton(
          onPressed: () {
            final firstName = firstNameController.text;
            final lastName = lastNameController.text;
            widget.onCompose(firstName, lastName);
          },
          child: Text(
            'Add to list',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ]),
    );
  }
}

class _HomePageState extends State<HomePage> {
  late final Database db;
  bool hasSetUpAlready = false;

  Future<bool> setupDatabase() async {
    if (hasSetUpAlready == false) {
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/db.sqlite';
      try {
        db = await openDatabase(path);

        // create the table if it doesn't exist

        final create = '''CREATE TABLE IF NOT EXISTS PEOPLE (
          ID INTEGER PRIMARY KEY AUTOINCREMENT,
          FIRST_NAME STRING NOT NULL,
          LAST_NAME STRING NOT NULL
        )''';

        await db.execute(create);
        hasSetUpAlready = true;
        return true;
      } catch (e) {
        print('error = $e');
        hasSetUpAlready = false;
        return false;
      }
    } else {
      return true;
    }
  }

  Future<List<Person>> fetchPersons() async {
    if (!await setupDatabase()) {
      return [];
    }

    try {
      // read the existing data if any
      final readResult = await db.query(
        'PEOPLE',
        distinct: true,
        columns: ['ID', 'FIRST_NAME', 'LAST_NAME'],
        orderBy: 'ID',
      );

      final people = readResult.map((row) => Person.fromData(row)).toList()
        ..sort();
      return people;
    } catch (e) {
      print('error = $e');
      return [];
    }
  }

  Future<bool> addPerson(String firstName, String lastName) async {
    try {
      await db.insert(
        'PEOPLE',
        {
          'FIRST_NAME': firstName,
          'LAST_NAME': lastName,
        },
      );
      return true;
    } catch (e) {
      print('Error inserting $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite in Flutter'),
      ),
      body: FutureBuilder(
        future: fetchPersons(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final people = snapshot.data as List<Person>;
              return Column(
                children: [
                  ComposeWidget(
                    onCompose: (firstName, lastName) async {
                      await addPerson(firstName, lastName);
                      setState(() {});
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: people.length,
                      itemBuilder: (context, index) {
                        final person = people[index];
                        return ListTile(
                          title: Text(
                            person.fullName,
                            style: TextStyle(fontSize: 24),
                          ),
                          subtitle: Text(
                            'ID: ${person.id}',
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            default:
              return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
