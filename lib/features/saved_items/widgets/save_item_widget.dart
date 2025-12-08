import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/core/utils/snakbar/snackebar_helper.dart';
import 'package:depi_graduation_project/features/bag/logic/bag/bag_cubit.dart';
import 'package:depi_graduation_project/features/home/models/product/product_model.dart';
import 'package:depi_graduation_project/features/saved_items/logic/saved_items/saved_items_cubit.dart';
import 'package:depi_graduation_project/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveItemWidget extends StatelessWidget {
  const SaveItemWidget({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRouteNames.productScreenRoute,
                  arguments: productModel,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  productModel.imageUrl[0],
                  width: 96.w,
                  height: 130.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${productModel.price}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Container(
                        width: 28.w,
                        height: 28.w,
                        decoration: BoxDecoration(
                          color: Theme.of(context).dividerColor.withOpacity(.2),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () async {
                            context.read<SavedItemsCubit>().removeSavedItem(
                              productId: productModel.id,
                              userId: FirebaseAuth.instance.currentUser!.uid,
                            );
                          },
                          icon: const Icon(Icons.close, size: 16),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    productModel.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Spacer(),

                  SizedBox(
                    width: 150.w,
                    height: 40.h,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<BagCubit>().addBagItem(
                          product: productModel,
                          userId: FirebaseAuth.instance.currentUser!.uid,
                        );
                      },
                      child: BlocConsumer<BagCubit, BagState>(
                        listener: (context, state) {
                          if (state is BagError) {
                            SnackbarHelper.showError(context, state.message);
                          } else if (state is BagSuccess) {
                            SnackbarHelper.showSuccess(
                              context,
                              'Item added to bag successfully',
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is BagLoading) {
                            return CircularProgressIndicator(
                              constraints: BoxConstraints(
                                minHeight: 30.h,
                                minWidth: 30.h,
                              ),
                              color: Colors.white,
                            );
                          } else {
                            return Text(S.of(context).savedItemsAddToBag);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
