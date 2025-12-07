import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../method_option.dart';

class PaymentMethodWidget extends StatelessWidget {
  final int selectedPaymentMethod;
  final double total;
  final ValueChanged<int> onPaymentMethodChanged;
  final VoidCallback onComplete;

  const PaymentMethodWidget({
    super.key,
    required this.selectedPaymentMethod,
    required this.total,
    required this.onPaymentMethodChanged,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Text(
            "payment method",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 25.h),

          MethodOption(
            icon: const Icon(Icons.credit_card_outlined, size: 32),
            title: "Mastercard 9833",
            subtitle: "734, Exp: 12/29",
            isSelected: selectedPaymentMethod == 0,
            onTap: () => onPaymentMethodChanged(0),
          ),

          SizedBox(height: 12.h),

          MethodOption(
            icon: const Icon(Icons.credit_card_outlined, size: 32),
            title: "Visa 7233",
            subtitle: "321, Exp: 11/29",
            isSelected: selectedPaymentMethod == 1,
            onTap: () => onPaymentMethodChanged(1),
          ),

          SizedBox(height: 12.h),

          MethodOption(
            icon: const Icon(Icons.apple, size: 32),
            title: "Apple Pay",
            subtitle: "",
            isSelected: selectedPaymentMethod == 2,
            onTap: () => onPaymentMethodChanged(2),
          ),

          const Spacer(),

          ElevatedButton(
            onPressed: onComplete,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50.h),
            ),
            child: Text("Pay \$${total.toStringAsFixed(2)}"),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
