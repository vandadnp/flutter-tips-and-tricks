// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

extension IterationWithIndex<T> on Iterable<T> {
  Iterable<E> mapWithIndex<E>(E Function(int index, T value) f) =>
      Iterable.generate(length).map((i) => f(i, elementAt(i)));
}

Iterable<Widget> imageWidgets() => imageUrls.mapWithIndex(
      (index, url) => NetworkImage(
        index: index,
        url: url,
      ),
    );
    
    
