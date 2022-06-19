// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

@immutable
class AppState {
  final bool isLoading;
  final Object? loginError;
  final String? loginHandle;
  final Iterable<String>? fetchedNotes;

  @override
  String toString() => {
        'isLoading': isLoading,
        'loginError': loginError,
        'loginHandle': loginHandle,
        'fetchedNotes': fetchedNotes
      }.toString();

  const AppState({
    required this.isLoading,
    required this.loginError,
    required this.loginHandle,
    required this.fetchedNotes,
  });
}
