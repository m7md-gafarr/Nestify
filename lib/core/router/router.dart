import 'package:depi_graduation_project/core/constants/app_constants.dart';
import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/features/Settings/view/settings_screen.dart';
import 'package:depi_graduation_project/features/account/view/address_book_screen.dart';
import 'package:depi_graduation_project/features/account/view/complete_add_data_screen.dart';
import 'package:depi_graduation_project/features/account/view/forgot_password_screen.dart';
import 'package:depi_graduation_project/features/account/view/login_screen.dart';
import 'package:depi_graduation_project/features/account/view/my_details_screen.dart';
import 'package:depi_graduation_project/features/account/view/my_orders_screen.dart';
import 'package:depi_graduation_project/features/account/view/register_screen.dart';
import 'package:depi_graduation_project/features/home/view/user/main_screen.dart';
import 'package:depi_graduation_project/features/home/view/user/story_screen.dart';
import 'package:depi_graduation_project/features/introducation/view/introducation_screen.dart';
import 'package:depi_graduation_project/features/home/view/user/categories_screen.dart';
import 'package:depi_graduation_project/features/home/view/user/catalog_screen.dart';
import 'package:depi_graduation_project/features/home/view/user/product_screen.dart';
import 'package:depi_graduation_project/features/home/view/user/new_reviews_screen.dart';
import 'package:depi_graduation_project/features/home/view/user/ad_popover_screen.dart';
import 'package:depi_graduation_project/features/bag/view/bag_screen.dart';
import 'package:depi_graduation_project/features/saved_items/view/saved_items_screen.dart';
import 'package:depi_graduation_project/features/account/view/account_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.introducationPageRoute:
        return MaterialPageRoute(builder: (context) => IntroducationScreen());
      case AppRouteNames.homePageRoute:
        return MaterialPageRoute(builder: (context) => MainScreen());

      // Home Screen Routes
      case AppRouteNames.mainScreenRoute:
        return MaterialPageRoute(builder: (context) => MainScreen());
      case AppRouteNames.categoriesScreenRoute:
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
          settings: settings,
        );
      case AppRouteNames.catalogScreenRoute:
        return PageRouteBuilder(
          settings: settings,
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
        return MaterialPageRoute(
          builder: (context) => ProductScreen(),
          settings: settings,
        );

      case AppRouteNames.newReviewsScreenRoute:
        return MaterialPageRoute(
          builder: (context) => NewReviewsScreen(),
          settings: settings,
        );
      case AppRouteNames.adPopoverScreenRoute:
        return MaterialPageRoute(builder: (context) => AdPopoverScreen());
      case AppRouteNames.storyScreenRoute:
        return MaterialPageRoute(
          builder: (context) => StoryScreen(),
          settings: settings,
        );

      // Bag/Cart Screen Route
      case AppRouteNames.bagScreenRoute:
        return MaterialPageRoute(builder: (context) => BagScreen());

      // Saved Items Screen Route
      case AppRouteNames.savedItemsScreenRoute:
        return MaterialPageRoute(builder: (context) => SavedItemsScreen());

      // Account Screen Route
      case AppRouteNames.accountScreenRoute:
        return MaterialPageRoute(builder: (context) => AccountScreen());

      case AppRouteNames.loginScreenRoute:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case AppRouteNames.registerScreenRoute:
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      case AppRouteNames.forgotPasswordScreenRoute:
        return MaterialPageRoute(builder: (context) => ForgotPasswordScreen());

      case AppRouteNames.completeAddDataScreenRoute:
        return MaterialPageRoute(
          builder: (context) => CompleteAddDataScreen(),
          settings: settings,
        );

      case AppRouteNames.myDetailsScreenRoute:
        return MaterialPageRoute(
          builder: (context) => MyDetailsScreen(),
          settings: settings,
        );

      case AppRouteNames.myOrdersScreenRoute:
        return MaterialPageRoute(
          builder: (context) => MyOrdersScreen(),
          settings: settings,
        );
      case AppRouteNames.orderDetailsScreenRoute:
        return MaterialPageRoute(
          builder: (context) => MyOrdersScreen(),
          settings: settings,
        );

      case AppRouteNames.addressBookScreenRoute:
        return MaterialPageRoute(
          builder: (context) => AddressBookScreen(),
          settings: settings,
        );

      // Settings Screen Route
      case AppRouteNames.settingsScreenRoute:
        return MaterialPageRoute(builder: (context) => SettingsScreen());

      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text("The Route Not Found"))),
        );
    }
  }
}
