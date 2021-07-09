import 'dart:ui' as ui;

Future<Size> getImageSize(String uri) {
  final image = Image.network('https://bit.ly/3dAtFwy');
  final comp = Completer<ui.Image>();
  image.image
      .resolve(
        ImageConfiguration.empty,
      )
      .addListener(
        ImageStreamListener(
          (ImageInfo info, _) => comp.complete(info.image),
        ),
      );
  return comp.future.then(
    (image) => Size(
      image.width.toDouble(),
      image.height.toDouble(),
    ),
  );
}

void testIt() async {
  final imageSize = await getImageSize('https://bit.ly/3dAtFwy');
  print(imageSize);
  assert(imageSize.width == 2048.0);
  assert(imageSize.height == 1365.0);
  print(imageSize.aspectRatio);
}
