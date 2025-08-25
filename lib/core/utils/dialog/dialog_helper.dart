import 'package:depi_graduation_project/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DialogHelper {
  BuildContext context;
  DialogHelper(this.context);

  showSuccessDialog({
    required String message,
    required String title,
    required List<Widget>? actions,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        icon: SvgPicture.asset(Assets.imagesDialogDialogSuccess),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        content: Text(message, textAlign: TextAlign.center),
        actions: actions,
      ),
    );
  }

  showErroeDialog({required String message}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        icon: SvgPicture.asset(Assets.imagesDialogDialogFaliure),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "cancel",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
