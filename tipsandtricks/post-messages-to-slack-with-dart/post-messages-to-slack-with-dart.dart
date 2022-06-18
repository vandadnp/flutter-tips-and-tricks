// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:convert' show utf8;
import 'dart:convert' show json;

class SlackMessage {
  final String? inChannel;
  final String? userName;
  final String message;
  final String? iconEmoji;

  const SlackMessage({
    required this.inChannel,
    required this.userName,
    required this.message,
    required this.iconEmoji,
  });

  Future<bool> send(String webhookUrl) async {
    final payload = {
      'text': message,
      if (inChannel != null) 'channel': inChannel!,
      if (userName != null) 'username': userName!,
      if (iconEmoji != null) 'icon_emoji': iconEmoji!
    };

    final request = await HttpClient().postUrl(Uri.parse(webhookUrl));
    final payloadData = utf8.encode(json.encode(payload));
    request.add(payloadData);
    final response = await request.close();
    return response.statusCode == 200;
  }
}

const webhookUrl = 'put your webhook url here';

void testIt() async {
  final message = SlackMessage(
    inChannel: 'dart',
    userName: 'Flutter',
    message: 'Hello from Dart in Terminal',
    iconEmoji: 'blue_heart:',
  );
  if (await message.send(webhookUrl)) {
    print('Successfully sent the message');
  } else {
    print('Could not send the message');
  }
}
