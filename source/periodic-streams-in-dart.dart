// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

@immutable
class Person {
  final String name;
  final int age;

  const Person({
    required this.name,
    required this.age,
  });

  Person.fromJson(Map<String, dynamic> json)
      : name = json["name"] as String,
        age = json["age"] as int;

  @override
  String toString() => 'Person ($name, $age years old)';
}

mixin ListOfThingsAPI<T> {
  Future<Iterable<T>> get(String url) => HttpClient()
      .getUrl(Uri.parse(url))
      .then((req) => req.close())
      .then((resp) => resp.transform(utf8.decoder).join())
      .then((str) => json.decode(str) as List<dynamic>)
      .then((list) => list.cast());
}

class GetPeople with ListOfThingsAPI<Map<String, dynamic>> {
  Future<Iterable<Person>> getPeople(url) => get(url).then(
        (jsons) => jsons.map(
          (json) => Person.fromJson(json),
        ),
      );
}

Stream<dynamic> every(Duration duration) => Stream.periodic(duration);

extension IntToDuration on int {
  Duration get seconds => Duration(seconds: this);
}

void testIt() async {
  await for (final people in every(3.seconds).asyncExpand(
    (_) => GetPeople()
        .getPeople('http://127.0.0.1:5500/apis/people1.json')
        .asStream(),
  )) {
    people.log();
  }
}

/* people1.json
[
    {
        "name": "Foo 1",
        "age": 20
    },
    {
        "name": "Bar 1",
        "age": 30
    }
]
*/
