import 'package:depi_graduation_project/core/images/app_images.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _selectedImageIndex = index;
              });
            },
            itemCount: 4,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Image.asset(Assets.assetsImagesPic, fit: BoxFit.cover);
            },
          ),
          Text("glass storage jar with golden lid"),
          Text(
            "Hermetic storage jar. Made of glass with a raised slogan detail and a golden screw-on lid. Available in three sizes.",
          ),
          Positioned(
            top: MediaQuery.of(context).size.width - 20.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: AnimatedSmoothIndicator(
                activeIndex: _selectedImageIndex,
                count: 4,
                effect: ExpandingDotsEffect(
                  activeDotColor: Theme.of(context).colorScheme.primary,
                  dotColor: Colors.grey,
                  dotHeight: 5.w,
                  dotWidth: MediaQuery.of(context).size.width / 5,
                  spacing: 4.w,
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
