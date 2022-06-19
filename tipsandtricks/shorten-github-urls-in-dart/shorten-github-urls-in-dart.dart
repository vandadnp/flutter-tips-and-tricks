// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;
import 'dart:convert' show utf8;

Future<Uri> shortenGitHubUrl(String longUrl) =>
    HttpClient().postUrl(Uri.parse('https://git.io/')).then((req) {
      req.add(utf8.encode('url=$longUrl'));
      return req.close();
    }).then(
      (resp) async {
        try {
          final location = resp.headers[HttpHeaders.locationHeader]?.first;
          if (location != null) {
            return Uri.parse(location);
          } else {
            throw 'No location was specified';
          }
        } catch (e) {
          return Uri.parse(longUrl);
        }
      },
    );

void testIt() async {
  final uri = await shortenGitHubUrl(
      'https://github.com/vandadnp/flutter-tips-and-tricks');
  devtools.log(uri.toString());
  // logs https://git.io/JS5Fm
}
