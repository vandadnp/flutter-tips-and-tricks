// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    const App(),
  );
}

mixin HasStoreLink {
  Uri get storeLink;
}

@immutable
class AppStoreApp with HasStoreLink {
  final String country;
  final String appId;
  const AppStoreApp({
    required this.country,
    required this.appId,
  });
  @override
  Uri get storeLink => Platform.isIOS || Platform.isMacOS
      ? Uri.parse('itms-apps://itunes.apple.com'
          '/app/apple-store/id$appId')
      : Uri.parse('https://apps.apple.com'
          '/$country/app/id$appId');
}

@immutable
class PlayStoreApp with HasStoreLink {
  final String packageName;
  const PlayStoreApp(this.packageName);

  @override
  Uri get storeLink => Platform.isAndroid
      ? Uri.parse('market://details?id=$packageName')
      : Uri.parse('https://play.google.com/store'
          '/apps/details?id=$packageName');
}

@immutable
class UniversalApp {
  final String appId;
  final String country;
  final String packageName;
  const UniversalApp({
    required this.appId,
    required this.country,
    required this.packageName,
  });
  Future<void> open() {
    if (Platform.isIOS || Platform.isMacOS) {
      return launchUrl(
        AppStoreApp(
          appId: appId,
          country: country,
        ).storeLink,
      );
    } else if (Platform.isAndroid) {
      return launchUrl(
        PlayStoreApp(packageName).storeLink,
      );
    } else {
      throw UnsupportedError('Platform not supported');
    }
  }
}

void testIt() async {
  const needForSpeedNoLimits = UniversalApp(
    appId: 'id883393043',
    country: 'us',
    packageName: 'com.ea.game.nfs14_row',
  );
  await needForSpeedNoLimits.open();
}
