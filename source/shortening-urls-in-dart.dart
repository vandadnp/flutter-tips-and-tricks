import 'dart:convert' show json;

Future<Uri> shortenUri(Uri uri, String bitlyToken) async {
  final client = HttpClient();

  final endpoint = Uri.https('api-ssl.bitly.com', '/v4/shorten');

  final response = await client.postUrl(endpoint).then(
    (req) {

      req.headers
        ..set(HttpHeaders.contentTypeHeader, 'application/json')
        ..set(HttpHeaders.authorizationHeader, 'Bearer $bitlyToken');

      final body = {
        'long_url': uri.toString(),
        'domain': 'bit.ly',
      };
      final bodyBytes = utf8.encode(json.encode(body));
      req.add(bodyBytes);

      return req.close();
    },
  );

  final responseBody = await response.transform(utf8.decoder).join();
  final responseJson = json.decode(responseBody) as Map<String, dynamic>;
  return Uri.parse(responseJson['link']);
}

void testIt() async {
  print(await shortenUri(
    Uri.parse('https://pixolity.se'),
    'XXX',
  ));
}
