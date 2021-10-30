//Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

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

  @override
  bool operator ==(covariant Person other) => id == other.id;

  @override
  String toString() =>
      'Person, ID = $id, firstName = $firstName, lastName = $lastName';
}

class PersonDB {
  final _controller = StreamController<List<Person>>.broadcast();
  List<Person> _persons = [];
  Database? _db;
  final String dbName;
  PersonDB({required this.dbName});

  Future<bool> close() async {
    final db = _db;
    if (db == null) {
      return false;
    }
    await db.close();
    return true;
  }

  Future<bool> open() async {
    if (_db != null) {
      return true;
    }
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/$dbName';
    try {
      final db = await openDatabase(path);
      _db = db;

      // create the table if it doesn't exist

      final create = '''CREATE TABLE IF NOT EXISTS PEOPLE (
          ID INTEGER PRIMARY KEY AUTOINCREMENT,
          FIRST_NAME STRING NOT NULL,
          LAST_NAME STRING NOT NULL
        )''';

      await db.execute(create);

      // if everything went fine, we then read all the objects
      // and populate the stream

      _persons = await _fetchPeople();
      _controller.add(_persons);
      return true;
    } catch (e) {
      print('error = $e');
      return false;
    }
  }

  Future<List<Person>> _fetchPeople() async {
    final db = _db;
    if (db == null) {
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

      final people = readResult.map((row) => Person.fromData(row)).toList();
      return people;
    } catch (e) {
      print('error = $e');
      return [];
    }
  }

  Future<bool> delete(Person person) async {
    final db = _db;
    if (db == null) {
      return false;
    }
    try {
      final deletedCount = await db.delete(
        'PEOPLE',
        where: 'ID = ?',
        whereArgs: [person.id],
      );

      // delete it locally as well

      if (deletedCount == 1) {
        _persons.remove(person);
        _controller.add(_persons);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error inserting $e');
      return false;
    }
  }

  Future<bool> create(String firstName, String lastName) async {
    final db = _db;
    if (db == null) {
      return false;
    }
    try {
      final id = await db.insert(
        'PEOPLE',
        {
          'FIRST_NAME': firstName,
          'LAST_NAME': lastName,
        },
      );

      final person = Person(id, firstName, lastName);
      _persons.add(person);
      _controller.add(_persons);

      return true;
    } catch (e) {
      print('Error inserting $e');
      return false;
    }
  }

  // uses the person's id to update its first name and last name
  Future<bool> update(Person person) async {
    final db = _db;
    if (db == null) {
      return false;
    }
    try {
      final updatedCount = await db.update(
        'PEOPLE',
        {
          'FIRST_NAME': person.firstName,
          'LAST_NAME': person.lastName,
        },
        where: 'ID = ?',
        whereArgs: [person.id],
      );

      if (updatedCount == 1) {
        _persons.removeWhere((p) => p.id == person.id);
        _persons.add(person);
        _controller.add(_persons);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error inserting $e');
      return false;
    }
  }

  Stream<List<Person>> all() =>
      _controller.stream.map((event) => event..sort());
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

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PersonDB _crudStorage;

  @override
  void initState() {
    _crudStorage = PersonDB(dbName: 'db.sqlite');
    _crudStorage.open();
    super.initState();
  }

  @override
  void dispose() {
    _crudStorage.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite in Flutter'),
      ),
      body: StreamBuilder(
        stream: _crudStorage.all(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.waiting:
              if (snapshot.data == null) {
                return Center(child: CircularProgressIndicator());
              }
              final people = snapshot.data as List<Person>;
              return Column(
                children: [
                  ComposeWidget(
                    onCompose: (firstName, lastName) async {
                      await _crudStorage.create(firstName, lastName);
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: people.length,
                      itemBuilder: (context, index) {
                        final person = people[index];
                        return ListTile(
                          onTap: () async {
                            final update =
                                await showUpdateDialog(context, person);
                            if (update == null) {
                              return;
                            }
                            await _crudStorage.update(update);
                          },
                          title: Text(
                            person.fullName,
                            style: TextStyle(fontSize: 24),
                          ),
                          subtitle: Text(
                            'ID: ${person.id}',
                            style: TextStyle(fontSize: 18),
                          ),
                          trailing: TextButton(
                            onPressed: () async {
                              final shouldDelete =
                                  await showDeleteDialog(context);
                              if (shouldDelete) {
                                await _crudStorage.delete(person);
                              }
                            },
                            child: Icon(
                              Icons.disabled_by_default_rounded,
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            default:
              return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

final firstNameController = TextEditingController();
final lastNameController = TextEditingController();

Future<Person?> showUpdateDialog(BuildContext context, Person person) {
  firstNameController.text = person.firstName;
  lastNameController.text = person.lastName;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Enter your udpated values here:'),
            TextField(controller: firstNameController),
            TextField(controller: lastNameController),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(null);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final newPerson = Person(
                person.id,
                firstNameController.text,
                lastNameController.text,
              );
              Navigator.of(context).pop(newPerson);
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  ).then((value) {
    if (value is Person) {
      return value;
    } else {
      return null;
    }
  });
}

Future<bool> showDeleteDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text('Delete'),
          )
        ],
      );
    },
  ).then(
    (value) {
      if (value is bool) {
        return value;
      } else {
        return false;
      }
    },
  );
}
