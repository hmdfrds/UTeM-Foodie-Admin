import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:utem_foodie_admin/services/sidebar.dart';
import 'package:utem_foodie_admin/widgets/vendor/vendor_datatable_widget.dart';

class VendorScreen extends StatefulWidget {
  static const String id = "vendor-screen";
  const VendorScreen({Key? key}) : super(key: key);

  @override
  _VendorScreenState createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  SideBarWidget _sideBar = SideBarWidget();
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Color(0xFF212332),
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text(
          'Vendor',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      sideBar: _sideBar.SideBarMenus(context, VendorScreen.id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Manage Vendor',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
              Text(
                'Manage All Vendors Activities',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Divider(thickness: 5),
              VendorDataTable(),
              Divider(thickness: 5),
            ],
          ),
        ),
      ),
    );
  }
}
