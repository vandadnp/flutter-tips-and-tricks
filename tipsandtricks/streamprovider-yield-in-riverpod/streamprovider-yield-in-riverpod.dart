// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

final paginatedPathProvider = StreamProvider.family<List<Reference>, String>(
  (ref, String path) async* {
    final userId = ref.watch(userIdProvider);
    if (userId == null) {
      return;
    }
    final child = FirebaseStorage.instance.ref().child(path);
    String? paginationToken;
    do {
      final result = await child.list(
        ListOptions(
          maxResults: 50,
          pageToken: paginationToken,
        ),
      );
      yield result.items;
      paginationToken = result.nextPageToken;
    } while (paginationToken != null);
  },
);

class ThumbnailGalleryView extends ConsumerWidget {
  const ThumbnailGalleryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userIdProvider);
    final images = ref.watch(paginatedPathProvider('$userId/images'));
    // rest of your code goes here
    
