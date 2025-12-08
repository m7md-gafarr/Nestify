import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/features/account/logic/address_book/address_book_cubit.dart';
import 'package:depi_graduation_project/features/account/widgets/address_book/shimmer/location_tile_widget_shimmer.dart';
import 'package:depi_graduation_project/features/account/widgets/address_book/location_tile_widget.dart';
import 'package:depi_graduation_project/features/account/widgets/address_book/empty_address_book_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressBookScreen extends StatelessWidget {
  const AddressBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Address Book"),
      body: BlocBuilder<AddressBookCubit, AddressBookState>(
        builder: (context, state) {
          if (state is AddressBookLoading) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, __) => const LocationTileWidgetShimmer(),
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemCount: 3,
              ),
            );
          } else if (state is AddressBookLoaded) {
            if (state.addressBooks.isEmpty) {
              return EmptyAddressBookWidget(
                onAddPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRouteNames.addNewAddressBookScreenRoute,
                  );
                },
              );
            } else {
              return Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.addressBooks.length,
                    itemBuilder: (context, index) {
                      final addressBook = state.addressBooks[index];
                      return LocationTileWidget(address: addressBook);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0.w),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRouteNames.addNewAddressBookScreenRoute,
                        );
                      },
                      child: const Text("Add New Address"),
                    ),
                  ),
                ],
              );
            }
          } else {
            return const Center(child: Text('No addresses found.'));
          }
        },
      ),
    );
  }
}
