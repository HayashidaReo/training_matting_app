import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconImage extends StatelessWidget {
  const IconImage({
    super.key,
    required this.iconImageUrl,
    required this.size,
    this.onTap,
  });

  final String iconImageUrl;
  final double size;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child:
          (iconImageUrl.isEmpty)
              ? ClipOval(
                child: Image.asset(
                  'assets/images/default_user_icon.png',
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                ),
              )
              : CachedNetworkImage(
                imageUrl: iconImageUrl,
                imageBuilder:
                    (context, imageProvider) => ClipOval(
                      child: Image(
                        image: imageProvider,
                        width: size,
                        height: size,
                        fit: BoxFit.cover,
                      ),
                    ),
                progressIndicatorBuilder:
                    (context, url, downloadProgress) => SizedBox(
                      width: size,
                      height: size,
                      child: Center(child: CupertinoActivityIndicator()),
                    ),
                errorWidget:
                    (context, url, error) => SizedBox(
                      width: size,
                      height: size,
                      child: Icon(Icons.image_not_supported_rounded),
                    ),
              ),
    );
  }
}
