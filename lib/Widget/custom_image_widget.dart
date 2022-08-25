import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  final String imgUrl;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;

  const CustomImageWidget(
      {Key? key,
      required this.imgUrl,
      this.height,
      this.width,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: imgUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(
          value: progress.progress,
        ),
      ),
      errorWidget: (context, url, error) => Container(
          height: 100,
          width: 100,
          child: const Card(child: Icon(Icons.warning_amber_rounded))),
    );
  }
}
