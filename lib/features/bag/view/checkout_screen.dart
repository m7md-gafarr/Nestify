import 'package:depi_graduation_project/core/constants/app_constants.dart';
import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/core/utils/date_utils.dart';
import 'package:depi_graduation_project/features/bag/logic/checkout/checkout_cubit.dart';
import 'package:depi_graduation_project/features/bag/models/bag/bag_model.dart';
import 'package:depi_graduation_project/features/bag/models/order/contact_info_model.dart';
import 'package:depi_graduation_project/features/bag/models/order/delivery_details_model.dart';
import 'package:depi_graduation_project/features/bag/models/order/order_model.dart';
import 'package:depi_graduation_project/features/bag/models/order/payment_details_model.dart';
import 'package:depi_graduation_project/features/bag/models/order/product_items_model.dart';
import 'package:depi_graduation_project/features/bag/widgets/checkout/payment_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uuid/uuid.dart';
import '../widgets/checkout/contact_info_widget.dart';
import '../widgets/checkout/delivery_details_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  final int _totalPages = 3;
  final orderId = const Uuid().v4();

  final _contactFormKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  String _selectedDeliveryMethod = 'courier';
  late String _selectedDate;
  late String _selectedTime;

  @override
  void initState() {
    super.initState();
    final dates = AppDateHelper().generateDeliveryDates(5);
    final times = AppDateHelper().generateTimeSlots();

    _selectedDate = dates.first;
    _selectedTime = times.first;
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
      if (_currentPage == 0) {
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

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as List<dynamic>? ??
        [0, <String>[]];
    final total = args[0] as double;
    final bagModel = args[1] as BagModel;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Checkout', style: Theme.of(context).textTheme.titleMedium),
            Text(
              'Step ${_currentPage + 1} of $_totalPages',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),

        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: isRTL(context)
              ? const Icon(Iconsax.arrow_right_2)
              : Icon(Iconsax.arrow_left, size: 27.sp),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // Page 1: Contact Info
                CheckoutContactInfoWidget(
                  formKey: _contactFormKey,
                  fullNameController: _fullNameController,
                  phoneController: _phoneController,
                  emailController: _emailController,
                  onNext: _nextPage,
                ),

                // Page 2: Delivery Details
                DeliveryDetailsWidget(
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
                PaymentMethodWidget(
                  listener: (context, state) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRouteNames.orderConfirmationScreenRoute,
                      (route) => false,
                      arguments: orderId,
                    );
                  },
                  total: total,
                  onPay: () {
                    context.read<CheckoutCubit>().processCheckout(
                      OrderModel(
                        id: orderId,
                        productItems: bagModel.items
                            .map(
                              (item) => ProductItemsModel(
                                id: item.productId,
                                quantity: item.quantity,
                              ),
                            )
                            .toList(),
                        contactInfo: ContactInfo(
                          fullName: _fullNameController.text,
                          phone: _phoneController.text,
                          email: _emailController.text,
                        ),
                        deliveryDetails: DeliveryDetails(
                          method: _selectedDeliveryMethod,
                          date: _selectedDate,
                          time: _selectedTime,
                          address: "123 Main St, City, Country",
                        ),
                        paymentDetails: PaymentDetails(
                          method: 'Credit Card',
                          amount: total,
                        ),
                        total: total,
                        createdAt: DateTime.now(),
                      ),
                      orderId,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
