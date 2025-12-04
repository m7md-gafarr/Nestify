import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/bag_view_model.dart';
import 'checkout_contact_info_page.dart';
import 'delivery_details_page.dart';
import 'payment_method_page.dart';
import 'order_success_screen.dart';
import '../../../core/router/route_names.dart';

class CheckoutScreen extends StatefulWidget {
  final BagViewModel bagViewModel;

  const CheckoutScreen({
    super.key,
    required this.bagViewModel,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  final int _totalPages = 3;

  // Form data
  final _contactFormKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  String _selectedDeliveryMethod = 'courier';
  String _selectedDate = 'Tomorrow';
  String _selectedTime = '12:00 pm';
  int _selectedPaymentMethod = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      // Validate current page before moving forward
      if (_currentPage == 0) {
        // Validate contact info
        if (_contactFormKey.currentState?.validate() ?? false) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      } else {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _completeOrder() {
    // Navigate to success screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const OrderSuccessScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _previousPage,
        ),
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Checkout'),
            Text(
              '${_currentPage + 1} of $_totalPages',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Page Indicator
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: _totalPages,
              effect: WormEffect(
                dotHeight: 8.h,
                dotWidth: 8.w,
                spacing: 8.w,
                activeDotColor: Theme.of(context).colorScheme.primary,
                dotColor: Theme.of(context).dividerColor,
              ),
            ),
          ),

          // PageView Content
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              physics: const NeverScrollableScrollPhysics(), // Disable swipe, use buttons only
              children: [
                // Page 1: Contact Info
                CheckoutContactInfoPage(
                  formKey: _contactFormKey,
                  fullNameController: _fullNameController,
                  phoneController: _phoneController,
                  emailController: _emailController,
                  onNext: _nextPage,
                ),

                // Page 2: Delivery Details
                DeliveryDetailsPage(
                  selectedDeliveryMethod: _selectedDeliveryMethod,
                  selectedDate: _selectedDate,
                  selectedTime: _selectedTime,
                  onDeliveryMethodChanged: (method) {
                    setState(() {
                      _selectedDeliveryMethod = method;
                    });
                  },
                  onDateChanged: (date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                  onTimeChanged: (time) {
                    setState(() {
                      _selectedTime = time;
                    });
                  },
                  onNext: _nextPage,
                ),

                // Page 3: Payment Method
                PaymentMethodPage(
                  selectedPaymentMethod: _selectedPaymentMethod,
                  total: widget.bagViewModel.total,
                  onPaymentMethodChanged: (index) {
                    setState(() {
                      _selectedPaymentMethod = index;
                    });
                  },
                  onComplete: _completeOrder,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

