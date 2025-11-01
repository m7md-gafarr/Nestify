import 'package:depi_graduation_project/features/home/widgets/sort_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showSortBottomSheet({
  required BuildContext context,
  required int selectedSortIndex,
  required Function(int) onSortSelected,
}) {
  showModalBottomSheet(
    context: context,
    builder: (context) => SizedBox(
      height: 400.h,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("sort by", style: Theme.of(context).textTheme.headlineMedium),
            SortOptionTile(
              title: "Price: Low to High",
              onTap: () {
                onSortSelected(0);
                Navigator.pop(context);
              },
              isSelected: selectedSortIndex == 0,
            ),
            SortOptionTile(
              title: "Price: High to Low",
              onTap: () {
                onSortSelected(1);
                Navigator.pop(context);
              },
              isSelected: selectedSortIndex == 1,
            ),
            SortOptionTile(
              title: "Newest First",
              onTap: () {
                onSortSelected(2);
                Navigator.pop(context);
              },
              isSelected: selectedSortIndex == 2,
            ),
            SortOptionTile(
              title: "Popular first",
              onTap: () {
                onSortSelected(3);
                Navigator.pop(context);
              },
              isSelected: selectedSortIndex == 3,
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
          ],
        ),
      ),
    ),
  );
}
