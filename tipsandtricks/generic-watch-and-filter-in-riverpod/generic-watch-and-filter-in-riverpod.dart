// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
class Film {
  final String id;
  final String title;
  final String description;
  final bool isFavorite;

  const Film({
    required this.id,
    required this.title,
    required this.description,
    required this.isFavorite,
  });

  Film copy({required bool isFavorite}) => Film(
        id: id,
        title: title,
        description: description,
        isFavorite: isFavorite,
      );

  @override
  String toString() =>
      'Film(id: $id, title: $title, description: $description, isFavorite: $isFavorite)';

  @override
  bool operator ==(covariant Film other) =>
      other.id == id && other.isFavorite == isFavorite;

  @override
  int get hashCode => id.hashCode;
}

const allFilms = [
  Film(
      id: '1',
      title: 'The Shawshank Redemption',
      description: 'Description  for The Shawshank Redemption',
      isFavorite: false),
  Film(
      id: '2',
      title: 'The Godfather',
      description: 'Description for The Godfather',
      isFavorite: false),
  Film(
      id: '3',
      title: 'The Godfather: Part II',
      description: 'Description for The Godfather: Part II',
      isFavorite: false),
  Film(
      id: '4',
      title: 'The Dark Knight',
      description: 'Description for The Dark Knight',
      isFavorite: false),
];

class FilmsNotifier extends StateNotifier<List<Film>> {
  FilmsNotifier() : super(allFilms);
}

// all films

final filmsProvider = StateNotifierProvider<FilmsNotifier, Iterable<Film>>(
  (ref) => FilmsNotifier(),
);

Provider<Iterable<P>> watchedProviderWithWhereClause<P>(
  AlwaysAliveProviderListenable<Iterable<P>> provider,
  bool Function(P) f,
) =>
    Provider<Iterable<P>>(
      (ref) => ref.watch(provider).where(f),
    );

// favorite films

final insteadOfThis = Provider<Iterable<Film>>(
  (ref) => ref.watch(filmsProvider).where(
        (film) => film.isFavorite,
      ),
);

final youCanDoThis = watchedProviderWithWhereClause<Film>(
  filmsProvider,
  (film) => film.isFavorite,
);
