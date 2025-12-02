import 'package:depi_graduation_project/features/home/logic/filter_and_sort/filter_and_sort_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/filter_and_sort/filter_and_sort_state.dart';
import 'package:depi_graduation_project/features/home/widgets/sorting/sort_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showSortBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    context: context,
    builder: (context) => BlocBuilder<FilterAndSortCubit, FilterAndSortState>(
      builder: (context, state) {
        final cubit = context.read<FilterAndSortCubit>();
        return SizedBox(
          height: 320.h,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "sort by",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SortOptionTile(
                  title: "Price: Low to High",
                  onTap: () {
                    cubit.changeSortOption(0);
                    Navigator.pop(context);
                  },
                  isSelected: state.sortOption == 0,
                ),
                SortOptionTile(
                  title: "Price: High to Low",
                  onTap: () {
                    cubit.changeSortOption(1);
                    Navigator.pop(context);
                  },
                  isSelected: state.sortOption == 1,
                ),
                SortOptionTile(
                  title: "Newest First",
                  onTap: () {
                    cubit.changeSortOption(2);
                    Navigator.pop(context);
                  },
                  isSelected: state.sortOption == 2,
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
        );
      },
    ),
  );
}
