import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/core/utils/snakbar/snackebar_helper.dart';
import 'package:depi_graduation_project/features/account/logic/get_user_data/get_user_data_cubit.dart';
import 'package:depi_graduation_project/features/bag/logic/bag/bag_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/product/product_cubit.dart';
import 'package:depi_graduation_project/features/home/widgets/review/no_reviews_widget.dart';
import 'package:depi_graduation_project/features/home/widgets/review/review_card_widget.dart';
import 'package:depi_graduation_project/features/saved_items/logic/saved_items/saved_items_cubit.dart';
import 'package:depi_graduation_project/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:depi_graduation_project/features/home/models/product/product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _selectedColorIndex = 0;
  int _selectedImageIndex = 0;
  bool _expandedProductDetails = false;
  bool _expandedReviewsDetails = false;

  navigatorToNewReviews(BuildContext context, ProductModel args) {
    Navigator.pushNamed(
      context,
      AppRouteNames.newReviewsScreenRoute,
      arguments: args,
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          ProductModel product = args;
          if (state is ProductSuccess) {
            try {
              product = state.products.firstWhere((p) => p.id == args.id);
            } catch (_) {}
          }
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          PageView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: args.imageUrl.length,
                            onPageChanged: (index) {
                              setState(() {
                                _selectedImageIndex = index;
                              });
                            },
                            itemBuilder: (_, index) {
                              return Hero(
                                tag: 'product_${args.id}',
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRouteNames.storyScreenRoute,
                                      arguments: args,
                                    );
                                  },
                                  child: Image.network(
                                    product.imageUrl[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.width - 20.h,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6.w,
                                  vertical: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceContainerHighest
                                      .withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: AnimatedSmoothIndicator(
                                  activeIndex: _selectedImageIndex,
                                  count: args.imageUrl.length,
                                  effect: ExpandingDotsEffect(
                                    activeDotColor: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    dotColor: Colors.grey,
                                    dotHeight: 7.w,
                                    dotWidth: 7.w,
                                    spacing: 4.w,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          BlocBuilder<GetUserDataCubit, GetUserDataState>(
                            builder: (context, state) {
                              if (state is GetUserNotLoggedIn) {
                                return SizedBox.shrink();
                              } else {
                                return Positioned(
                                  top: 30.h,
                                  right: 16.w,
                                  child: IconButton.filled(
                                    style: IconButton.styleFrom(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .surfaceContainerHighest
                                          .withOpacity(0.8),
                                    ),
                                    onPressed: () {
                                      context
                                          .read<SavedItemsCubit>()
                                          .addSavedItem(
                                            userId: FirebaseAuth
                                                .instance
                                                .currentUser!
                                                .uid,
                                            productId: product.id,
                                          );
                                    },
                                    icon:
                                        BlocConsumer<
                                          SavedItemsCubit,
                                          SavedItemsState
                                        >(
                                          listener: (context, state) {
                                            if (state is SavedItemsLoaded) {
                                              SnackbarHelper.showSuccess(
                                                context,
                                                "Added to saved items",
                                              );
                                            }
                                          },
                                          builder: (context, state) {
                                            return Icon(Iconsax.heart);
                                          },
                                        ),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '\$${product.price}',
                              style: Theme.of(context).textTheme.headlineSmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              product.description,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Wrap(
                              spacing: 8.w,
                              runSpacing: 8.h,
                              children: List.generate(product.colors.length, (
                                index,
                              ) {
                                final name = product.colors[index].name;
                                final Color dotColor =
                                    product.colors[index].color;
                                final bool selected =
                                    _selectedColorIndex == index;
                                return ChoiceChip(
                                  label: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 18.sp,
                                        height: 18.sp,
                                        decoration: BoxDecoration(
                                          color: dotColor,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.black12,
                                            width: 0.5,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 6.w),
                                      Text(name),
                                    ],
                                  ),
                                  selected: selected,
                                  onSelected: (_) {
                                    setState(() {
                                      _selectedColorIndex = index;
                                    });
                                  },
                                  selectedColor: Theme.of(
                                    context,
                                  ).colorScheme.primary.withOpacity(0.12),
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .surfaceContainerHighest
                                      .withOpacity(0.4),
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                      color: selected
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.primary
                                          : Theme.of(context).dividerColor,
                                    ),
                                  ),
                                  labelStyle: Theme.of(
                                    context,
                                  ).textTheme.labelLarge,
                                );
                              }),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          BlocBuilder<GetUserDataCubit, GetUserDataState>(
                            builder: (context, state) {
                              if (state is GetUserNotLoggedIn) {
                                return ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRouteNames.loginScreenRoute,
                                    );
                                  },
                                  child: Text(
                                    S.of(context).productLoginToAddToBag,
                                  ),
                                );
                              } else {
                                return ElevatedButton.icon(
                                  onPressed: () {
                                    context.read<BagCubit>().addBagItem(
                                      userId: FirebaseAuth
                                          .instance
                                          .currentUser!
                                          .uid,
                                      product: product,
                                    );
                                  },
                                  icon: BlocBuilder<BagCubit, BagState>(
                                    builder: (context, state) {
                                      if (state is BagLoading) {
                                        return SizedBox.shrink();
                                      }
                                      return Icon(Iconsax.shopping_cart5);
                                    },
                                  ),
                                  label: BlocBuilder<BagCubit, BagState>(
                                    builder: (context, state) {
                                      if (state is BagLoading) {
                                        return CircularProgressIndicator(
                                          color: Colors.white,
                                        );
                                      }
                                      return Text(
                                        S.of(context).productAddToBag,
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),

                          SizedBox(height: 30.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              S.of(context).productDetails,
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 7.h),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: _expandedProductDetails ? null : 80.h,
                            child: _expandedProductDetails
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        S.of(context).productMeasurements,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleSmall,
                                      ),
                                      SizedBox(height: 4.h),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${S.of(context).productHeight}: ${product.details?.measurements.height ?? ""} cm",
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${S.of(context).productWidth}: ${product.details?.measurements.width ?? ""} cm",
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${S.of(context).productDepth}: ${product.details?.measurements.depth ?? ''} cm",
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${S.of(context).productWeight}: ${product.details?.measurements.weight ?? ''} kg",
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 16.h),

                                      Text(
                                        S.of(context).productComposition,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleMedium,
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        "${S.of(context).productMainMaterial}: ${product.details?.composition.mainMaterial ?? ''}",
                                      ),
                                      product
                                                  .details
                                                  ?.composition
                                                  .secondaryMaterial
                                                  .isEmpty ??
                                              true
                                          ? SizedBox.shrink()
                                          : Text(
                                              "${S.of(context).productSecondaryMaterial}:   ${product.details?.composition.secondaryMaterial ?? ''}",
                                            ),
                                    ],
                                  )
                                : ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.black,
                                          Colors.transparent,
                                        ],
                                        stops: [0.2, 1.0],
                                      ).createShader(bounds);
                                    },
                                    blendMode: BlendMode.dstIn,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.of(context).productMeasurements,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleSmall,
                                        ),
                                        SizedBox(height: 4.h),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Height: ${product.details?.measurements.height ?? ""} cm",
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                "Width: ${product.details?.measurements.width ?? ""} cm",
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "${S.of(context).productDepth}: ${product.details?.measurements.depth ?? ""} cm",
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                "${S.of(context).productWeight}: ${product.details?.measurements.weight ?? ""} kg",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _expandedProductDetails =
                                    !_expandedProductDetails;
                              });
                            },
                            child: Text(
                              _expandedProductDetails
                                  ? S.of(context).productShowLess
                                  : S.of(context).productShowMore,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),

                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.of(context).productReviews,
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              BlocBuilder<GetUserDataCubit, GetUserDataState>(
                                builder: (context, state) {
                                  if (state is GetUserNotLoggedIn) {
                                    return SizedBox.shrink();
                                  } else {
                                    return TextButton(
                                      onPressed: () => navigatorToNewReviews(
                                        context,
                                        product,
                                      ),
                                      child: Text(
                                        S.of(context).productAddReview,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                            ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 7.h),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: _expandedReviewsDetails
                                ? null
                                : (product.reviews.isEmpty)
                                ? 222.h
                                : 122.h,
                            child: product.reviews.isEmpty
                                ? noReviewsWidget(
                                    onPressed: () =>
                                        navigatorToNewReviews(context, product),
                                  )
                                : _expandedReviewsDetails
                                ? Column(
                                    children: List.generate(
                                      product.reviews.length,
                                      (index) => ReviewCardWidget(
                                        review: product.reviews[index],
                                      ),
                                    ),
                                  )
                                : ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.black,
                                          Colors.transparent,
                                        ],
                                        stops: [0.2, 1.0],
                                      ).createShader(bounds);
                                    },
                                    blendMode: BlendMode.dstIn,
                                    child: ReviewCardWidget(
                                      review: product.reviews[0],
                                      maxLines: 2,
                                    ),
                                  ),
                          ),
                          product.reviews.isEmpty
                              ? SizedBox.shrink()
                              : TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _expandedReviewsDetails =
                                          !_expandedReviewsDetails;
                                    });
                                  },
                                  child: Text(
                                    _expandedReviewsDetails
                                        ? S.of(context).productShowLess
                                        : S.of(context).productShowMore,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelLarge,
                                  ),
                                ),

                          product.reviews.isEmpty
                              ? SizedBox.shrink()
                              : SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 30.h,
                left: 16.w,
                child: IconButton.filled(
                  onPressed: () => Navigator.pop(context),
                  style: IconButton.styleFrom(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest.withOpacity(0.8),
                  ),
                  icon: Icon(Iconsax.arrow_left),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
