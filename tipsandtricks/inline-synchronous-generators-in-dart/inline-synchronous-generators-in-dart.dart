// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/foundation.dart' show immutable;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testingrxdart/models/contact.dart';

typedef Snapshots = QuerySnapshot<Map<String, dynamic>>;

@immutable
class ContactsBloc {
  final Sink<String?> userId;
  final Stream<Iterable<Contact>> contacts;

  const ContactsBloc._({
    required this.userId,
    required this.contacts,
  });

  factory ContactsBloc() {
    final userId = BehaviorSubject<String?>();

    // upon userId changing, get snapshots and convert to contacts

    final Stream<Iterable<Contact>> contacts =
        userId.switchMap<Snapshots>((userId) {
      if (userId == null) {
        return const Stream<Snapshots>.empty();
      } else {
        return FirebaseFirestore.instance.collection(userId).snapshots();
      }
    }).map((event) sync* {
      for (final doc in event.docs) {
        yield Contact.fromJson(doc.data());
      }
    });

    return ContactsBloc._(
      userId: userId,
      contacts: contacts,
    );
  }
}
