import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pingolearn/res/AppColors.dart';
import 'package:shimmer/shimmer.dart';


class CachedImageWidget extends StatelessWidget {
  final String? imageUrl;
  final String? placeHolderImage;
  final double? height, width;
  final double? radius;
  final BorderRadius? radiusOnly;
  final BoxFit? fit;

  const CachedImageWidget({Key? key, this.fit, this.radiusOnly, @required this.imageUrl, this.height, this.width, this.radius, this.placeHolderImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: '$imageUrl',
        width: width == null ? 120 : width,
        height: height == null ? 160 : height,
        placeholder: (context, url) => Shimmer.fromColors(
              baseColor: AppColors.baseLightColor,
              highlightColor: AppColors.highLightColor,
              child: Container(
                width: width == null ? 120 : width,
                height: height == null ? 160 : height,
                decoration: BoxDecoration(
                  color: AppColors.shimmerBackgroundColor,
                  borderRadius: radiusOnly ?? BorderRadius.circular(radius ?? 12),
                ),
              ),
            ),
        imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius:radiusOnly?? BorderRadius.circular(radius ?? 12),
                image: DecorationImage(
                  image: imageProvider,
                  fit: fit ?? BoxFit.cover,
                ),
              ),
            ),
        errorWidget: (context, url, error) => placeHolderImage == null
            ? Container(
                width: width == null ? 120 : width,
                height: height == null ? 160 : height,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius:radiusOnly?? BorderRadius.circular(radius ?? 12),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius ?? 12),
                  image: DecorationImage(
                    image: AssetImage(placeHolderImage ?? ''),
                    fit: BoxFit.fill,
                  ),
                ),
              ));
  }
}
