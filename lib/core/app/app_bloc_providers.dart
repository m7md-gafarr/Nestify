import 'package:depi_graduation_project/data/services/account_service/user_firestore_service.dart';
import 'package:depi_graduation_project/data/services/home_service/best_category_service.dart';
import 'package:depi_graduation_project/data/services/supabase_storage_service.dart';
import 'package:depi_graduation_project/features/account/logic/complete_add_data/complete_add_data_cubit.dart';
import 'package:depi_graduation_project/features/account/logic/forgot_password/forgot_password_cubit.dart';
import 'package:depi_graduation_project/features/account/logic/get_user_data/get_user_data_cubit.dart';
import 'package:depi_graduation_project/features/account/logic/login/login_cubit.dart';
import 'package:depi_graduation_project/features/account/logic/register/register_cubit.dart';
import 'package:depi_graduation_project/features/account/logic/update_user_data/update_user_data_cubit.dart';
import 'package:depi_graduation_project/features/bag/logic/bag/bag_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/best_category/best_category_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/best_product/best_product_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/filter_and_sort/filter_and_sort_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/new_review/new_review_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/product/product_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/room_category/room_category_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/rooms/rooms_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/subscribes/subscribes_cubit.dart';
import 'package:depi_graduation_project/features/no_internet/logic/check_connection/check_connection_cubit.dart';
import 'package:depi_graduation_project/features/saved_items/logic/saved_items/saved_items_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static List<BlocProvider> providers = [
    BlocProvider(create: (_) => CheckConnectionCubit()),
    BlocProvider(create: (_) => FilterAndSortCubit()),
    BlocProvider(create: (context) => LoginCubit(context.read())),
    BlocProvider(create: (context) => RegisterCubit(context.read())),
    BlocProvider(create: (context) => ForgotPasswordCubit(context.read())),

    BlocProvider(
      create: (context) => CompleteAddDataCubit(
        context.read(),
        UserFirestoreService(),
      ),
    ),

    BlocProvider(
      create: (context) => UpdateUserDataCubit(
        context.read(),
        UserFirestoreService(),
        SupabaseStorageService(),
      ),
    ),

    BlocProvider(
      create: (context) => GetUserDataCubit(
        context.read(),
        UserFirestoreService(),
      ),
    ),

    BlocProvider(
      create: (_) =>
      BestCategoryCubit(service: BestCategoryService())
        ..listenToBestCategories(),
    ),

    BlocProvider(create: (_) => RoomsCubit()..listenToRooms()),
    BlocProvider(create: (_) => BestProductCubit()),
    BlocProvider(create: (_) => RoomCategoryCubit()),
    BlocProvider(create: (_) => ProductCubit()),
    BlocProvider(create: (_) => NewReviewCubit()),
    BlocProvider(create: (_) => SubscribesCubit()),

    BlocProvider(
      create: (_) => SavedItemsCubit()
        ..loadSavedItems(FirebaseAuth.instance.currentUser!.uid),
    ),

    BlocProvider(
      create: (_) => BagCubit()
        ..loadBagItems(FirebaseAuth.instance.currentUser!.uid),
    ),
  ];
}
