// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:io';

final checkoutUrl = Uri.parse('https://somewebsite.com/api/checkout');
final cleanupUrl = Uri.parse('https://somewebsite.com/api/cleanup');

Future<HttpClientResponse> prepareRequest(HttpClientRequest request) {
  request.headers.add('Content-Type', 'application/json');
  request.headers.add('Accept', 'application/json');
  return request.close();
}

Future<bool> cleanup(HttpClient client) {
  return client.postUrl(cleanupUrl).then(prepareRequest).then((_) => false);
}

Future<bool> checkOut() {
  final client = HttpClient();
  return client
      .postUrl(checkoutUrl)
      .then(prepareRequest)
      .then((_) => true)
      .onError((_, __) => cleanup(client));
}
