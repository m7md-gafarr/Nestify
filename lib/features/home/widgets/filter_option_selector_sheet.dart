import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showFilterOptionSelectorSheet({
  required BuildContext context,
  required String title,
  required List<String> options,
  required String selectedOption,
  required Function(String) onOptionSelected,
}) {
  showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: 20.h),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (context, index) {
                final option = options[index];
                final isSelected = option == selectedOption;

                return ListTile(
                  title: Text(option),
                  trailing: isSelected
                      ? Icon(
                          Icons.check_circle,
                          color: Theme.of(context).primaryColor,
                        )
                      : Container(
                          width: 22.sp,
                          height: 22.sp,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).dividerColor.withOpacity(.5),
                            borderRadius: BorderRadius.all(
                              Radius.circular(11.sp),
                            ),
                          ),
                        ),
                  onTap: () {
                    onOptionSelected(option);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
