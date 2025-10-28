import 'package:depi_graduation_project/core/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ProductGridItem extends StatelessWidget {
  final int price;
  final String? imageAsset;
  final VoidCallback? onFavoritePressed;
  final bool isSaved;
  const ProductGridItem({
    super.key,
    required this.price,
    this.imageAsset,
    this.onFavoritePressed,
    this.isSaved = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageAsset ?? Assets.assetsImagesPic),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${(price + 1) * 50}',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: onFavoritePressed ?? () {},
              icon: Icon(isSaved ? Iconsax.heart5 : Iconsax.heart, size: 24.sp),
            ),
          ],
        ),
        Text(
          'Furniture Furniture Furniture Furniture Furniture Furniture Furniture Item ${price + 1}',
          style: Theme.of(context).textTheme.bodyMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
