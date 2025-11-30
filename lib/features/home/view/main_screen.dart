import 'package:depi_graduation_project/components/custom_bottom_nav_bar_widget.dart';
import 'package:depi_graduation_project/features/no_internet/logic/check_connection/check_connection_cubit.dart';
import 'package:depi_graduation_project/features/bag/view/bag_screen.dart';
import 'package:depi_graduation_project/features/home/logic/best_category/best_category_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/rooms/rooms_cubit.dart';
import 'package:depi_graduation_project/features/home/widgets/categories/category_card_widget.dart';
import 'package:depi_graduation_project/features/home/widgets/rooms/room_category_card_widget.dart';
import 'package:depi_graduation_project/features/no_internet/view/no_internet_screen.dart';
import 'package:depi_graduation_project/features/saved_items/view/saved_items_screen.dart';
import 'package:depi_graduation_project/features/account/view/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:animations/animations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const BagScreen(),
    const SavedItemsScreen(),
    const AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
    context.read<BestCategoryCubit>().listenToBestCategories();
    context.read<RoomsCubit>().listenToRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CheckConnectionCubit, CheckConnectionState>(
        builder: (context, state) {
          if (state is CheckConnectionHasInternet) {
            return PageTransitionSwitcher(
              transitionBuilder:
                  (
                    Widget child,
                    Animation<double> primaryAnimation,
                    Animation<double> secondaryAnimation,
                  ) {
                    return FadeThroughTransition(
                      animation: primaryAnimation,
                      secondaryAnimation: secondaryAnimation,
                      child: child,
                    );
                  },
              child: IndexedStack(index: _currentIndex, children: _screens),
            );
          } else {
            return const NoInternetScreen();
          }
        },
      ),
      bottomNavigationBar: CustomBottomNavBarWidget(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 80.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "Nestify",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Iconsax.search_normal, size: 26.sp),
              ),
            ),
          ),
          SizedBox(height: 15.h),

          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: BlocBuilder<BestCategoryCubit, BestCategoryState>(
              builder: (context, state) {
                if (state is BestCategoryLoading) {
                  return SizedBox(
                    height: 150,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (state is BestCategoryError) {
                  return SizedBox(
                    height: 150,
                    child: Center(child: Text("Error loading categories")),
                  );
                }

                if (state is BestCategorySuccess) {
                  final list = state.list;

                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        list.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: CategoryCardWidget(
                            text: list[index].title,
                            imagePath: list[index].imageUrl,
                            list: list,
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return SizedBox();
              },
            ),
          ),

          SizedBox(height: 15.h),
          BlocBuilder<RoomsCubit, RoomsState>(
            builder: (context, state) {
              if (state is RoomsLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is RoomsError) {
                return Center(child: Text(state.message));
              }

              if (state is RoomsSuccess) {
                final rooms = state.list;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(rooms.length, (index) {
                    final room = rooms[index];

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 5.h,
                      ),
                      child: RoomCategoryCardWidget(
                        title: room.name,
                        imagePath: room.imageUrl,
                        categoryId: room.id,
                      ),
                    );
                  }),
                );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
