import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
import 'dart:convert' show utf8;
import 'package:meta/meta.dart' show useResult;

extension Log on Object {
  void log() => devtools.log(toString());
}

extension GetOnUri on Object {
  Future<HttpClientResponse> getUrl(
    String url,
  ) =>
      HttpClient()
          .getUrl(
            Uri.parse(
              url,
            ),
          )
          .then((req) => req.close());
}

mixin CanMakeGetCall {
  String get url;
  @useResult
  Future<String> getString() => getUrl(url).then(
        (response) => response
            .transform(
              utf8.decoder,
            )
            .join(),
      );
}

@immutable
class GetPeople with CanMakeGetCall {
  const GetPeople();
  @override
  String get url => 'http://127.0.0.1:5500/apis/people.json';
}

void testIt() async {
  final people = await const GetPeople().getString();
  devtools.log(people);
}
