import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/features/account/logic/get_user_data/get_user_data_cubit.dart';
import 'package:depi_graduation_project/features/account/widgets/empty_account_widget.dart';
import 'package:depi_graduation_project/features/bag/logic/bag/bag_cubit.dart';
import 'package:depi_graduation_project/features/bag/logic/promo_code/promo_code_cubit.dart';
import 'package:depi_graduation_project/features/bag/widgets/bag_empty_widget.dart';
import 'package:depi_graduation_project/features/bag/widgets/bag_item_tile.dart';
import 'package:depi_graduation_project/features/bag/widgets/total_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetUserDataCubit, GetUserDataState>(
        builder: (context, state) {
          if (state is GetUserNotLoggedIn) {
            return const EmptyAccountWidget();
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<BagCubit>().loadBagItems(
                  FirebaseAuth.instance.currentUser!.uid,
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60.h),
                      CustomSectionHeaderWidget(title: 'bag'),
                      SizedBox(height: 35.h),
                      BlocBuilder<BagCubit, BagState>(
                        builder: (context, state) {
                          if (state is BagSuccess) {
                            double total = 0;
                            for (var product in state.products) {
                              total = 0;
                              final qty = state.bagModel.items
                                  .firstWhere(
                                    (item) => item.productId == product.id,
                                  )
                                  .quantity;
                              total += product.price * qty;
                            }
                            if (state.products.isEmpty) {
                              return const BagEmptyWidget();
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListView.separated(
                                  itemCount: state.products.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 16.h),
                                  itemBuilder: (_, i) {
                                    final item = state.products[i];
                                    return BagItemTile(
                                      item: item,
                                      quantity: state.bagModel.items
                                          .firstWhere(
                                            (bagItem) =>
                                                bagItem.productId == item.id,
                                          )
                                          .quantity,
                                      onRemove: () {
                                        context.read<BagCubit>().removeItem(
                                          userId: FirebaseAuth
                                              .instance
                                              .currentUser!
                                              .uid,
                                          productId: item.id,
                                        );
                                      },
                                      onIncrement: () {
                                        context
                                            .read<BagCubit>()
                                            .incrementQuantity(
                                              userId: FirebaseAuth
                                                  .instance
                                                  .currentUser!
                                                  .uid,
                                              productId: item.id,
                                            );
                                      },
                                      onDecrement: () {
                                        context
                                            .read<BagCubit>()
                                            .decrementQuantity(
                                              userId: FirebaseAuth
                                                  .instance
                                                  .currentUser!
                                                  .uid,
                                              productId: item.id,
                                            );
                                      },
                                    );
                                  },
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  'Promo Code',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                      ),
                                ),
                                SizedBox(height: 8.h),
                                TextField(
                                  decoration: InputDecoration(hintText: 'Code'),
                                  onChanged: (value) {
                                    context
                                        .read<PromoCodeCubit>()
                                        .applyPromoCode(value, total);
                                  },
                                ),
                                SizedBox(height: 24.h),
                                TotalSection(total: total),
                                SizedBox(height: 24.h),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRouteNames.checkoutScreenRoute,
                                      arguments: [total, state.bagModel],
                                    );
                                  },
                                  child: const Text('Continue'),
                                ),
                                SizedBox(height: 20.h),
                              ],
                            );
                          } else {
                            return const BagEmptyWidget();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
