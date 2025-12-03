import 'dart:developer';

import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';

import 'package:depi_graduation_project/data/services/account_service/user_firestore_service.dart';
import 'package:depi_graduation_project/data/services/home_service/subscribe_service.dart';
import 'package:depi_graduation_project/features/home/logic/new_review/new_review_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/product/product_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/subscribes/subscribes_cubit.dart';
import 'package:depi_graduation_project/features/home/models/product/product_model.dart';
import 'package:depi_graduation_project/features/home/models/product/review_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewReviewsScreen extends StatefulWidget {
  const NewReviewsScreen({super.key});

  @override
  State<NewReviewsScreen> createState() => _NewReviewsScreenState();
}

class _NewReviewsScreenState extends State<NewReviewsScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController reviewController = TextEditingController();

  double rating = 0;
  String getRatingText(double rating) {
    if (rating == 0) return "Tap ⭐ to rate";

    if (rating <= 1) return "😣 Very Bad";
    if (rating <= 2) return "😕 Not Good";
    if (rating <= 3) return "😐 Average";
    if (rating <= 4) return "🙂 Good";
    if (rating <= 5) return "🤩 Excellent";

    return "";
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'New Reviews'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  double starValue = index + 1;

                  return GestureDetector(
                    onTapDown: (details) {
                      final tapX = details.localPosition.dx;
                      final width = 32.sp;
                      bool isHalf = tapX < width / 2;

                      setState(() {
                        rating = isHalf ? starValue - 0.5 : starValue;
                      });
                    },
                    child: Icon(
                      rating >= starValue
                          ? Icons.star
                          : (rating >= starValue - 0.5
                                ? Icons.star_half
                                : Icons.star_border),
                      size: 40.sp,
                      color: Colors.amber,
                    ),
                  );
                }),
              ),
              SizedBox(height: 10),
              Text(
                rating == 0 ? "Tap stars to rate" : getRatingText(rating),
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              SizedBox(height: 16.0),

              TextFormField(
                controller: reviewController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your review';
                  }
                  return null;
                },
                maxLines: 3,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(hintText: 'Your review'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    final user = await UserFirestoreService().getUserData(
                      FirebaseAuth.instance.currentUser!.uid,
                    );
                    context.read<NewReviewCubit>().newReview(
                      productId: args.id,
                      review: ReviewModel(
                        rating: rating,
                        comment: reviewController.text,
                        user: user!,
                        date: DateTime.now(),
                      ),
                    );
                  }
                },
                child: BlocConsumer<NewReviewCubit, NewReviewState>(
                  listener: (context, state) async {
                    if (state is NewReviewSuccess) {
                      final currentUser = FirebaseAuth.instance.currentUser!;
                      final isSubscribed = await SubscribeService()
                          .isUserSubscribed(currentUser.uid);
                      if (!isSubscribed) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 10.h),

                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    args.imageUrl[0],
                                    width: double.maxFinite,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  "subscribe to our newsletter",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineLarge,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10.h),

                                Text(
                                  "Only useful content no ad",
                                  style: Theme.of(context).textTheme.bodyLarge,

                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 20.h),

                                ElevatedButton(
                                  onPressed: () async {
                                    final user = await UserFirestoreService()
                                        .getUserData(
                                          FirebaseAuth
                                              .instance
                                              .currentUser!
                                              .uid,
                                        );

                                    context.read<SubscribesCubit>().newReview(
                                      userId: user!.userId,
                                      email: user.email,
                                    );
                                  },
                                  child:
                                      BlocConsumer<
                                        SubscribesCubit,
                                        SubscribesState
                                      >(
                                        listener: (context, state) {
                                          if (state is SubscribesSuccess) {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          } else if (state
                                              is SubscribesFailure) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Failed to subscribe: ${state.errorMessage}',
                                                ),
                                              ),
                                            );
                                          }
                                        },

                                        builder: (context, state) {
                                          if (state is SubscribesLoading) {
                                            return CircularProgressIndicator(
                                              color: Colors.white,
                                            );
                                          } else {
                                            return Text("Subscribe");
                                          }
                                        },
                                      ),
                                ),
                                SizedBox(height: 10.h),

                                OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: Text("Maybe later"),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        Navigator.pop(context);
                      }
                      context.read<ProductCubit>().listenToProducts(
                        args.categoryId,
                      );
                    } else if (state is NewReviewFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Failed to submit review: ${state.errorMessage}',
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is NewReviewLoading) {
                      return CircularProgressIndicator(color: Colors.white);
                    } else {
                      return Text('Submit Review');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
