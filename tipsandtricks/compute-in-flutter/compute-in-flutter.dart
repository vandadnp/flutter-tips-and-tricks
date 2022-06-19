// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;
import 'dart:convert' show utf8, json;

@immutable
class Person {
  final String name;
  final int age;
  const Person(this.name, this.age);
  Person.fromJson(Map<String, dynamic> json)
      : name = json["name"] as String,
        age = json["age"] as int;
}

Future<Iterable<Person>> downloadAndParsePersons(Uri uri) => HttpClient()
    .getUrl(uri)
    .then((req) => req.close())
    .then((response) => response.transform(utf8.decoder).join())
    .then((jsonString) => json.decode(jsonString) as List<dynamic>)
    .then((json) => json.map((map) => Person.fromJson(map)));

void testIt() async {
  final persons = await compute(
    downloadAndParsePersons,
    Uri.parse('https://bit.ly/3Jjcw8R'),
  );
  devtools.log(persons.toString());
}
