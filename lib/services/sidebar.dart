import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:utem_foodie_admin/screens/admin_users_screen.dart';
import 'package:utem_foodie_admin/screens/banner_manager_screen.dart';
import 'package:utem_foodie_admin/screens/category_screen.dart';
import 'package:utem_foodie_admin/screens/delivery_boy_screen.dart';
import 'package:utem_foodie_admin/screens/home_screen.dart';
import 'package:utem_foodie_admin/screens/login_screen.dart';
import 'package:utem_foodie_admin/screens/notification_screen.dart';
import 'package:utem_foodie_admin/screens/order_screen.dart';
import 'package:utem_foodie_admin/screens/settings_screen.dart';

import 'package:utem_foodie_admin/screens/splash_screen.dart';
import 'package:utem_foodie_admin/screens/vendor_screen.dart';

class SideBarWidget {
  SideBarMenus(context, selectedRoute) {
    return SideBar(
      textStyle: TextStyle(color: Colors.white),
      backgroundColor: Colors.deepOrangeAccent,
      activeBackgroundColor: Color(0xFF212332),
      activeIconColor: Colors.white,
      activeTextStyle: TextStyle(color: Colors.white),
      items: const [
        MenuItem(
          title: 'Dashboard',
          route: HomeScreen.id,
          icon: Icons.dashboard,
        ),
        MenuItem(
          title: 'Banners',
          route: BannerScreen.id,
          icon: CupertinoIcons.photo,
        ),
        MenuItem(
          title: 'Vendor',
          route: VendorScreen.id,
          icon: CupertinoIcons.group_solid,
        ),
        MenuItem(
          title: 'Delivery Boy',
          route: DeliveryBoyScreen.id,
          icon: Icons.delivery_dining,
        ),
        MenuItem(
          title: 'Categories',
          route: CategoryScreen.id,
          icon: Icons.category,
        ),
        MenuItem(
          title: 'Exit',
          route: LoginScreen.id,
          icon: Icons.exit_to_app,
        ),
      ],
      selectedRoute: selectedRoute,
      onSelected: (item) {
        if (item.route == LoginScreen.id) {
          User? user = FirebaseAuth.instance.currentUser;
          user!.delete();
          Navigator.of(context).pushReplacementNamed(item.route!);
        } else if (item.route != null) {
          Navigator.of(context).pushReplacementNamed(item.route!);
        }
      },
      header: Container(),
      footer: Container(),
    );
  }
}
