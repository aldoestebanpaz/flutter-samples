import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:image/image.dart' as Img;
import 'package:image/image.dart';

// Credits: https://thomasgallinari.medium.com/remove-a-color-from-an-image-in-flutter-36770ac42669
class ImageFromProvider extends ImageProvider<_OurKey> {
  final ImageProvider imageProvider;

  ImageFromProvider(this.imageProvider);

  @override
  Future<_OurKey> obtainKey(ImageConfiguration configuration) {
    Completer<_OurKey>? completer;

    Future<_OurKey>? result;
    imageProvider.obtainKey(configuration).then((Object key) {
      if(completer == null) {
        result = SynchronousFuture<_OurKey>(_OurKey(key));
      }
      else {
        completer.complete(_OurKey(key));
      }
    });

    if(result != null) {
      return result!;
    }

    completer = Completer<_OurKey>();
    return completer.future;
  }

  @override
  ImageStreamCompleter load(_OurKey key, decode) {
    final ourDecoder = (
      Uint8List bytes, {
        bool? allowUpscaling,
        int? cacheWidth,
        int? cacheHeight,
      }) async {
        return decode(
          await whiteToAlfa(bytes),
          cacheWidth : cacheWidth,
          cacheHeight : cacheHeight,
        );
      };

      return imageProvider.load(key.providerCacheKey, ourDecoder);
  }

  whiteToAlfa(Uint8List bytes) async {
    final image = Img.decodeImage(bytes);
    final pixels = image!.getBytes(format: Format.rgba);
    final length = pixels.lengthInBytes;

    for(var i = 0; i < length; i += 4) {
      // if pixel is white (255,255,255)
      if(pixels[i] == 255 && pixels[i + 1] == 255  && pixels[i + 2] == 255) {
        // set alpha byte to 0
        // pixels[i] = 200;
        // pixels[i + 1] = 200;
        // pixels[i + 2] = 200;
        pixels[i + 3] = 0;
      }
    }

    return Img.encodePng(image);
  }
}

class _OurKey {
  final Object providerCacheKey;
  const _OurKey(this.providerCacheKey);

  @override
  bool operator == (Object other) {
    if(this.runtimeType != other.runtimeType) return false;

    return other is _OurKey && other.providerCacheKey == this.providerCacheKey;
  }

  @override
  int get hashCode => providerCacheKey.hashCode;
}
