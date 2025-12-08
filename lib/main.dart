import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/core/router/router.dart';
import 'package:depi_graduation_project/core/theme/app_theme/app_theme_dark.dart';
import 'package:depi_graduation_project/core/theme/app_theme/app_theme_light.dart';
import 'package:depi_graduation_project/core/utils/language/language_cubit.dart';
import 'package:depi_graduation_project/core/utils/language/language_state.dart';
import 'package:depi_graduation_project/core/utils/theme/theme_cubit.dart';
import 'package:depi_graduation_project/core/utils/theme/theme_state.dart';
import 'package:depi_graduation_project/data/services/home_service/best_category_service.dart';
import 'package:depi_graduation_project/features/account/logic/address_book/address_book_cubit.dart';
import 'package:depi_graduation_project/features/account/logic/forgot_password/forgot_password_cubit.dart';
import 'package:depi_graduation_project/features/bag/logic/bag/bag_cubit.dart';
import 'package:depi_graduation_project/features/bag/logic/checkout/checkout_cubit.dart';
import 'package:depi_graduation_project/features/bag/logic/promo_code/promo_code_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/best_product/best_product_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/new_review/new_review_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/subscribes/subscribes_cubit.dart';
import 'package:depi_graduation_project/features/home/view/user/main_screen.dart';
import 'package:depi_graduation_project/features/no_internet/logic/check_connection/check_connection_cubit.dart';
import 'package:depi_graduation_project/data/data_sources/local/shared_pref.dart';
import 'package:depi_graduation_project/data/services/supabase_storage_service.dart';
import 'package:depi_graduation_project/data/services/account_service/user_firestore_service.dart';
import 'package:depi_graduation_project/features/account/logic/complete_add_data/complete_add_data_cubit.dart';
import 'package:depi_graduation_project/features/account/logic/get_user_data/get_user_data_cubit.dart';
import 'package:depi_graduation_project/features/account/logic/login/login_cubit.dart';
import 'package:depi_graduation_project/features/account/logic/register/register_cubit.dart';
import 'package:depi_graduation_project/features/account/logic/update_user_data/update_user_data_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/best_category/best_category_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/filter_and_sort/filter_and_sort_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/product/product_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/room_category/room_category_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/rooms/rooms_cubit.dart';
import 'package:depi_graduation_project/features/saved_items/logic/saved_items/saved_items_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

String? _initialRoute;
final GlobalKey<MainScreenState> mainScreenKey = GlobalKey<MainScreenState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://tmlanamjmwvkaneawpte.supabase.co',
    anonKey: 'sb_publishable_1eBzOrW0fSoFFWu5B8CJ-w_WMh9abOi',
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();

  SharedPreferencesService pref = SharedPreferencesService();
  await pref.init();
  bool seen = await pref.loadOnboardingStatus() ?? false;
  _initialRoute = seen
      ? AppRouteNames.homePageRoute
      : AppRouteNames.introducationPageRoute;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CheckConnectionCubit()),
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LanguageCubit()),
        BlocProvider(create: (_) => FilterAndSortCubit()),
        BlocProvider(
          create: (context) => LoginCubit(context.read<CheckConnectionCubit>()),
        ),
        BlocProvider(
          create: (context) =>
              RegisterCubit(context.read<CheckConnectionCubit>()),
        ),
        BlocProvider(
          create: (context) =>
              ForgotPasswordCubit(context.read<CheckConnectionCubit>()),
        ),

        BlocProvider(
          create: (context) => CompleteAddDataCubit(
            context.read<CheckConnectionCubit>(),
            UserFirestoreService(),
          ),
        ),
        BlocProvider(
          create: (context) => UpdateUserDataCubit(
            context.read<CheckConnectionCubit>(),
            UserFirestoreService(),
            SupabaseStorageService(),
          ),
        ),
        BlocProvider(
          create: (context) => GetUserDataCubit(
            context.read<CheckConnectionCubit>(),
            UserFirestoreService(),
          )..checkUserLoginStatus(),
        ),
        BlocProvider(
          create: (_) =>
              BestCategoryCubit(service: BestCategoryService())
                ..listenToBestCategories(),
        ),
        BlocProvider(create: (context) => RoomsCubit()..listenToRooms()),
        BlocProvider(create: (context) => BestProductCubit()),
        BlocProvider(create: (context) => RoomCategoryCubit()),
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(create: (context) => NewReviewCubit()),
        BlocProvider(create: (context) => SubscribesCubit()),
        BlocProvider(
          create: (context) =>
              SavedItemsCubit()
                ..loadSavedItems(FirebaseAuth.instance.currentUser!.uid),
        ),
        BlocProvider(
          create: (context) =>
              BagCubit()..loadBagItems(FirebaseAuth.instance.currentUser!.uid),
        ),
        BlocProvider(create: (context) => PromoCodeCubit()),
        BlocProvider(create: (context) => CheckoutCubit()),
        BlocProvider(
          create: (context) =>
              AddressBookCubit()
                ..loadAddressBooks(FirebaseAuth.instance.currentUser!.uid),
        ),
      ],

      child: MyApp(appRouter: AppRouter()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) {
        return BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, langState) {
            return BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, themeState) {
                return MaterialApp(
                  locale: langState.locale,

                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],

                  supportedLocales: S.delegate.supportedLocales,
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: appRouter.generateRoute,
                  initialRoute: _initialRoute,
                  themeMode: themeState.themeMode,
                  theme: getThemeColorLight(context, langState.locale),
                  darkTheme: getThemeColorDark(context, langState.locale),
                );
              },
            );
          },
        );
      },
    );
  }
}
