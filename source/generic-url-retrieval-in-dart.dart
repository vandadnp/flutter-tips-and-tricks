// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:developer' as dev show log;

typedef StatusCodeResultBuilder<T> = Future<T> Function(
  int statusCode,
  HttpClientResponse response,
);

extension Get on Uri {
  Future<T?> getBody<T>({
    StatusCodeResultBuilder<T>? statusBuilder,
    T Function(Object error)? onNetworkError,
  }) async {
    try {
      final apiCall = await HttpClient().getUrl(this);
      final response = await apiCall.close();
      final builder = statusBuilder;
      if (builder == null) {
        final data = await response.transform(convert.utf8.decoder).join();
        if (data is T) {
          return data as T?;
        } else {
          return null;
        }
      } else {
        final result = await builder(response.statusCode, response);
        return result;
      }
    } catch (e) {
      if (onNetworkError != null) {
        return onNetworkError(e);
      } else {
        return null;
      }
    }
  }
}

extension ToUri on String {
  Uri toUri() => Uri.parse(this);
}

const url = 'https://bit.ly/3EKWcLa';

void testIt() async {
  final json = await url.toUri().getBody<String>(
    statusBuilder: (statusCode, response) async {
      if (statusCode == 200) {
        return await response.transform(convert.utf8.decoder).join();
      } else {
        return "{'error': 'Unexpected status code $statusCode'}";
      }
    },
    onNetworkError: (error) {
      return "{'error': 'Got network error'}";
    },
  );
  if (json != null) {
    dev.log(json);
  }
}
