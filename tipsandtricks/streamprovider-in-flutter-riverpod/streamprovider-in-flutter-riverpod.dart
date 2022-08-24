// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userPostsProvider = StreamProvider.family<Iterable<Post>, UserID?>((
  ref,
  UserID? userId,
) {

  if (userId == null) {
    return const Stream<Iterable<Post>>.empty();
  }

  final controller = StreamController<Iterable<Post>>();

  final subscription = FirebaseFirestore.instance
      .collection('posts')
      .where(PostKey.userId.key, isEqualTo: userId)
      .snapshots()
      .listen(
    (snapshot) {
      final documents = snapshot.docs;
      final posts = documents.map(
        (doc) => Post.fromJson(
          doc.data(),
        ),
      );
      controller.sink.add(posts);
    },
  );

  ref.onDispose(() {
    subscription.cancel();
    controller.close();
  });

  return controller.stream;
});
