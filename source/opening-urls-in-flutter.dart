//Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Person {
  final String profileUrl;
  final String name;
  final String email;
  final String phoneNumber;
  final String websiteUrl;

  const Person({
    Key? key,
    required this.profileUrl,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.websiteUrl,
  });

  Person.vandad()
      : profileUrl = 'https://bit.ly/3jwusS0',
        name = 'Vandad Nahavandipoor',
        email = 'vandad.np@gmail.com',
        phoneNumber = '071234567',
        websiteUrl = 'https://pixolity.se';
}

void open(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  }
}

class PersonNameView extends StatelessWidget {
  final Person person;
  const PersonNameView(this.person, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      person.name,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}

class PersonEmailView extends StatelessWidget {
  final Person person;
  const PersonEmailView(this.person, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        open('mailto:${person.email}');
      },
      child: Text(
        '💌 Email me',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}

class PersonPhoneView extends StatelessWidget {
  final Person person;
  const PersonPhoneView(this.person, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        open('tel://${person.phoneNumber}');
      },
      child: Text(
        '🤙🏻 Call me',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}

class PersonWebsiteView extends StatelessWidget {
  final Person person;
  const PersonWebsiteView(this.person, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        open(person.websiteUrl);
      },
      child: Text(
        '🌍 Visit my website',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}

const bigText = TextStyle(fontSize: 20.0);

class PersonView extends StatelessWidget {
  final Person person;
  const PersonView({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: Colors.white, width: 3.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 30.0,
              color: Colors.black.withAlpha(50),
              spreadRadius: 20.0,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100.0,
              backgroundImage: NetworkImage(person.profileUrl),
            ),
            SizedBox(height: 10),
            PersonNameView(person),
            PersonEmailView(person),
            PersonPhoneView(person),
            PersonWebsiteView(person)
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: PersonView(
            person: Person.vandad(),
          ),
        ),
      ),
    );
  }
}
