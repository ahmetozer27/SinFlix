import 'package:dating_app/presentation/pages/home/home_page.dart';
import 'package:dating_app/presentation/pages/main/state/bottom_nav_cubit.dart';
import 'package:dating_app/presentation/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/widgets/custom_nav_bar_item_widget.dart';
import 'components/widgets/custom_nav_bar_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = const [HomePage(), ProfilePage()];

  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit,int>(
        builder: (context, currentIndex) {
          return Scaffold(

            body: _pages[currentIndex],
            bottomNavigationBar: const CustomNavBarWidget(
              items: [
                Spacer(flex: 2,),
                Expanded(
                    flex: 6,
                    child: CustomNavBarItemWidget(icon: Icons.home_outlined, label: "Anasayfa", index:0)),
                Spacer(flex: 1,),
                Expanded(
                    flex: 6,
                    child: CustomNavBarItemWidget(icon: Icons.person, label: "Profil", index:1)),
                Spacer(flex: 2,)
              ],
            ),
          );
        }
    );
  }
}
