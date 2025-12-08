import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/features/account/logic/get_user_data/get_user_data_cubit.dart';
import 'package:depi_graduation_project/features/home/models/product/product_model.dart';
import 'package:depi_graduation_project/features/saved_items/logic/saved_items/saved_items_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          arguments: product,
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
                  image: NetworkImage(product.imageUrl[0]),
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
              BlocBuilder<GetUserDataCubit, GetUserDataState>(
                builder: (context, state) {
                  if (state is GetUserNotLoggedIn) {
                    return SizedBox(width: 1, height: 1);
                  } else {
                    return IconButton(
                      onPressed: () {
                        context.read<SavedItemsCubit>().addSavedItem(
                          userId: FirebaseAuth.instance.currentUser!.uid,
                          productId: product.id,
                        );
                      },
                      icon: Icon(Iconsax.heart, size: 24.sp),
                    );
                  }
                },
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
