import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:collection' show MapView;

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

enum State { ca, ny }

const Map<String, dynamic> json = {
  'addresses': {
    'home': {
      'street': '123 Main St',
      'city': 'Anytown',
      'state': State.ca,
      'zip': 11111,
    },
    'work': {
      'day_time': {
        'street': '321 Main St',
        'city': 'Anytown',
        'state': State.ny,
        'zip': 22222,
      },
    },
  },
  'basic_info': {
    'first_name': 'John',
    'last_name': 'Doe',
    'age': 33333,
  }
};

extension RecursiveSearchByDataType<K extends Comparable, V> on Map<K, V> {
  Iterable<MapEntry<K, T>> search<T>() sync* {
    Iterable<MapEntry<K, T>> _search(MapEntry<K, V> entry) sync* {
      if (entry.value is T) {
        yield MapEntry(
          entry.key,
          entry.value as T,
        );
      } else if (entry.value is Map<K, V>) {
        for (final entry in (entry.value as Map<K, V>).entries) {
          yield* _search(entry);
        }
      }
    }

    for (final entry in entries) {
      yield* _search(entry);
    }
  }
}

void testIt() {
  final entriesWithIntegerValue = json.search<int>();
  // (MapEntry(zip: 11111), MapEntry(zip: 22222), MapEntry(age: 33333))
  entriesWithIntegerValue.log();
  final stateEntries = json.search<State>();
  // (MapEntry(state: State.ca), MapEntry(state: State.ny))
  stateEntries.log();
}
