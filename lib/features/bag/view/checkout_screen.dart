// import 'package:depi_graduation_project/core/constants/app_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:iconsax/iconsax.dart';
// import '../widgets/checkout/contact_info_widget.dart';
// import '../widgets/checkout/delivery_details_widget.dart';
// import '../widgets/checkout/payment_method_widget.dart';
// import 'order_success_screen.dart';

// class CheckoutScreen extends StatefulWidget {
//   const CheckoutScreen({super.key});

//   @override
//   State<CheckoutScreen> createState() => _CheckoutScreenState();
// }

// class _CheckoutScreenState extends State<CheckoutScreen> {
//   late PageController _pageController;
//   int _currentPage = 0;
//   final int _totalPages = 3;

//   // Form data
//   final _contactFormKey = GlobalKey<FormState>();
//   final _fullNameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _emailController = TextEditingController();

//   String _selectedDeliveryMethod = 'courier';
//   String _selectedDate = 'Tomorrow';
//   String _selectedTime = '12:00 pm';
//   int _selectedPaymentMethod = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     _fullNameController.dispose();
//     _phoneController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }

//   void _nextPage() {
//     if (_currentPage < _totalPages - 1) {
//       // Validate current page before moving forward
//       if (_currentPage == 0) {
//         // Validate contact info
//         // if (_contactFormKey.currentState?.validate() ?? false) {
//         //   _pageController.nextPage(
//         //     duration: const Duration(milliseconds: 300),
//         //     curve: Curves.easeInOut,
//         //   );
//         // }
//         _pageController.nextPage(
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//       } else {
//         _pageController.nextPage(
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//       }
//     }
//   }

//   void _onPageChanged(int page) {
//     setState(() {
//       _currentPage = page;
//     });
//   }

//   void _completeOrder() {
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(builder: (context) => const OrderSuccessScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Column(
//           children: [
//             Text('Checkout', style: Theme.of(context).textTheme.titleMedium),
//             Text(
//               'Step ${_currentPage + 1} of $_totalPages',
//               style: Theme.of(context).textTheme.bodySmall,
//             ),
//           ],
//         ),

//         centerTitle: true,
//         elevation: 0,
//         leading: IconButton(
//           icon: isRTL(context)
//               ? const Icon(Iconsax.arrow_right_2)
//               : Icon(Iconsax.arrow_left, size: 27.sp),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView(
//               controller: _pageController,
//               onPageChanged: _onPageChanged,
//               physics: const NeverScrollableScrollPhysics(),
//               children: [
//                 // Page 1: Contact Info
//                 CheckoutContactInfoWidget(
//                   formKey: _contactFormKey,
//                   fullNameController: _fullNameController,
//                   phoneController: _phoneController,
//                   emailController: _emailController,
//                   onNext: _nextPage,
//                 ),

//                 // Page 2: Delivery Details
//                 DeliveryDetailsWidget(
//                   selectedDeliveryMethod: _selectedDeliveryMethod,
//                   selectedDate: _selectedDate,
//                   selectedTime: _selectedTime,
//                   onDeliveryMethodChanged: (method) {
//                     setState(() {
//                       _selectedDeliveryMethod = method;
//                     });
//                   },
//                   onDateChanged: (date) {
//                     setState(() {
//                       _selectedDate = date;
//                     });
//                   },
//                   onTimeChanged: (time) {
//                     setState(() {
//                       _selectedTime = time;
//                     });
//                   },
//                   onNext: _nextPage,
//                 ),

//                 // Page 3: Payment Method
//                 PaymentMethodWidget(
//                   selectedPaymentMethod: _selectedPaymentMethod,
//                   total: widget.bagViewModel.total,
//                   onPaymentMethodChanged: (index) {
//                     setState(() {
//                       _selectedPaymentMethod = index;
//                     });
//                   },
//                   onComplete: _completeOrder,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
