import 'package:depi_graduation_project/features/bag/models/bag_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_button.dart';

class BagItemTile extends StatelessWidget {
  final BagItem item;
  final VoidCallback onRemove;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const BagItemTile({super.key, required this.item, required this.onRemove, required this.onIncrement, required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(item.imagePath, width: 96.w, height: 96.w, fit: BoxFit.cover),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
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
                        onPressed: onRemove,
                        icon: const Icon(Icons.close, size: 16),
                      ),
                    ),
                  ],
                ),
                Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    CustomButton(icon: Icons.remove, onTap: onDecrement),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text('${item.quantity}', style: Theme.of(context).textTheme.bodyMedium),
                    ),
                    CustomButton(icon: Icons.add, onTap: onIncrement),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


