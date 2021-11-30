// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;

const host = 'freecurrencyapi.net';
const path = '/api/v2/latest';
const apiKey = 'YOUR_API_KEY';
const baseCurrency = 'sek';
const params = {
  'apiKey': apiKey,
  'base_currency': 'sek',
};

void insteadOfThis() {
  const url = 'https://$host$path?apiKey=$apiKey&base_currency=$baseCurrency';
  url.log();
}

void doThis() {
  final url = Uri.https(host, path, params);
  url.log();
}

extension Log on Object {
  void log() {
    devtools.log(toString());
  }
}
