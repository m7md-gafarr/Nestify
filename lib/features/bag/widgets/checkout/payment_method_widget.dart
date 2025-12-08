import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/features/bag/logic/checkout/checkout_cubit.dart';
import 'package:depi_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../method_option.dart';

class PaymentMethodWidget extends StatelessWidget {
  final double total;
  final VoidCallback onPay;
  final void Function(BuildContext, CheckoutState) listener;

  const PaymentMethodWidget({
    super.key,
    required this.total,
    required this.onPay,
    required this.listener,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          CustomSectionHeaderWidget(title: S.of(context).checkoutPaymentMethod),

          SizedBox(height: 20.h),

          MethodOption(
            icon: Icon(Iconsax.card, size: 32.sp),
            title: "Mastercard 9833",
            subtitle: "734, Exp: 12/29",
            isSelected: true,
            onTap: () {},
          ),

          SizedBox(height: 12.h),

          MethodOption(
            icon: Icon(Iconsax.card, size: 32.sp),
            title: "Visa 7233",
            subtitle: "321, Exp: 11/29",
            isSelected: false,
            onTap: () {},
          ),

          SizedBox(height: 12.h),

          MethodOption(
            icon: Icon(Iconsax.card, size: 32.sp),
            title: "Apple Pay",
            subtitle: "",
            isSelected: false,
            onTap: () {},
          ),

          const Spacer(),

          ElevatedButton(
            onPressed: onPay,

            child: BlocConsumer<CheckoutCubit, CheckoutState>(
              listener: listener,

              builder: (context, state) {
                if (state is CheckoutLoading) {
                  return CircularProgressIndicator(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  );
                }
                return Text(
                  '${S.of(context).checkoutPay} \$${total.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18.sp),
                );
              },
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
