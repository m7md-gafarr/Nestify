import 'package:depi_graduation_project/core/constants/app_constants.dart';
import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/features/introducation/view/introducation_screen.dart';
import 'package:depi_graduation_project/features/home/view/main_screen.dart';
import 'package:depi_graduation_project/features/home/view/categories_screen.dart';
import 'package:depi_graduation_project/features/home/view/catalog_screen.dart';
import 'package:depi_graduation_project/features/home/view/product_screen.dart';
import 'package:depi_graduation_project/features/home/view/reviews_screen.dart';
import 'package:depi_graduation_project/features/home/view/new_reviews_screen.dart';
import 'package:depi_graduation_project/features/home/view/ad_popover_screen.dart';
import 'package:depi_graduation_project/features/bag/view/bag_screen.dart';
import 'package:depi_graduation_project/features/saved%20items/view/saved_items_screen.dart';
import 'package:depi_graduation_project/features/account/view/account_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.introducationPageRoute:
        return MaterialPageRoute(builder: (context) => IntroducationScreen());
      case AppRouteNames.homePageRoute:
        return MaterialPageRoute(builder: (context) => MainScreen());

      case AppRouteNames.mainScreenRoute:
        return MaterialPageRoute(builder: (context) => MainScreen());
      case AppRouteNames.categoriesScreenRoute:
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      case AppRouteNames.catalogScreenRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const CatalogScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final begin = isRTL(context)
                ? const Offset(-1.0, 0.0)
                : const Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            final tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: curve));
            final offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 400),
        );

      case AppRouteNames.productScreenRoute:
        return MaterialPageRoute(builder: (context) => ProductScreen());
      case AppRouteNames.reviewsScreenRoute:
        return MaterialPageRoute(builder: (context) => ReviewsScreen());
      case AppRouteNames.newReviewsScreenRoute:
        return MaterialPageRoute(builder: (context) => NewReviewsScreen());
      case AppRouteNames.adPopoverScreenRoute:
        return MaterialPageRoute(builder: (context) => AdPopoverScreen());

      // Bag/Cart Screen Route
      case AppRouteNames.bagScreenRoute:
        return MaterialPageRoute(builder: (context) => BagScreen());

      // Saved Items Screen Route
      case AppRouteNames.savedItemsScreenRoute:
        return MaterialPageRoute(builder: (context) => SavedItemsScreen());

      // Account Screen Route
      case AppRouteNames.accountScreenRoute:
        return MaterialPageRoute(builder: (context) => AccountScreen());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text("The Route Not Found"))),
        );
    }
  }
}
