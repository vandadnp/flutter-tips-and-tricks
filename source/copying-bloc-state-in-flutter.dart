
// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

@immutable
class AppState {
  final bool isLoading;
  final LoginHandle? loginHandle;
  final Iterable<Note>? fetchedNotes;

  const AppState.empty()
      : isLoading = false,
        loginHandle = null,
        fetchedNotes = null;

  const AppState({
    required this.isLoading,
    required this.loginHandle,
    required this.fetchedNotes,
  });

  AppState copiedWith({
    bool? isLoading,
    LoginHandle? loginHandle,
    Iterable<Note>? fetchedNotes,
  }) =>
      AppState(
        isLoading: isLoading ?? this.isLoading,
        loginHandle: loginHandle ?? this.loginHandle,
        fetchedNotes: fetchedNotes ?? this.fetchedNotes,
      );
}
