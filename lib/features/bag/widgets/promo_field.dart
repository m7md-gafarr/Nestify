import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoField extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  const PromoField({super.key, required this.value, required this.onChanged, required this.onClear});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: value),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'nestify',
        suffixIcon: Container(
          margin: EdgeInsets.all(6.w),
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor.withOpacity(.2),
            shape: BoxShape.circle,
          ),
          child: IconButton(onPressed: onClear, icon: const Icon(Icons.close, size: 16)),
        ),
      ),
    );
  }
}


