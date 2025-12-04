import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/features/bag/widgets/method_option.dart';
import 'package:depi_graduation_project/features/bag/widgets/delivery_address_card.dart';
import 'package:depi_graduation_project/features/bag/widgets/date_time_button.dart';

class DeliveryDetailsPage extends StatelessWidget {
  final String selectedDeliveryMethod;
  final String selectedDate;
  final String selectedTime;
  final ValueChanged<String> onDeliveryMethodChanged;
  final ValueChanged<String> onDateChanged;
  final ValueChanged<String> onTimeChanged;
  final VoidCallback onNext;

  const DeliveryDetailsPage({
    super.key,
    required this.selectedDeliveryMethod,
    required this.selectedDate,
    required this.selectedTime,
    required this.onDeliveryMethodChanged,
    required this.onDateChanged,
    required this.onTimeChanged,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> dates = ['Tomorrow', 'Jun 25', 'Jun 26', 'Jun 27'];
    final List<String> timeSlots = ['12:00 pm', '2:00 pm', '4:00 pm', '6:00 pm'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),
                    const CustomSectionHeaderWidget(title: 'delivery method'),
                    SizedBox(height: 8.h),
                    MethodOption(
                      icon: Icon(Icons.directions_car, size: 28.sp),
                      title: 'By courier',
                      subtitle: 'Tomorrow, any time',
                      isSelected: selectedDeliveryMethod == 'courier',
                      onTap: () => onDeliveryMethodChanged('courier'),
                    ),
                    MethodOption(
                      icon: Icon(Icons.shopping_cart_outlined, size: 28.sp),
                      title: 'I\'ll take it myself',
                      subtitle: 'Any day from tomorrow',
                      isSelected: selectedDeliveryMethod == 'pickup',
                      onTap: () => onDeliveryMethodChanged('pickup'),
                    ),
                    SizedBox(height: 16.h),
                    const CustomSectionHeaderWidget(title: 'delivery address'),
                    SizedBox(height: 8.h),
                    DeliveryAddressCard(
                      address: 'London, 221B Baker Street',
                      contactInfo: 'Hanna Gouse, +7 932 123-43-23',
                      onTap: () {},
                    ),
                    SizedBox(height: 16.h),
                    const CustomSectionHeaderWidget(title: 'delivery time'),
                    SizedBox(height: 16.h),
                    SizedBox(
                      height: 40.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: dates.length,
                        separatorBuilder: (context, index) => SizedBox(width: 12.w),
                        itemBuilder: (context, index) {
                          final date = dates[index];
                          final isSelected = selectedDate == date;
                          return DateTimeButton(
                            text: date,
                            isSelected: isSelected,
                            onTap: () => onDateChanged(date),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      height: 40.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: timeSlots.length,
                        separatorBuilder: (context, index) => SizedBox(width: 12.w),
                        itemBuilder: (context, index) {
                          final time = timeSlots[index];
                          final isSelected = selectedTime == time;
                          return DateTimeButton(
                            text: time,
                            isSelected: isSelected,
                            onTap: () => onTimeChanged(time),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24.h),
                    ElevatedButton(
                      onPressed: onNext,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50.h),
                      ),
                      child: const Text('Continue'),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

