import 'package:depi_graduation_project/features/account/logic/address_book/address_book_cubit.dart';
import 'package:depi_graduation_project/features/account/models/address_book/address_book_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class LocationTileWidget extends StatelessWidget {
  const LocationTileWidget({super.key, required this.address});
  final AddressBookModel address;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Iconsax.location, size: 23.w),
      title: Text(address.city, style: Theme.of(context).textTheme.titleSmall),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          "${address.street}, ${address.city}, ${address.country}",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Iconsax.trash, color: Colors.red, size: 20.sp),
        onPressed: () {
          context.read<AddressBookCubit>().removeAddress(
            FirebaseAuth.instance.currentUser?.uid ?? '',
            address,
          );
        },
      ),
    );
  }
}
