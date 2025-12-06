import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:depi_graduation_project/core/router/route_names.dart';
import '../logic/bag/bag_cubit.dart';
import 'bag_empty_view.dart';
import 'bag_filled_view.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagCubit, BagState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: _BagScreenContent(state: state),
        );
      },
    );
  }
}

class _BagScreenContent extends StatelessWidget {
  final BagState state;

  const _BagScreenContent({required this.state});

  void _onCheckout(BuildContext context) {
    Navigator.of(context).pushNamed(AppRouteNames.checkoutScreenRoute);
  }

  void _onStartShopping(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRouteNames.homePageRoute);
  }

  @override
  Widget build(BuildContext context) {
    if (state is BagLoaded) {
      final bagState = state as BagLoaded;
      if (bagState.items.isEmpty) {
        return BagEmptyView(onStartShopping: () => _onStartShopping(context));
      }
      return BagFilledView(onCheckout: () => _onCheckout(context));
    }

    // Loading or error state
    if (state is BagError) {
      return Center(
        child: Text((state as BagError).message),
      );
    }

    return const Center(child: CircularProgressIndicator());
  }
}
