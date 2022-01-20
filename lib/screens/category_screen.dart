import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:utem_foodie_admin/services/sidebar.dart';
import 'package:utem_foodie_admin/widgets/category/category_list_widget.dart';
import 'package:utem_foodie_admin/widgets/category/category_upload_widget.dart';

class CategoryScreen extends StatelessWidget {
  static const String id = "category-screen";
  CategoryScreen({Key? key}) : super(key: key);
  final SideBarWidget _sideBar = SideBarWidget();

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Color(0xFF212332),
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Categories', style: TextStyle(color: Colors.white)),
      ),
      sideBar: _sideBar.SideBarMenus(context, id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'category screen',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
              Text('Add New Categories and Sub Categories',
                  style: TextStyle(color: Colors.white)),
              Divider(thickness: 5),
              CategoryCreateWidget(),
              Divider(thickness: 5),
              CategoryListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
