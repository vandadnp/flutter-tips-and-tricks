// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

Future<bool> deleteAccountAndDocuments() async {
  final auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  if (user == null) {
    return false;
  }
  final userId = user.uid;
  // delete user documents
  try {
    final store = FirebaseFirestore.instance;
    final operation = store.batch();
    final collection = await store.collection(userId).get();
    for (final document in collection.docs) {
      operation.delete(document.reference);
    }
    await operation.commit();
    // delete the user
    await user.delete();
    // log the user out
    await auth.signOut();
    return true;
  } catch (_) {
    return false;
  }
}
