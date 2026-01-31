import 'package:evently_c17_str/providers/auth_provider.dart';
import 'package:evently_c17_str/providers/home_screen_provider.dart';
import 'package:evently_c17_str/screens/add_event/add_event_screen.dart';
import 'package:evently_c17_str/screens/home/tabs/favorite_tab.dart';
import 'package:evently_c17_str/screens/home/tabs/home_tab.dart';
import 'package:evently_c17_str/screens/home/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "homeScreen";

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenProvider(),
      builder: (context, child) {
        var homeScreenProvider = Provider.of<HomeScreenProvider>(context);
        var authProvider = Provider.of<AuthProvider>(context);

        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            actions: [
              Image.asset("assets/images/Sun.png"),
              SizedBox(width: 12),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  "EN",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(width: 12),
            ],
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back ✨",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  authProvider.userModel?.name ?? "",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: homeScreenProvider.selectedIndex,
            onTap: (index) {
              homeScreenProvider.changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/home-2.png")),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/heart.png")),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/user.png")),
                label: "Profile",
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, AddEventScreen.routeName);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(Icons.add, color: Colors.white, size: 35),
          ),

          body: tabs[homeScreenProvider.selectedIndex],
        );
      },
    );
  }

  List<Widget> tabs = [HomeTab(), FavoriteTab(), ProfileTab()];
}
