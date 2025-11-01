import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:depi_graduation_project/core/router/route_names.dart';
import '../models/bag_view_model.dart';
import 'bag_empty_view.dart';
import 'bag_filled_view.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BagViewModel(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: const _BagScreenContent(),
      ),
    );
  }
}

class _BagScreenContent extends StatelessWidget {
  const _BagScreenContent();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BagViewModel>();

    if (vm.isEmpty) {
      return BagEmptyView(onStartShopping: () => _onStartShopping(context));
    }

    return BagFilledView(viewModel: vm, onCheckout: () => _onCheckout(context));
  }

  void _onCheckout(BuildContext context) {}

  void _onStartShopping(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRouteNames.homePageRoute);
  }
}
