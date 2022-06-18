// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

typedef AppBlocRandomUrlPicker = String Function(Iterable<String> allUrls);

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(
        math.Random().nextInt(length),
      );
}

class AppBloc extends Bloc<AppEvent, AppState> {
  String _pickRandomUrl(Iterable<String> allUrls) => allUrls.getRandomElement();

  AppBloc({
    required Iterable<String> urls,
    AppBlocRandomUrlPicker? urlPicker,
  }) : super(const AppState.empty()) {
    on<LoadNextUrlEvent>(
      (event, emit) {
        emit(
          const AppState(
            isLoading: true,
            data: null,
          ),
        );
        // pick a random URL to load
        final url = (urlPicker ?? _pickRandomUrl)(urls);
        HttpClient().getUrl(Uri.parse(url)); // continue here...
      },
    );
  }
}
