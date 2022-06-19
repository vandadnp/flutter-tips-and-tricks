import 'dart:developer' as dev show log;

extension OnError<T> on Future<T> {
  Future<T> onErrorJustReturn(T value) => catchError((_) => value);
}

Future<bool> isUserRegistered({required String email}) => HttpClient()
    .postUrl(Uri.parse('https://website'))
    .then((req) {
      req.headers.add('email', email);
      return req.close();
    })
    .then((resp) => resp.statusCode == 200)
    .onErrorJustReturn(false);

void testIt() async {
  final isFooRegistered = await isUserRegistered(email: 'foo@flutter.com');
  dev.log(isFooRegistered.toString());
}
