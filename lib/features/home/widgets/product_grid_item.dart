import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/features/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ProductGridItem extends StatelessWidget {
  final ProductModel product;
  const ProductGridItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRouteNames.productScreenRoute,
          arguments: {
            'price': product.price,
            'imageUrl': product.imageUrl,
            'isSaved': false,
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'product_${product.id}',
            child: Container(
              height: 180.h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${product.price}',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Iconsax.heart, size: 24.sp),
              ),
            ],
          ),
          Text(
            product.description,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
