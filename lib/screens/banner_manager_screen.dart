import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:utem_foodie_admin/services/sidebar.dart';
import 'package:utem_foodie_admin/widgets/banner/banner_upload_widget.dart';
import 'package:utem_foodie_admin/widgets/banner/banner_widget.dart';

class BannerScreen extends StatefulWidget {
  static const String id = "banner-screen";
  BannerScreen({Key? key}) : super(key: key);

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  SideBarWidget _sideBar = SideBarWidget();

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Color(0xFF212332),
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Banners'),
      ),
      sideBar: _sideBar.SideBarMenus(context, BannerScreen.id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'banner manager screen',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
              const Text(
                'Add / Delete Home Screen Baner Images',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const Divider(thickness: 5),
              BannerWidget(),
              const Divider(thickness: 5),
              const BannerUploadWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
