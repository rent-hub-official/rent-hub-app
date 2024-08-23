import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_cache_controller.g.dart';

@Riverpod(keepAlive: true)
class ImageCacheController extends _$ImageCacheController {
  Map<String, MemoryImage> build() {
    return {};
  }

  Future<void> getCachedImage(String url) async {
    if (state.containsKey(url)) return;

    final imageData = await Dio()
        .get(url, options: Options(responseType: ResponseType.bytes));
    final image = MemoryImage(imageData.data);

    state = {...state, url: image};
  }
}
