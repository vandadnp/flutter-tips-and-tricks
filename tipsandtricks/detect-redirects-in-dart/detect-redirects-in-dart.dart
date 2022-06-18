// Want to support my work 🤝? https://buymeacoffee.com/vandad

Future<bool> doesRedirect(String url) => HttpClient()
    .headUrl(Uri.parse(url))
    .then((req) => req..followRedirects = false)
    .then((req) => req.close())
    .then((resp) => resp.statusCode)
    .then((statusCode) => [301, 302, 303, 307, 308].contains(statusCode));

void testIt() async {
  final test1 = await doesRedirect('https://cnn.it/3xu58Ap');
  assert(test1 == true);

  final test2 = await doesRedirect('https://dart.dev');
  assert(test2 == false);

  final test3 = await doesRedirect('https://bit.ly/2VcCSow');
  assert(test3 == true);
}
