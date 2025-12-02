import 'package:depi_graduation_project/core/images/app_images.dart';
import 'package:depi_graduation_project/features/home/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  int _selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _selectedImageIndex = index;
              });
            },
            itemCount: args.imageUrl.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Hero(
                tag: 'product_${args.id}',
                child: InteractiveViewer(
                  child: Image.network(args.imageUrl[index], fit: BoxFit.cover),
                ),
              );
            },
          ),
          Positioned(
            bottom: 140.h,
            left: 16.w,
            child: Text(
              args.name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
          Positioned(
            bottom: 90.h,
            left: 16.w,
            right: 16.w,
            child: Text(
              args.description,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
          Positioned(
            bottom: 40.h,

            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: AnimatedSmoothIndicator(
                  activeIndex: _selectedImageIndex,
                  count: args.imageUrl.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Theme.of(context).colorScheme.primary,
                    dotColor: Colors.grey,
                    dotHeight: 5.w,
                    dotWidth: MediaQuery.of(context).size.width / 9,
                    spacing: 4.w,
                  ),
                ),
              ),
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
      ),
    );
  }
}
