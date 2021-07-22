import 'dart:io' show HttpClient;

Future<bool> isSecuredWithValidCert(String uriString) async {
  final uri = Uri.parse(uriString);
  final client = HttpClient();
  try {
    await client.headUrl(uri).then((r) => r.close());
    return true;
  } on HandshakeException {
    return false;
  }
}

void testIt() async {
  await isSecuredWithValidCert('https://expired.badssl.com');
  await isSecuredWithValidCert('https://wrong.host.badssl.com');
  await isSecuredWithValidCert('https://self-signed.badssl.com');
  await isSecuredWithValidCert('https://untrusted-root.badssl.com');
  await isSecuredWithValidCert('https://revoked.badssl.com');
}
