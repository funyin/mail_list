import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppFadeImage extends StatelessWidget {
  final String? image;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;

  const AppFadeImage(
      {super.key,
      this.image,
      this.width,
      this.height,
      this.fit = BoxFit.cover,
      this.placeholder});

  @override
  Widget build(BuildContext context) {
    if (image == null || image?.isEmpty == true) return _placeholder();
    return CachedNetworkImage(
      placeholder: (context, _) => placeholder ?? _placeholder(),
      errorWidget: (context, url, error) => placeholder ?? _placeholder(),
      height: height,
      width: width,
      fit: fit,
      imageUrl: image ?? "",
    );
  }

  Widget _placeholder() {
    return Container(
      color: Colors.grey.shade200,
      width: width,
      height: height,
    );
  }
}
