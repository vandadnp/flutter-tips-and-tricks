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

const people1Url = 'http://127.0.0.1:5500/apis/people11.json';
const people2Url = 'http://127.0.0.1:5500/apis/people2.json';

extension EmptyOnError<E> on Future<List<Iterable<E>>> {
  Future<List<Iterable<E>>> emptyOnError() => catchError(
        (_, __) => List<Iterable<E>>.empty(),
      );
}

Future<Iterable<Person>> parseJson(String url) => HttpClient()
    .getUrl(Uri.parse(url))
    .then((req) => req.close())
    .then((resp) => resp.transform(utf8.decoder).join())
    .then((str) => json.decode(str) as List<dynamic>)
    .then((json) => json.map((e) => Person.fromJson(e)));

void testIt() async {
  final persons = await Future.wait([
    parseJson(people1Url),
    parseJson(people2Url),
  ]).emptyOnError();
  persons.log();
}
