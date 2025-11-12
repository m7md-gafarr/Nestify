import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/core/images/app_images.dart';
import 'package:depi_graduation_project/features/home/widgets/product_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _selectedColorIndex = 0;
  int _selectedImageIndex = 0;
  static const List<String> _fallbackColors = [
    'Black',
    'White',
    'Brown',
    'Gray',
    'Beige',
    'Blue',
  ];

  static const Map<String, Color> _colorMap = {
    'Black': Colors.black,
    'White': Colors.white,
    'Brown': Colors.brown,
    'Gray': Colors.grey,
    'Beige': Color(0xFFF5F5DC),
    'Blue': Colors.blue,
    'Red': Colors.red,
    'Green': Colors.green,
    'Yellow': Colors.yellow,
  };

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final List<String> colorNames =
        (args['colors'] as List?)
            ?.map((e) => e.toString())
            .toList()
            .cast<String>() ??
        _fallbackColors;

    if (_selectedColorIndex >= colorNames.length) {
      _selectedColorIndex = 0;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 4,
                    onPageChanged: (index) {
                      setState(() {
                        _selectedImageIndex = index;
                      });
                    },
                    itemBuilder: (_, index) {
                      return Image.asset(
                        args['imageAsset'] ?? Assets.assetsImagesPic,
                        fit: BoxFit.cover,
                      );
                    },
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
                          '\$${(args['price'] + 1) * 50}',
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'This is a detailed description of the furniture item. It provides information about the design, materials used, dimensions, and other relevant details that help the customer make an informed decision.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 8.w,
                          runSpacing: 8.h,
                          children: List.generate(colorNames.length, (index) {
                            final name = colorNames[index];
                            final Color dotColor =
                                _colorMap[name] ??
                                (() {
                                  try {
                                    if (name.startsWith('#')) {
                                      final value = int.parse(
                                        name.substring(1),
                                        radix: 16,
                                      );
                                      return Color(0xFF000000 | value);
                                    }
                                  } catch (_) {}
                                  return Colors.grey;
                                })();
                            final bool selected = _selectedColorIndex == index;
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
                                      ? Theme.of(context).colorScheme.primary
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
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.add_shopping_cart),
                        label: Text("Add to Cart"),
                      ),

                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CustomSectionHeaderWidget(
                          title: "similar products",
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 15.w,
                          mainAxisSpacing: 15.w,
                        ),
                        itemBuilder: (_, index) =>
                            ProductGridItem(price: index),
                      ),
                    ],
                  ),
                ),
              ],
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
            Positioned(
              top: 30.h,
              right: 16.w,
              child: IconButton.filled(
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerHighest.withOpacity(0.8),
                ),
                onPressed: () {},
                icon: Icon(Iconsax.heart),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width - 20.h,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: AnimatedSmoothIndicator(
                    activeIndex: _selectedImageIndex,
                    count: 4,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Theme.of(context).colorScheme.primary,
                      dotColor: Colors.grey,
                      dotHeight: 7.w,
                      dotWidth: 7.w,
                      spacing: 4.w,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
