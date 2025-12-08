import 'package:depi_graduation_project/components/custom_bottom_nav_bar_widget.dart';
import 'package:depi_graduation_project/features/home/widgets/categories/shimmer/category_card_widget_shimmer.dart';
import 'package:depi_graduation_project/features/home/widgets/filters/no_results_widget.dart';
import 'package:depi_graduation_project/features/home/widgets/rooms/room_category_card_widget.dart';
import 'package:depi_graduation_project/features/home/widgets/rooms/shimmer/room_category_card_widget_shimmer.dart';
import 'package:depi_graduation_project/features/no_internet/logic/check_connection/check_connection_cubit.dart';
import 'package:depi_graduation_project/features/bag/view/bag_screen.dart';
import 'package:depi_graduation_project/features/home/logic/best_category/best_category_cubit.dart';
import 'package:depi_graduation_project/features/home/logic/rooms/rooms_cubit.dart';
import 'package:depi_graduation_project/features/home/widgets/categories/category_card_widget.dart';
import 'package:depi_graduation_project/features/no_internet/view/no_internet_screen.dart';
import 'package:depi_graduation_project/features/saved_items/view/saved_items_screen.dart';
import 'package:depi_graduation_project/features/account/view/user/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:animations/animations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  void jumpToHome() {
    setState(() {
      _currentIndex = 0;
    });
  }

  final List<Widget> _screens = [
    HomeContent(),
    BagScreen(),
    const SavedItemsScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: BlocBuilder<CheckConnectionCubit, CheckConnectionState>(
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
                child: SafeArea(
                  top: false,
                  child: IndexedStack(index: _currentIndex, children: _screens),
                ),
              );
            } else {
              return const NoInternetScreen();
            }
          },
        ),
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

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<BestCategoryCubit>().listenToBestCategories();
        context.read<RoomsCubit>().listenToRooms();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
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
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase().trim();
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search for rooms",
                  prefixIcon: Icon(Iconsax.search_normal, size: 26.sp),
                ),
              ),
            ),
            SizedBox(height: 15.h),

            BlocConsumer<BestCategoryCubit, BestCategoryState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is BestCategorySuccess) {
                  final list = state.list;
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        list.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                            right: 10.w,
                            left: index == 0 ? 15 : 0,
                          ),
                          child: CategoryCardWidget(model: list[index]),
                        ),
                      ),
                    ),
                  );
                } else {
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: CategoryCardWidgetShimmer(),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),

            BlocBuilder<RoomsCubit, RoomsState>(
              builder: (context, state) {
                if (state is RoomsSuccess) {
                  final rooms = state.list;

                  final filtered = rooms.where((room) {
                    return room.name.toLowerCase().contains(searchQuery);
                  }).toList();

                  if (filtered.isEmpty) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: NoResultsWidget(message: "No rooms found"),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final room = filtered[index];

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
                    },
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(3, (index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 5.h,
                        ),
                        child: RoomCategoryCardWidgetShimmer(),
                      );
                    }),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
