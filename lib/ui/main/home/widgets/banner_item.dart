import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/core/theme/app_colors.dart';
import 'package:my_goodzone/data/models/banners/banners_response.dart';

class BannerItem extends StatelessWidget {
  final Banners? banner;
  final Function()? onTap;

  const BannerItem({Key? key, this.banner, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = (Get.width - 44) / 3;
    return Container(
      width: width,
      height: width * 88 / 112,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      margin: EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          ///banner image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Hero(
                tag: banner?.id ?? '',
                child: CachedNetworkImage(
                  imageUrl: banner?.image ?? '',
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: CupertinoActivityIndicator()),
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/png/logo.png"),
                ),
              ),
            ),
          ),

          /// onPressed banner
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
